import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/network/api_constant.dart';
import 'package:autism/features/about/data/model/about_model.dart';
import 'package:autism/features/about/viewModel/about_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  int _currentMemberIndex = 0;
  String? _authToken;

  @override
  void initState() {
    super.initState();
    // Get authentication token
    _getAuthToken();
    context.read<AboutCubit>().fetchAboutInfo();
  }

  Future<void> _getAuthToken() async {
    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    log("Token for image loading: $token");
    if (mounted) {
      setState(() {
        _authToken = token;
      });
    }
  }

  // Get direct image URL with authentication
  String getAuthenticatedImageUrl(String imageUrl) {
    // Log the original URL for debugging
    log("Original image URL: $imageUrl");

    // Check if the URL already has a token or is an absolute URL
    if (imageUrl.contains('token=') || imageUrl.startsWith('https')) {
      return imageUrl;
    }

    // If the URL is relative, make it absolute with the base API URL
    final String fullUrl = imageUrl.startsWith('/')
        ? '${ApiConstants.apiBaseUrl}${imageUrl.substring(1)}'
        : '${ApiConstants.apiBaseUrl}$imageUrl';

    // Add token as a query parameter
    final String urlWithToken = _authToken != null && _authToken!.isNotEmpty
        ? '$fullUrl?token=$_authToken'
        : fullUrl;

    log("Modified image URL: $urlWithToken");
    return urlWithToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (aboutInfo) => _buildContent(aboutInfo),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }

  Widget _buildContent(AboutModel aboutInfo) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // About App Section
            Text(
              'About App',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              aboutInfo.aboutApp,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),

            // Team Section
            Text(
              'Our Team: ${aboutInfo.teamName}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),

            // Team Member Carousel
            if (aboutInfo.teamMembers.isNotEmpty)
              _buildTeamMemberCarousel(aboutInfo),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // Website Link Section
            Text(
              'Website Link',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            _buildWebsiteLink(aboutInfo),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCarousel(AboutModel aboutInfo) {
    final teamMembers = aboutInfo.teamMembers;
    if (teamMembers.isEmpty) return const SizedBox();

    // Ensure index is valid
    _currentMemberIndex = _currentMemberIndex.clamp(0, teamMembers.length - 1);
    final currentMember = teamMembers[_currentMemberIndex];

    // Get authenticated image URL
    final String imageUrl = getAuthenticatedImageUrl(currentMember.image);

    return Column(
      children: [
        // Navigation Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 20),
              onPressed: _currentMemberIndex > 0
                  ? () => setState(() => _currentMemberIndex--)
                  : null,
              color: _currentMemberIndex > 0 ? Colors.blue : Colors.grey[300],
            ),
            Expanded(
              child: Text(
                currentMember.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 20),
              onPressed: _currentMemberIndex < teamMembers.length - 1
                  ? () => setState(() => _currentMemberIndex++)
                  : null,
              color: _currentMemberIndex < teamMembers.length - 1
                  ? Colors.blue
                  : Colors.grey[300],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Member Image with authentication
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) {
                // Log the error for debugging
                log("Image error: $error for URL: $url");
                return const Icon(Icons.person, size: 50);
              },
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // University or Organization
        Text(
          currentMember.role,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _buildWebsiteLink(AboutModel aboutInfo) {
    // Assuming the first team member has a relevant link
    // You may want to add a dedicated field in your AboutModel for this
    final link = aboutInfo.teamMembers.isNotEmpty
        ? aboutInfo.teamMembers[0].link
        : 'https://www.autism-society.org/what-is-autism/';

    return InkWell(
      onTap: () => _launchURL(link),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'What is Autism -Autism Research',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }
}
