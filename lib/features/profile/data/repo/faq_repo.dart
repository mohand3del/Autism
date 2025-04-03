import 'package:autism/features/profile/data/model/faq_model.dart';

class FAQRepo {
  List<FAQ> getFAQs() {
    return [
      FAQ(
        question: "What is the AutismDetect system?",
        answer:
            "AutismDetect is an innovative application designed to assist in the early detection of autism in children. Utilizing advanced AI technologies, the system analyzes information such as questionnaire responses, photos, and children's drawings to provide insights into potential signs of autism. This helps parents take appropriate follow-up actions if needed.",
      ),
      FAQ(
        question: "How does the app work?",
        answer:
            "The app collects data through a customized questionnaire, a child's photo, and artwork like drawings or coloring. This data is processed using AI-based algorithms to assess the likelihood of autism. The results offer valuable insights into whether further medical evaluation may be necessary.",
      ),
      FAQ(
        question: "Can the results be trusted?",
        answer:
            "AutismDetect's results are based on scientifically validated algorithms and studies. While the app provides important indicators, it is intended to complement, not replace, professional medical advice. A consultation with a healthcare provider is recommended for a formal diagnosis.",
      ),
      FAQ(
        question: "Can parents use the app without medical knowledge?",
        answer:
            "Absolutely. AutismDetect is designed with user-friendly features for parents with no medical background. The app guides users through each step, offering clear explanations and easy-to-understand results.",
      ),
      FAQ(
        question: "Are children's data stored securely?",
        answer:
            "Yes, we take data security and privacy seriously. All personal data, including photos and responses, are encrypted and stored securely. We adhere to strict data protection regulations to ensure user privacy.",
      ),
      FAQ(
        question: "Does the app require an internet connection?",
        answer:
            "Yes, an internet connection is needed to upload data, perform AI analysis, and retrieve results. It is also required for accessing features like doctor communication and booking appointments.",
      ),
      FAQ(
        question:
            "How can I get medical consultation after receiving the results?",
        answer:
            "After receiving your child's results, you can connect with specialized doctors directly through the app. A list of available doctors, their specialties, and locations is provided, and you can easily book appointments from within the app.",
      ),
      FAQ(
        question: "What age range is the app intended for?",
        answer:
            "AutismDetect is designed for children between 2 and 6 years of age. This period is critical for early detection, as signs of autism often become noticeable during these formative years.",
      ),
      FAQ(
        question: "Does the app provide support after diagnosis?",
        answer:
            "Yes, the app offers a range of resources for parents after receiving a diagnosis. This includes educational videos, tips on managing autism, and direct communication with medical professionals and other parents via the community section.",
      ),
      FAQ(
        question: "Can I use the app to assess autism in more than one child?",
        answer:
            "Yes, you can add multiple profiles to your account and perform tests for each child individually. The app allows you to manage and track results for all your children in one place.",
      ),
      FAQ(
        question: "Is there a cost to using the app?",
        answer:
            "Many features of the app, including basic tests, are free. However, certain advanced features, such as personalized consultations with medical professionals, may require additional fees.",
      ),
      FAQ(
        question: "Can I share the test results with external doctors?",
        answer:
            "Yes, AutismDetect allows you to share test results with external healthcare providers. You can send the results via email or download them as a PDF for easy sharing.",
      ),
      FAQ(
        question: "Is the app based on scientific studies?",
        answer:
            "Yes, AutismDetect has been developed in collaboration with experts in psychology, artificial intelligence, and autism research. It is built upon the latest scientific findings in the field of autism detection.",
      ),
      FAQ(
        question: "How can I download the app?",
        answer:
            "You can download the app from major app stores, such as Google Play and the Apple App Store. Links to these stores are also available on our official website.",
      ),
      FAQ(
        question: "What is the Community section in the app?",
        answer:
            "The Community section is a platform for parents, caregivers, and doctors to interact, share experiences, and provide support. It's a space for exchanging advice, asking questions, and discussing topics related to autism care and management.",
      ),
      FAQ(
        question: "How can I join the Community?",
        answer:
            "To join the Community, you simply need to create an account in the app. Once registered, you can engage with other parents and professionals, participate in discussions, and share your experiences.",
      ),
      FAQ(
        question:
            "Can I communicate directly with doctors within the Community?",
        answer:
            "Yes, AutismDetect allows you to communicate with specialized doctors within the Community. You can ask questions, follow discussions, or engage in one-on-one conversations with professionals who specialize in autism care.",
      ),
    ];
  }
}
