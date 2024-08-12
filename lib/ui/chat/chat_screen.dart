// import 'package:flutter/material.dart';

// import 'package:ivy/ui/chat/chat_details.dart';
// import 'package:ivy/widgets/custom_appbar.dart';
// import 'package:ivy/widgets/custom_navigator.dart';

// class ChatScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> chats = [
//     {"name": "Rishi07.iit", "message": "Hello", "time": "15:00", "unread": 1},
//     {"name": "Saket09.iit", "message": "Hello", "time": "15:00", "unread": 1},
//     {"name": "Kriti.iit", "message": "Hello", "time": "15:00", "unread": 1},
//     {"name": "Lavish04.iit", "message": "Hello", "time": "15:00", "unread": 1},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'Chats',
//         isBackButton: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 hintText: 'Search for tags and users',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ChoiceChip(label: Text('All'), selected: true),
//                 ChoiceChip(label: Text('Unread'), selected: false),
//                 ChoiceChip(label: Text('Not a friend'), selected: false),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: chats.length,
//               itemBuilder: (context, index) {
//                 final chat = chats[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     radius: 20,
//                     backgroundImage: NetworkImage(
//                         'https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'),
//                   ),
//                   title: Text(chat["name"]),
//                   subtitle: Text(chat["message"]),
//                   onTap: () {
//                     CustomNavigator(
//                         context: context,
//                         screen: ChatDetailScreen(
//                           name: '',
//                           email: '',
//                         )).pushReplacement();
//                   },
//                   trailing: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(chat["time"]),
//                       CircleAvatar(
//                         radius: 10,
//                         backgroundColor: Colors.blue,
//                         child: Text(
//                           "${chat["unread"]}",
//                           style: TextStyle(color: Colors.white, fontSize: 12),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ivy/ui/chat/chat_details.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_navigator.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {"name": "Rishi07.iit", "message": "Hello", "time": "15:00", "unread": 1},
    {"name": "Saket09.iit", "message": "Hello", "time": "15:00", "unread": 1},
    {"name": "Kriti.iit", "message": "Hello", "time": "15:00", "unread": 1},
    {"name": "Lavish04.iit", "message": "Hello", "time": "15:00", "unread": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Chats',
        isBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for tags and users',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(label: Text('All'), selected: true),
                ChoiceChip(label: Text('Unread'), selected: false),
                ChoiceChip(label: Text('Not a friend'), selected: false),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'),
                  ),
                  title: Text(chat["name"]),
                  subtitle: Text(chat["message"]),
                  onTap: () {
                    CustomNavigator(
                        context: context,
                        screen: ChatDetailScreen(
                          name: '',
                          email: '',
                        )).pushReplacement();
                  },
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chat["time"]),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                        child: Text(
                          "${chat["unread"]}",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
