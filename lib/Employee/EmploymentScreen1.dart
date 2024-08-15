import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/Employee/EmploymentScreen2.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

class EmploymentScreen1 extends StatefulWidget {
  const EmploymentScreen1({super.key});

  @override
  State<EmploymentScreen1> createState() => _EmploymentScreen1State();
}

class _EmploymentScreen1State extends State<EmploymentScreen1> {
  String? employmentStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Employment Details',
        skip: true,
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
                    groupValue: employmentStatus,
                    onChanged: (value) {
                      setState(() {
                        employmentStatus = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: employmentStatus,
                    onChanged: (value) {
                      setState(() {
                        employmentStatus = value;
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
                          context: context, screen: const EmploymentScreen2())
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
