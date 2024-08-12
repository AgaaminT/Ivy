import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

import 'EmploymentScreen3.dart'; // Ensure this import is correct

class EmploymentScreen2 extends StatefulWidget {
  const EmploymentScreen2({super.key});

  @override
  State<EmploymentScreen2> createState() => _EmploymentScreen2State();
}

class _EmploymentScreen2State extends State<EmploymentScreen2> {
  String? employmentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employement Details'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you currently employed?'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Yes'),
                    value: 'Yes',
                    groupValue: employmentType,
                    onChanged: (value) {
                      setState(() {
                        employmentType = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: employmentType,
                    onChanged: (value) {
                      setState(() {
                        employmentType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Previous Company',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Department',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Joining Date',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Worked Till',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Current Salary / Stipend',
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(
                          context: context, screen: const EmploymentScreen3())
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

// import 'package:alma_connect/Employee/EmploymentScreen3.dart';
// import 'package:flutter/material.dart';

// class EmploymentDetailsScreen2 extends StatefulWidget {
//   const EmploymentDetailsScreen2({Key? key}) : super(key: key);

//   @override
//   _EmploymentDetailsScreen2State createState() =>
//       _EmploymentDetailsScreen2State();
// }

// class _EmploymentDetailsScreen2State extends State<EmploymentDetailsScreen2> {
//   String? employmentType;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Employment Details'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               if (employmentType != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const EmploymentDetailsScreen3()),
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
//             const Text('Employment Type', style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 10),
//             ListTile(
//               title: const Text('Full-Time'),
//               leading: Radio<String>(
//                 value: 'Full-Time',
//                 groupValue: employmentType,
//                 onChanged: (value) {
//                   setState(() {
//                     employmentType = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('Internship'),
//               leading: Radio<String>(
//                 value: 'Internship',
//                 groupValue: employmentType,
//                 onChanged: (value) {
//                   setState(() {
//                     employmentType = value;
//                   });
//                 },
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (employmentType != null) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const EmploymentDetailsScreen3()),
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
