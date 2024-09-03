import 'dart:developer';

import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchRow extends StatefulWidget {
  const CustomSearchRow({super.key});

  @override
  _CustomSearchRowState createState() => _CustomSearchRowState();
}

class _CustomSearchRowState extends State<CustomSearchRow> {
  String? selectedCategory;
  String? selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 22 / 393,),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: context.width * 298 / 393,


            child: AppTextFormField(
              hintText: "Search",
              validator: (value) {},
              prefixIcon: const Icon(Icons.search, size: 30, color: Colors.grey),
            )),
        GestureDetector(
            onTap: () {
              _showFilterBottomSheet(context);
            },
            child: Image.asset("assets/images/filterIcon.png"))
      ]),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                  verticalSpace(context.height * 15 / 852),
                  Text("Filter",
                      style: AppStyles.medium22(context).copyWith(
                        fontFamily: "Poppins",
                      )),
                  verticalSpace(context.height * 21 / 852),
                  Text("Video Category",
                      style: AppStyles.medium18(context).copyWith(
                        fontFamily: "Poppins",
                      )),
                  verticalSpace(context.height * 10 / 852),
                  _buildRadioButton("People & Blogs", "category", context, setState),
                  _buildRadioButton("Education", "category", context, setState),
                  _buildRadioButton("Science & Technology", "category", context, setState),
                  _buildRadioButton("Non profits & Autism", "category", context, setState),
                  _buildRadioButton("Documentary", "category", context, setState),
                  verticalSpace(context.height * 10 / 852),
                  Text("Video Duration",
                      style: AppStyles.medium18(context).copyWith(
                        fontFamily: "Poppins",
                      )),
                  verticalSpace(context.height * 10 / 852),
                  _buildRadioButton("Short", "duration", context, setState),
                  _buildRadioButton("Medium", "duration", context, setState),
                  _buildRadioButton("Long", "duration", context, setState),
                  verticalSpace(context.height * 37 / 852),
                  CustomBottom(
                    text: "Apply",
                    onPressed: () {
                      Navigator.pop(context);
                      _applyFilters();
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRadioButton(String title, String groupValue, BuildContext context, StateSetter setState) {
    return Transform.scale(
      scale: 0.9,
      child: RadioListTile<String>(
        title: Text(
          title,
          style: AppStyles.regular14(context).copyWith(
            fontFamily: 'Poppins',
          ),
        ),
        value: title,
        groupValue: groupValue == "category" ? selectedCategory : selectedDuration,
        onChanged: (value) {
          setState(() {
            if (groupValue == "category") {
              selectedCategory = value;
            } else {
              selectedDuration = value;
            }
          });
        },
        activeColor: Colors.blue,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        contentPadding: const EdgeInsets.only(left: -8.0, top: -8.0, bottom: -8.0),
      ),
    );
  }

  void _applyFilters() {

    log("Selected Category: $selectedCategory");
    log("Selected Duration: $selectedDuration");

  }
}
