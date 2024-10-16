import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
      child: Row(
        children: [
          SizedBox(
            height: context.height * 50 / 852,
            width: context.width * 50 / 393,
            child:  const CircleAvatar(
              radius: 54,
              backgroundImage: AssetImage('assets/images/userImage.png'),
            ),
          ),
          horizontalSpace(context.width * 12 / 393),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Welcome!',
                style: AppStyles.regular16(context).copyWith(
                  fontFamily: "Poppins",
                  color: const Color(0xff989898),
                ),
              ),
              Text(
                name,
                style: AppStyles.medium20(context).copyWith(
                  color: AppColors.black,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
          icon : Center(child: SvgPicture.asset("assets/images/fav_video_icon.svg")),
            color: AppColors.black, onPressed: () {  },

          ),
        ],
      ),


    );
  }
}
