class FAQ {
  final String question;
  final String answer;

  FAQ({
    required this.question,
    required this.answer,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}
