import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/Employee/EmploymentScreen3.dart';
import 'package:ivy/Employee/recovery_screen.dart';
import 'package:ivy/ui/initial/initial_screen.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

class EmploymentDetailsScreen4 extends StatefulWidget {
  const EmploymentDetailsScreen4({Key? key}) : super(key: key);

  @override
  _EmploymentDetailsScreen4State createState() =>
      _EmploymentDetailsScreen4State();
}

class _EmploymentDetailsScreen4State extends State<EmploymentDetailsScreen4> {
  String? employmentPreference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employment Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            CustomNavigator(context: context, screen: const EmploymentScreen3())
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
            const Text('What type of employment are you looking for?',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            // ListTile(
            //   title: const Text('Full-Time'),
            //   leading: Radio<String>(
            //     value: 'Full-Time',
            //     groupValue: employmentPreference,
            //     onChanged: (value) {
            //       setState(() {
            //         employmentPreference = value;
            //       });
            //     },
            //   ),
            // ),
            // ListTile(
            //   title: const Text('Internship'),
            //   leading: Radio<String>(
            //     value: 'Internship',
            //     groupValue: employmentPreference,
            //     onChanged: (value) {
            //       setState(() {
            //         employmentPreference = value;
            //       });
            //     },
            // ),
            //   ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Full-Time'),
                    value: 'Full Time',
                    groupValue: employmentPreference,
                    onChanged: (value) {
                      setState(() {
                        employmentPreference = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Internship'),
                    value: 'Internship',
                    groupValue: employmentPreference,
                    onChanged: (value) {
                      setState(() {
                        employmentPreference = value;
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
                    screen: const InitialScreen(index: 0),
                  ).pushReplacement();
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
                      'Next',
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
