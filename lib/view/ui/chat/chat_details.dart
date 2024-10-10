import 'package:flutter/material.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/view/ui/initial/initial_screen.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String email;

  ChatDetailScreen({required this.name, required this.email});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<Map<String, String>> messages = [
    {
      "sender": "Rishi07.iit",
      "message":
          "I commented on Figma, I want to add some fancy icons. Do you have any icon set?"
    },
    {"sender": "Me", "message": "I am in a process of designing some. When do"},
    {"sender": "Rishi07.iit", "message": "Next month?"},
    {
      "sender": "Me",
      "message":
          "I am almost finished. Please give me your email, I will ZIP them and send you as"
    },
    {"sender": "Rishi07.iit", "message": "maciej.kowalski@email.com"},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        messages.add({"sender": "Me", "message": text});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rishi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            CustomNavigator(context: context, screen: InitialScreen(index: 2))
                .pushAndRemoveUntil();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final chat = messages[index];
                return ChatBubble(
                  sender: chat["sender"]!,
                  message: chat["message"]!,
                  isMe: chat["sender"] == "Me",
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String sender;
  final String message;
  final bool isMe;

  ChatBubble({required this.sender, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
