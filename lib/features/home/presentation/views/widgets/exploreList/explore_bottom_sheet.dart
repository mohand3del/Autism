import 'package:flutter/material.dart';

class ExploreBottomSheet extends StatelessWidget {
  const ExploreBottomSheet({super.key});

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
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
              const SizedBox(height: 24.0),
              const Text(
                "Filter",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                "Video Category",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildRadioButton("People & Blogs", "category", context),
              _buildRadioButton("Education", "category", context),
              _buildRadioButton("Science & Technology", "category", context),
              _buildRadioButton("Non profits & Autism", "category", context),
              _buildRadioButton("Documentary", "category", context),
              const SizedBox(height: 24.0),
              const Text(
                "Video Duration",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12.0),
              _buildRadioButton("Short", "duration", context),
              _buildRadioButton("Medium", "duration", context),
              _buildRadioButton("Long", "duration", context),
              const SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle Apply action
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 64.0, vertical: 12.0),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Apply",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // استخدام هذا الكود لإظهار الفلتر السفلي عند الحاجة
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showFilterBottomSheet(context),
          child: const Text('Show Filter'),
        ),
      ),
    );
  }
}

Widget _buildRadioButton(String title, String groupValue, BuildContext context) {
  return RadioListTile<String>(
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        color: Colors.black,
      ),
    ),
    value: title,
    groupValue: groupValue,
    onChanged: (value) {
      // معالجة التغيير هنا
    },
    activeColor: Colors.blue,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // تقليص حجم الراديو
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // تقليص منطقة النقر
  );
}
