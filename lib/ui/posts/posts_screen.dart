import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final String content;
  final int likes;
  final int comments;
  final int shares;

  const PostWidget({
    required this.username,
    required this.avatarUrl,
    required this.content,
    required this.likes,
    required this.comments,
    required this.shares,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 8),
                Text(username,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {},
                  child: const Text(
                    'Follow',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(content),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up),
                    const SizedBox(width: 4),
                    Text('$likes'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.comment),
                    const SizedBox(width: 4),
                    Text('$comments'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.share),
                    const SizedBox(width: 4),
                    Text('$shares'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
