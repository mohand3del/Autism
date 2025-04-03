import 'package:autism/features/about/data/model/about_model.dart';

class AboutRepo {
  AboutModel getAboutInfo() {
    return AboutModel(
      aboutApp:
          "AutismDetect is a free mobile app launched in 2024 for parents of children, focusing on early detection and management of autism. It analyzes children's facial images and drawings and uses questionnaires to identify symptoms. The app offers educational resources and a booking system for healthcare professionals. Additionally, it fosters a supportive community for parents to connect and share experiences.",
      teamName: "365-Developed",
      teamMembers: [
        TeamMember(
          name: "Mohamed Nasr",
          role: "Back-End Developer & Deep Learning Engineer",
          link: "https://www.linkedin.com/in/mohamed-nasr-68b62b243/",
          image:
              "https://autism-app.onrender.com/api/v1/images/portfoilo/Mohamed-Nasr.jpg",
        ),
        TeamMember(
          name: "Mohaned Adel",
          role: "Flutter Developer & Machine Learning Engineer",
          link: "https://www.linkedin.com/in/mohand-adel-034013189/",
          image:
              "https://autism-app.onrender.com/api/v1/images/portfoilo/Mohaned-Adel.jpg",
        ),
        TeamMember(
          name: "Mohamed Mahmoud",
          role: "Machine Learning & Deep Learning Engineer",
          link: "https://www.linkedin.com/in/muhammadmahmoudfci/",
          image:
              "https://autism-app.onrender.com/api/v1/images/portfoilo/Mohamed-Mahmoud.jpg",
        ),
        TeamMember(
          name: "Mohamed Abdelaleem",
          role: "Machine Learning & Deep Learning Engineer",
          link: "https://www.linkedin.com/in/mohammed-abdelaleem-b100992a3/",
          image:
              "https://autism-app.onrender.com/api/v1/images/portfoilo/Mohamed-Abdelaleem.jpg",
        ),
        TeamMember(
          name: "Lamia Fekry",
          role: "Front-End Developer & Ui/Ux Designer",
          link: "https://www.linkedin.com/in/lamia-fekry-1a146826a/",
          image:
              "https://autism-app.onrender.com/api/v1/images/portfoilo/Lamia-Fekry.jpg",
        ),
        TeamMember(
          name: "Nourhan Mahmoud",
          role: "Front-End Developer & Ui/Ux Designer",
          link: "https://www.linkedin.com/in/nourhan-mahmoud-20323a299/",
          image:
              "https://autism-app.onrender.com/api/v1/images/portfoilo/Nourhan-Mahmoud.jpg",
        ),
      ],
    );
  }
}
