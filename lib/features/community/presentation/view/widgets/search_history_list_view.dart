

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchHistoryListView extends StatelessWidget {
  const SearchHistoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var itemCount = 10;
    return Expanded(

      child: ListView.builder(
          itemCount: itemCount,

          itemBuilder:

              (context, index) {

            return Padding(
              padding:  EdgeInsets.only(left: 36,top: index == 0 ? 27 : 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle notification icon click
                        },
                        icon: SvgPicture.asset('assets/images/explore_search_icon.svg',color:AppColors.black,),
                        // Adjust the size as needed
                      ),
                      Text('Dr. Mohand',
                        style: AppStyles.regular16(context).copyWith(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  if(index == itemCount - 1)
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Text(
                          "Clear History",
                          style: AppStyles.regular16(context).copyWith(
                            color: AppColors.primaryColor,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }


      ),
    );
  }
}