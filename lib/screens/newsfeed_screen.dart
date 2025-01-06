import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          numOfLikes: 2000,
          date: 'October 11',
          imageUrl:
              'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium',
          profileImageUrl:
              'https://image.petmd.com/files/inline-images/shiba-inu-black-and-tan-colors.jpg?VersionId=pLq84BEOjdMjXeDCUJJJLFPuIWYsVMUU',
        ),
        PostCard(
          userName: 'Roben Juanatas',
          postContent: 'Kicking off the holiday season with ICpEP-NCR!',
          numOfLikes: 200,
          date: 'December 2',
        ),
        PostCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          date: 'October 11',
        ),
      ],
    );
  }
}
