import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/widgets/custom_back_arrow.dart';
import 'package:autism/features/profile/data/model/faq_model.dart';
import 'package:autism/features/profile/data/repo/faq_repo.dart';
import 'package:flutter/material.dart';

class FqasViewBody extends StatelessWidget {
  FqasViewBody({super.key});

  final FAQRepo _faqRepo = FAQRepo();

  @override
  Widget build(BuildContext context) {
    final List<FAQ> faqs = _faqRepo.getFAQs();

    return Column(
      children: [
        Row(
          children: [
            CustomBackArrow(),
            Padding(
              padding: EdgeInsets.only(
                top: context.height * 0.095,
                left: context.width * 0.063,
              ),
              child: Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: faqs.length,
            separatorBuilder: (context, index) => Divider(
              color: AppColors.grey.withOpacity(0.3),
              thickness: 1.0,
              height: 1.0,
            ),
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(faqs[index].question,
                    style: AppStyles.medium16(context).copyWith(
                      color: AppColors.black,
                      fontFamily: 'Poppins',
                    )),
                // Customize the arrow icon here
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.grey,
                ),
                iconColor: AppColors.black,
                collapsedIconColor: AppColors.grey,
                // Remove borders when expanded
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(faqs[index].answer,
                        style: AppStyles.regular16(context).copyWith(
                          color: AppColors.grey,
                          fontFamily: 'Poppins',
                        )),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
