// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:ivy/ui/notification/notification_screen.dart';
// // import 'package:ivy/widgets/custom_back_button.dart';
// // import 'package:ivy/widgets/custom_navigator.dart';
// // import 'package:ivy/widgets/custom_text_widget.dart';

// // class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
// //   final String title;
// //   final bool isBackButton;
// //   final bool isSettings;

// //   const CustomAppBar({
// //     super.key,
// //     required this.title,
// //     this.isBackButton = false,
// //     this.isSettings = false,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return AppBar(
// //       centerTitle: true,
// //       foregroundColor: Colors.white,
// //       backgroundColor: Theme.of(context).primaryColor,
// //       leading: isBackButton ? customBackButtonWidget(context) : null,
// //       title: customTextWidget(title, color: Colors.white, fontSize: 16.h),
// //       actions: [
// //         isSettings
// //             ? IconButton(
// //                 onPressed: () {
// //                   CustomNavigator(
// //                           context: context, screen: NotificationsScreen())
// //                       .push();
// //                 },
// //                 icon: const Icon(
// //                   Icons.notifications,
// //                 ))
// //             : const SizedBox.shrink()
// //       ],
// //     );
// //   }

// //   @override
// //   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ivy/ui/notification/notification_screen.dart';
// import 'package:ivy/widgets/custom_back_button.dart';
// import 'package:ivy/widgets/custom_navigator.dart';
// import 'package:ivy/widgets/custom_text_widget.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool isBackButton;
//   final bool isSettings;
//   final bool skip;

//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.isBackButton = false,
//     this.isSettings = false,
//     this.skip = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       foregroundColor: Colors.white,
//       backgroundColor: Theme.of(context).primaryColor,
//       leading: isBackButton ? customBackButtonWidget(context) : null,
//       title: customTextWidget(title, color: Colors.white, fontSize: 16.h),
//       actions: [
//         isSettings
//             ? IconButton(
//                 onPressed: () {
//                   CustomNavigator(
//                           context: context, screen: NotificationsScreen())
//                       .push();
//                 },
//                 icon: const Icon(
//                   Icons.notifications,
//                 ))
//             : const SizedBox.shrink()
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/view/ui/initial/initial_screen.dart';
import 'package:ivy/view/ui/notification/notification_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_back_button.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/utils/routes/widgets/custom_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButton;
  final bool isSettings;
  final bool skip;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButton = false,
    this.isSettings = false,
    this.skip = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      leading: isBackButton ? customBackButtonWidget(context) : null,
      title: customTextWidget(title, color: Colors.white, fontSize: 16.h),
      actions: [
        if (skip)
          TextButton(
            onPressed: () {
              CustomNavigator(
                context: context,
                screen: const InitialScreen(index: 0),
              ).push();
            },
            child: customTextWidget(
              'Skip',
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        if (isSettings)
          IconButton(
            onPressed: () {
              CustomNavigator(
                context: context,
                screen: NotificationsScreen(),
              ).push();
            },
            icon: const Icon(Icons.notifications),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
