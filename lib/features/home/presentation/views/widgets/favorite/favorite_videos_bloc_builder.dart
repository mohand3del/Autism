import 'package:autism/features/home/data/model/favorite_video_response_model.dart';
import 'package:autism/features/home/viewModel/favorateCubit/cubit/favorite_cubit.dart';
import 'package:autism/features/home/presentation/views/widgets/recommended_video_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_videos_list_view.dart';

class FavoriteVideosBlocBuilder extends StatefulWidget {
  const FavoriteVideosBlocBuilder({super.key});

  @override
  State<FavoriteVideosBlocBuilder> createState() =>
      _FavoriteVideosBlocBuilderState();
}

class _FavoriteVideosBlocBuilderState extends State<FavoriteVideosBlocBuilder> {
  final List<FullData> _favoriteVideos = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    // Initial load of favorite videos
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().getFavoriteVideos(skipVideo: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        if (state is Loading && _favoriteVideos.isEmpty) {
          setState(() {
            _isLoading = true;
            _hasError = false;
          });
        } else if (state is Success) {
          setState(() {
            _isLoading = false;
            _hasError = false;

            // Add all videos from the response to the list
            if (state.data.fullData.videos.isNotEmpty) {
              _favoriteVideos.addAll(state.data.fullData.videos.map((video) =>
                  FullData(
                      videos: [video],
                      channels: state.data.fullData.channels)));
            }
          });
        } else if (state is Error) {
          setState(() {
            _isLoading = false;
            _hasError = true;
            _errorMessage = state.error;
          });
        }
      },
      builder: (context, state) {
        if (_isLoading && _favoriteVideos.isEmpty) {
          return setupLoading();
        } else if (_hasError && _favoriteVideos.isEmpty) {
          return setupError();
        } else {
          if (_favoriteVideos.isEmpty) {
            return setupEmptyState();
          } else {
            return FavoriteVideosListView(favoriteData: _favoriteVideos);
          }
        }
      },
    );
  }

  Widget setupLoading() {
    return const RecommendedVideoSkeleton();
  }

  Widget setupError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            'Failed to load favorites: $_errorMessage',
            style: const TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
                _hasError = false;
              });
              context.read<FavoriteCubit>().getFavoriteVideos(skipVideo: 0);
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget setupEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No favorite videos yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Add videos to your favorites to see them here',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
