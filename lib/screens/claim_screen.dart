// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ivy/screens/payment_screen.dart';
// import 'package:ivy/widgets/custom_appbar.dart';
// import 'package:ivy/widgets/custom_navigator.dart';
// import 'package:ivy/widgets/custom_text_widget.dart';

// class ClaimSmartNameScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Claim your smart name',
//         isBackButton: true,
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 32.h),
//               Container(
//                 padding: EdgeInsets.all(16.w),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     customTextWidget(
//                       "VIP Domain",
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     SizedBox(height: 16.h),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         border: Border.all(color: Colors.grey, width: 1.0),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 8.h, horizontal: 16.w),
//                             color: Theme.of(context).primaryColor,
//                             child: customTextWidget(
//                               "Rishi24.iit",
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 8.h, horizontal: 16.w),
//                             color: Colors.white,
//                             child: customTextWidget(
//                               "₹899 per year",
//                               fontSize: 16.sp,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     infoTextWithIcon(
//                       "Apply coupon “welcome” to get one year free",
//                     ),
//                     SizedBox(height: 8.h),
//                     infoTextWithIcon(
//                       "Manage it from both agaamin and ivy community",
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     CustomNavigator(
//                             context: context, screen: PaymentMethodScreen())
//                         .pushReplacement();
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(10),
//                         bottom: Radius.circular(10),
//                       ),
//                       color: Theme.of(context).primaryColor,
//                     ),
//                     child: Center(
//                       child: customTextWidget(
//                         'Continue',
//                         fontSize: 14.h,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget infoTextWithIcon(String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           Icons.check_circle,
//           color: Theme.of(context).primaryColor,
//           size: 16.sp,
//         ),
//         SizedBox(width: 8.w),
//         Expanded(
//           child: customTextWidget(
//             text,
//             fontSize: 12.sp,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/screens/payment_screen.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

class ClaimSmartNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Claim your smart name',
        isBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextWidget(
                      "VIP Domain",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 16.w),
                            color: Theme.of(context).primaryColor,
                            child: customTextWidget(
                              "Rishi24.iit",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 16.w),
                            color: Colors.white,
                            child: customTextWidget(
                              "₹899 per year",
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    infoTextWithIcon(
                      "Apply coupon “welcome” to get one year free",
                      context,
                    ),
                    SizedBox(height: 8.h),
                    infoTextWithIcon(
                      "Manage it from both agaamin and ivy community",
                      context,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    CustomNavigator(
                            context: context, screen: PaymentMethodScreen())
                        .pushReplacement();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: customTextWidget(
                        'Continue',
                        fontSize: 14.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoTextWithIcon(String text, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          color: Theme.of(context).primaryColor,
          size: 16.sp,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: customTextWidget(
            text,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
