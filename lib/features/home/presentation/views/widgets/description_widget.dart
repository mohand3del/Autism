import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 22 / 393),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style:AppStyles.medium13(context).copyWith(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
             verticalSpace(context.height*10/852),
              Text(
                _isExpanded
                    ? widget.description
                    : widget.description.length > 50
                    ? widget.description.substring(0, 30) + '...'
                    : widget.description,
                maxLines: _isExpanded ? null : 2, // Expanded shows full text
                overflow:
                _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                style: AppStyles.regular12(context).copyWith(
                  color: Color(0xff828A97),
                  fontFamily: 'Poppins',
                ),
              ),
              GestureDetector(
                onTap: _toggleExpanded,
                child: Text(
                  _isExpanded ? 'less...' : 'more...',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
