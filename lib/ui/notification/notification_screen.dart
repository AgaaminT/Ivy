// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ivy/widgets/custom_text_widget.dart';

// import '../../widgets/custom_appbar.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
// appBar: const CustomAppBar(
//   title: ('notifications'),
//   isBackButton: true,
// ),
//       body: Padding(
//         padding: EdgeInsets.all(10.h),
//         child: const SingleChildScrollView(
//           child: Column(
//             children: [
//               // buildNotificationContainer(
//               //     context.translate(TranslationConstants.today), borderColor),
//               // buildNotificationContainer(
//               //     context.translate(TranslationConstants.yesterday),
//               //     borderColor),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container buildNotification(
//     BuildContext context,
//     String notificationText,
//     String time,
//     Color borderColor,
//   ) {
//     return Container(
//         margin: EdgeInsets.only(bottom: 2.h),
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: Colors.blueGrey.shade100,
//             borderRadius: BorderRadius.circular(4.h)),
//         child: ListTile(
//           leading: CircleAvatar(
//             radius: 18.h,
//             backgroundColor: borderColor,
//             child: const Icon(Icons.person, color: Colors.white),
//           ),
//           horizontalTitleGap: 8.h,
//           title: customTextWidget('Your Leave has been approved!'),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 4.h),
//               customTextWidget('09:20 PM',
//                   fontSize: 12.h, color: Colors.grey.shade600),
//             ],
//           ),
//         ));
//   }

//   Column buildNotificationContainer(title, Color borderColor) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         customTextWidget(title,
//             fontWeight: FontWeight.bold, color: Colors.grey),
//         SizedBox(height: 6.h),
//         ListView.builder(
//             itemCount: 6,
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return buildNotification(context, 'Your Leave has been approved!',
//                   '9:20 PM', borderColor);
//             }),
//         SizedBox(height: 10.h)
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ivy/constants/assets_constants.dart';
import 'package:ivy/widgets/custom_appbar.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String selectedFilter = 'All';

  void _selectFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: ('notifications'),
        isBackButton: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton('All'),
                _buildFilterButton('People'),
                _buildFilterButton('System'),
                _buildFilterButton('Payment'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                NotificationItem(
                  imageUrl: AssetsConstants.profile,
                  title: 'Rishi07.iit',
                  message: 'Followed you',
                  timeAgo: '2 days ago',
                ),
                NotificationItem(
                  icon: Icons.system_security_update,
                  title: 'System',
                  message: 'Please renew the payment',
                  timeAgo: '2 days ago',
                ),
                NotificationItem(
                  imageUrl: 'https://example.com/user2.jpg',
                  title: 'Saket.09.iit',
                  message:
                      'Posted: Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum...',
                  timeAgo: '2 days ago',
                ),
                NotificationItem(
                  icon: Icons.system_security_update,
                  title: 'System',
                  message: '12 messages unread',
                  timeAgo: '2 days ago',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String filter, {bool isDisabled = false}) {
    return GestureDetector(
      onTap: isDisabled ? null : () => _selectFilter(filter),
      child: Chip(
        label: Text(
          filter,
          style: TextStyle(
            color: isDisabled ? Colors.grey : Colors.black,
          ),
        ),
        backgroundColor: isDisabled ? Colors.grey[300] : Colors.grey[200],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String? imageUrl;
  final IconData? icon;
  final String title;
  final String message;
  final String timeAgo;

  NotificationItem({
    this.imageUrl,
    this.icon,
    required this.title,
    required this.message,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: imageUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(imageUrl!),
              )
            : Icon(icon),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        trailing: Text(timeAgo, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
