import 'package:autism/core/di/di.dart';
import 'package:autism/features/test/viewModel/form_cubit/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:autism/features/test/presentation/view/widget/question_section.dart';
import 'package:autism/features/test/presentation/view/widget/image_method_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_bar_back_arrow.dart';

class TestViewBody extends StatefulWidget {
  final int totalFormQuestions;
  final List<String> selectedMethods;

  TestViewBody({
    required this.totalFormQuestions,
    required this.selectedMethods,
  });

  @override
  _TestViewBodyState createState() => _TestViewBodyState();
}

class _TestViewBodyState extends State<TestViewBody> {
  int _currentStep = 1;
  int _currentFormStep = 1;
  int _currentImageStep = 1;
  bool hasFormMethod = false;

  @override
  void initState() {
    super.initState();

    hasFormMethod = widget.selectedMethods.contains('Form');


    if (!hasFormMethod) {
      _currentStep = 2; // ا
    } else {
      _currentStep = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalSteps = hasFormMethod ? 2 : 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomBarBackArrow(
              title: _currentStep == 1 && hasFormMethod ? "Form" : "Images",
            ),
            verticalSpace(context.height * 20 / 852),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 16 / 393),
              child: StepProgressIndicator(
                totalSteps: totalSteps,
                currentStep: _currentStep,
                size: 6,
                padding: 4,
                selectedColor: Colors.blue,
                unselectedColor: Colors.grey[300]!,
                roundedEdges: const Radius.circular(3),
              ),
            ),
            verticalSpace(context.height * 8 / 852),
            Expanded(
              child: _currentStep == 1 && hasFormMethod
                  ? BlocProvider(
                create: (context) => FormCubit(getIt()),
                child: QuestionSection(
                  selectedMethods: widget.selectedMethods,
                  hasMoreMethods: hasFormMethod,
                  currentFormStep: _currentFormStep,
                  totalFormQuestions: widget.totalFormQuestions,
                  onBackStep: () {
                    setState(() {
                      if (_currentFormStep > 1) {
                        _currentFormStep--;
                      }
                    });
                  },
                  onNextStep: () {
                    setState(() {
                      if (_currentFormStep < widget.totalFormQuestions) {
                        _currentFormStep++;
                      } else {
                        _currentStep = 2;
                        _currentImageStep = 1;
                      }
                    });
                  },
                  onSubmit: () {
                    setState(() {
                      if (_currentFormStep < widget.totalFormQuestions) {
                        _currentFormStep++;
                      } else {
                        _currentStep = 2;
                        _currentImageStep = 1;
                      }
                    });
                  },
                ),
              )
                  : ImageMethodSection(
                currentImageStep: _currentImageStep,
                selectedMethods: widget.selectedMethods.where((method) => method != 'Form').toList(),
                onNextStep: () {
                  setState(() {
                    if (_currentImageStep <
                        widget.selectedMethods
                            .where((method) => method != 'Form')
                            .length) {
                      _currentImageStep++;
                    } else {
                      _currentStep = 1;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';+
// import 'package:autism/features/test/presentation/view/widget/question_section.dart';
// import 'package:autism/features/test/presentation/view/widget/image_method_section.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:autism/core/utils/extentions.dart';
// import 'package:autism/core/utils/spacing.dart';
// import 'package:autism/features/home/presentation/views/widgets/custom_bar_back_arrow.dart';
//
// class TestViewBody extends StatefulWidget {
//   final int totalFormQuestions;
//   final List<String> selectedMethods;
//
//   TestViewBody({
//     required this.totalFormQuestions,
//     required this.selectedMethods,
//   });
//
//   @override
//   _TestViewBodyState createState() => _TestViewBodyState();
// }
//
// class _TestViewBodyState extends State<TestViewBody> {
//   int _currentStep = 1;
//   int _currentFormStep = 1;
//   int _currentImageStep = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     int totalImageQuestions = widget.selectedMethods.length;
//     int totalSteps = totalImageQuestions <= 1 ? 1 : 2;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             CustomBarBackArrow(
//               title: _currentStep == 1 ? "Form" : "Images",
//             ),
//             verticalSpace(context.height * 20 / 852),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
//               child: StepProgressIndicator(
//                 totalSteps: totalSteps,
//                 currentStep: _currentStep,
//                 size: 6,
//                 padding: 4,
//                 selectedColor: Colors.blue,
//                 unselectedColor: Colors.grey[300]!,
//                 roundedEdges: const Radius.circular(3),
//               ),
//             ),
//             verticalSpace(context.height * 20 / 852),
//             Expanded(
//               child: _currentStep == 1
//                   ? QuestionSection(
//                       currentFormStep: _currentFormStep,
//                       totalFormQuestions: widget.totalFormQuestions,
//                       onBackStep: () {
//                         setState(() {
//                           if (_currentFormStep > 1) {
//                             _currentFormStep--;
//                           }
//                         });
//                       },
//                       onNextStep: () {
//                         setState(() {
//                           if (_currentFormStep < widget.totalFormQuestions) {
//                             _currentFormStep++;
//                           } else {
//                             _currentStep = 2;
//                             _currentImageStep = 1;
//                           }
//                         });
//                       },
//                       onSubmit: () {
//                         setState(() {
//                           if (_currentFormStep < widget.totalFormQuestions) {
//                             _currentFormStep++;
//                           } else {
//                             _currentStep = 2;
//                             _currentImageStep = 1;
//                           }
//                         });
//                       },
//                     )
//                   : ImageMethodSection(
//                       currentImageStep: _currentImageStep,
//                       selectedMethods: widget.selectedMethods,
//                       onNextStep: () {
//                         setState(() {
//                           if (_currentImageStep <
//                               widget.selectedMethods.length) {
//                             _currentImageStep++;
//                           } else {
//                             // Handle finish or submit
//                           }
//                         });
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
