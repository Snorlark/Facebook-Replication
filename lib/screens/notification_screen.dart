import 'package:flutter/material.dart';
import 'package:myapp/widgets/notifications.dart' as notif;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        notif.Notification(
          name: 'Lark',
          post: 'Hello World!',
          description: 'Check out my latest post about Flutter development!',
          date: 'January 20',
          numOfLikes: 10,
          imageUrl:
              'https://ckl-website-static.s3.amazonaws.com/wp-content/uploads/2023/09/flutter-app-development.jpg.webp',
        ),
        Divider(),
        notif.Notification(
          name: 'Sophia',
          post: 'Exploring Nature',
          description: 'Had an amazing day hiking in the mountains.',
          date: 'January 15',
          numOfLikes: 20,
          profileImageUrl:
              'https://randomuser.me/api/portraits/women/2.jpg',
          imageUrl:
              'https://images.pexels.com/photos/30342212/pexels-photo-30342212/free-photo-of-man-hiking-in-scenic-mountainous-landscape.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'Noah',
          post: 'Foodie Adventure',
          description: 'Tried some amazing dishes today at the local market.',
          date: 'January 12',
          numOfLikes: 15,
          imageUrl:
              'https://images.pexels.com/photos/30323220/pexels-photo-30323220/free-photo-of-hand-holding-italian-sandwich-at-all-antico-vinaio.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'Emma',
          post: 'Vacation Vibes',
          description: 'Loving the sunsets at the beach!',
          date: 'January 10',
          numOfLikes: 50,
          profileImageUrl:
              'https://randomuser.me/api/portraits/women/4.jpg',
          imageUrl:
              'https://images.pexels.com/photos/269583/pexels-photo-269583.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'Oliver',
          post: 'Tech Enthusiast',
          description: 'Unboxing the latest smartphone - stay tuned for reviews!',
          date: 'January 5',
          numOfLikes: 40,
          profileImageUrl:
              'https://randomuser.me/api/portraits/men/5.jpg',
          imageUrl:
              'https://images.pexels.com/photos/2643698/pexels-photo-2643698.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'Ava',
          post: 'Art & Creativity',
          description: 'Experimenting with watercolors. What do you think?',
          date: 'December 30',
          numOfLikes: 25,
          profileImageUrl:
              'https://randomuser.me/api/portraits/women/6.jpg',
          imageUrl:
              'https://images.pexels.com/photos/5220086/pexels-photo-5220086.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'William',
          post: 'Sports Lover',
          description: 'Cheering for my favorite team tonight!',
          date: 'December 25',
          numOfLikes: 18,
          profileImageUrl:
              'https://randomuser.me/api/portraits/men/7.jpg',
          imageUrl:
              'https://images.pexels.com/photos/2346/sport-high-united-states-of-america-ball.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'Isabella',
          post: 'Fashion & Style',
          description: 'Sharing my latest outfit ideas for winter!',
          date: 'December 20',
          numOfLikes: 30,
          profileImageUrl:
              'https://randomuser.me/api/portraits/women/8.jpg',
          imageUrl:
              'https://images.pexels.com/photos/6347546/pexels-photo-6347546.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'James',
          post: 'Gadget Geek',
          description: 'Building a custom gaming PC - part 1.',
          date: 'December 15',
          numOfLikes: 22,
          profileImageUrl:
              'https://randomuser.me/api/portraits/men/9.jpg',
          imageUrl:
              'https://images.pexels.com/photos/23439696/pexels-photo-23439696/free-photo-of-fan-and-graphics-card-of-computer.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        Divider(),
        notif.Notification(
          name: 'Mia',
          post: 'Travel Diaries',
          description: 'Exploring hidden gems in the city.',
          date: 'December 10',
          numOfLikes: 28,
          profileImageUrl:
              'https://randomuser.me/api/portraits/women/10.jpg',
          imageUrl:
              'https://images.pexels.com/photos/3047990/pexels-photo-3047990.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2r',
        ),
        Divider(),
      ],
    );
  }
}
