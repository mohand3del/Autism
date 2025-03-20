import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChannelCardItem extends StatelessWidget {
  const ChannelCardItem({super.key, this.fullDatum});
  final FullDatum? fullDatum;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 24 / 393,
            vertical: context.height * 10 / 852),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      25.0), // Same radius as the CircleAvatar
                  child: CachedNetworkImage(
                    // Replace with a local placeholder image
                    imageUrl: fullDatum!.thumbnails.medium.url,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fadeInDuration: const Duration(
                        milliseconds: 500), // Replace with your image URL
                    fit: BoxFit.cover, // Adjust fit as needed
                  ),
                ),
              ),
              horizontalSpace(context.width * 12 / 393),
              // Profile Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Helper.limitWords(fullDatum?.title ?? "Autism", 2),
                      style: AppStyles.medium18(context).copyWith(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      )),
                  Text(
                    Helper.limitWords(fullDatum?.customUrl ?? "Autism", 2),
                    style: AppStyles.regular12(context).copyWith(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                    ),
                  ),
                  verticalSpace(context.height * 4 / 852),
                  Row(
                    children: [
                      Text(
                          Helper.formatNumber(
                                fullDatum?.subscriberCount,
                              ) ??
                              "Autism",
                          style: AppStyles.regular14(context).copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                          )),
                      horizontalSpace(context.width * 12 / 393),
                      Text(Helper.limitWords(fullDatum?.videoCount, 2),
                          style: AppStyles.regular14(context).copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
