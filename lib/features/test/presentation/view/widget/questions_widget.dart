// import 'package:autism/core/utils/app_styles.dart';
// import 'package:autism/core/utils/extentions.dart';
// import 'package:autism/core/utils/spacing.dart';
// import 'package:flutter/material.dart';
//
// class QuestionWidget extends StatefulWidget {
//   @override
//   _QuestionWidgetState createState() => _QuestionWidgetState();
// }
//
// class _QuestionWidgetState extends State<QuestionWidget> {
//   String? _selectedOption;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: context.width * 24 / 393,
//         right: context.width * 24 / 393,
//         bottom: context.height * 35 / 852,
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: const Color(0xff2B7FFD).withOpacity(0.15),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//
//           children: [
//              Text(
//               '1. Does your child look at you when you call his/her name?',
//               style: AppStyles.medium20(context).copyWith(
//                 fontFamily: "Poppins",
//               )
//             ),
//            verticalSpace(context.height * 16 / 852),
//             _buildOption('Yes'),
//            verticalSpace(context.height * 8 / 852),
//             _buildOption('No'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOption(String option) {
//     return Container(
//       height: 50,
//       width: 272,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//
//         children: [
//           Radio<String>(
//             value: option,
//             groupValue: _selectedOption,
//             onChanged: (String? value) {
//               setState(() {
//                 _selectedOption = value;
//               });
//             },
//           ),
//           Text(option),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final String questionText;
  final List<String> options;
  final void Function(String) onOptionSelected;

  const QuestionWidget({super.key, 
    required this.questionText,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? _selectedOption;

  @override
  void didUpdateWidget(covariant QuestionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset selected option when the question changes
    if (widget.questionText != oldWidget.questionText) {
      setState(() {
        _selectedOption = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 24 / 393,
        right: MediaQuery.of(context).size.width * 24 / 393,
        bottom: MediaQuery.of(context).size.height * 35 / 852,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xff2B7FFD).withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.questionText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...widget.options.map((option) => _buildOption(option)),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: option,
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                  widget.onOptionSelected(value!);
                });
              },
            ),
            Expanded(
              child: Text(
                option,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
