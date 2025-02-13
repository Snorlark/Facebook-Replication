import 'package:flutter/material.dart';
import 'package:myapp/widgets/notifications.dart' as notif;

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        notif.Notification(
          name: 'Worked at GDSC',
          post: 'Chief Technological Officer (CTO)',
          description: 'Led the tech initiatives and managed development projects at GDSC NU Manila.',
          date: 'September 2023',
          atProfile: true,
          numOfLikes: 0,
        ),
        Divider(),
        notif.Notification(
          name: 'Achievement',
          post: 'Ideathon GDSC',
          description: 'Won as one of the top teams for the Ideathon GDSC with the EcoDex project.',
          date: 'August 2023',
          atProfile: true,
          numOfLikes: 12,
        ),
        Divider(),
        notif.Notification(
          name: 'Passion Project',
          post: 'TouchMyDeck',
          description: 'Developed an engaging Android app sorting game during the Application Development course.',
          date: 'July 2023',
          atProfile: true,
          numOfLikes: 8,
        ),
        Divider(),
      ],
    );
  }
}
