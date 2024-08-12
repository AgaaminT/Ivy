import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/Employee/EmploymentScreen2.dart';
import 'package:ivy/Employee/EmploymentScreen4.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

class EmploymentScreen3 extends StatefulWidget {
  const EmploymentScreen3({super.key});

  @override
  State<EmploymentScreen3> createState() => _EmploymentScreen3State();
}

class _EmploymentScreen3State extends State<EmploymentScreen3> {
  String? lookingForJob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employment Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            CustomNavigator(context: context, screen: const EmploymentScreen2())
                .pushReplacement();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle Skip button press
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you looking for Employment?'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Yes'),
                    value: 'Yes',
                    groupValue: lookingForJob,
                    onChanged: (value) {
                      setState(() {
                        lookingForJob = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: lookingForJob,
                    onChanged: (value) {
                      setState(() {
                        lookingForJob = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(
                          context: context,
                          screen: const EmploymentDetailsScreen4())
                      .pushReplacement();
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: customTextWidget(
                      'Save',
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
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:ivy/Employee/EmploymentScreen4.dart';

// class EmploymentDetailsScreen3 extends StatefulWidget {
//   const EmploymentDetailsScreen3({Key? key}) : super(key: key);

//   @override
//   _EmploymentDetailsScreen3State createState() =>
//       _EmploymentDetailsScreen3State();
// }

// class _EmploymentDetailsScreen3State extends State<EmploymentDetailsScreen3> {
//   String? lookingForEmployment;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Employment Details'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               if (lookingForEmployment != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const EmploymentDetailsScreen4()),
//                 );
//               }
//             },
//             child: const Text('Skip', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Are you looking for Employment?',
//                 style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 10),
//             ListTile(
//               title: const Text('Yes'),
//               leading: Radio<String>(
//                 value: 'Yes',
//                 groupValue: lookingForEmployment,
//                 onChanged: (value) {
//                   setState(() {
//                     lookingForEmployment = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('No'),
//               leading: Radio<String>(
//                 value: 'No',
//                 groupValue: lookingForEmployment,
//                 onChanged: (value) {
//                   setState(() {
//                     lookingForEmployment = value;
//                   });
//                 },
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (lookingForEmployment != null) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const EmploymentDetailsScreen4()),
//                     );
//                   }
//                 },
//                 child: const Text('Next'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
