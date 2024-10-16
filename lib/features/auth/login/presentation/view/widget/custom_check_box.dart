import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomCheckBox({
    super.key,
    this.isChecked = false,
    required this.onChanged,
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: Container(
        width: context.width * 0.05,
        height: context.height * 0.023,
        decoration: BoxDecoration(
          color: isChecked ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: isChecked ? AppColors.primaryColor : AppColors.grey,
            width: 1.0,
          ),
        ),
        child: isChecked
            ? const Icon(
          Icons.check,
          size: 16.0,
          color: Colors.white,
        )
            : null,
      ),
    );
  }
}