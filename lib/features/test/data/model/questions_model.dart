

class QuestionModel {
  final String question;
  final List<String> options;
  String? selectedOption;

  QuestionModel({
    required this.question,
    required this.options,
    this.selectedOption,
  });
}