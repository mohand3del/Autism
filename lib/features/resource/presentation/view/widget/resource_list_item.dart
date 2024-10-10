

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/extentions.dart';

import 'package:flutter/material.dart';

import '../../../data/model/recource_response_body.dart';

class ResourceListItem extends StatelessWidget {
  const ResourceListItem({super.key, this.data});
  final FullDatum? data;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Container(
        width:double.infinity,
        height:context.height * 99 / 851,
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 3),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFCFDFF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),

          ],
        ),
        child: Row(
          children: [
            Container(
              width: context.width * 100 / 375,
              height: context.height * 90 / 851,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFE5E5E5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              child: Image.network(
                data?.thumbnail ?? data?.favicon ?? 'https://zindee.com/product/autism-awareness-download/',
                width: context.width * 100 / 375,
                height: context.height * 90 / 851,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: context.width * 10 / 375,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width * 200 / 393,
                  child:  Text(
                   data?.title ?? '',
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: context.height * 5 / 851,
                ),
                SizedBox(
                  width: context.width * 200 / 393,
                  child:  Text(
                   data?.source ?? '',
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,

                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: context.height * 5 / 851,
                ),
                SizedBox(
                  width: context.width * 200 / 393,
                  child:   Text(
                    data?.link ?? '',
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
