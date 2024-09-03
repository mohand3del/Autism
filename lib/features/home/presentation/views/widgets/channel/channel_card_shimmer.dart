import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChannelCardShimmer extends StatelessWidget {
  const ChannelCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Shimmer effect for profile image
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    // Shimmer effect for text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 16.0,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          width: 80,
                          height: 14.0,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 12.0,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(width: 8.0),
                            Container(
                              width: 60,
                              height: 12.0,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0), // Add spacing between the shimmer items if needed
      ],
    );
  }
}
