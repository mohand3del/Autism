import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/test/presentation/view/tell_us_about_view.dart';
import 'package:autism/features/test/presentation/view/widget/test_view_body.dart';
import 'package:flutter/material.dart';

class MethodSelectionPage extends StatefulWidget {
  const MethodSelectionPage({super.key});

  @override
  _MethodSelectionPageState createState() => _MethodSelectionPageState();
}

class _MethodSelectionPageState extends State<MethodSelectionPage> {
  final List<String> _methods = ['Form', 'Picture', 'Drawing', 'Coloring', 'Hand Right'];

  final List<String> _selectedMethods = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.width * 20 / 852),
              child: Divider(),
            ),
            verticalSpace(context.height * 20 / 852),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Choose Method Testing",
                style: AppStyles.medium22(context).copyWith(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.start,
              ),
            ),
            verticalSpace(context.height * 25 / 852),
            SizedBox(
              height: context.height * 350 / 852,
              child: ListView.builder(
                itemCount: _methods.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedMethods.contains(_methods[index])) {
                            _selectedMethods.remove(_methods[index]);
                          } else {
                            _selectedMethods.add(_methods[index]);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedMethods.contains(_methods[index])
                                ? Colors.blue
                                : Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: _selectedMethods.contains(_methods[index]),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedMethods.add(_methods[index]);
                                  } else {
                                    _selectedMethods.remove(_methods[index]);
                                  }
                                });
                              },
                              activeColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Text(
                              _methods[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpace(context.height * 85 / 852),
            Center(
              child: CustomBottom(text: "Continue", onPressed: () {

                if (_selectedMethods.isEmpty) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select at least one method!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TellUsAboutView(
                        totalFormQuestions: 10,
                        selectedMethods: _selectedMethods,
                      ),
                    ),
                  );
                }




              }),
            )
          ],
        ),
      ),
    );
  }
}



