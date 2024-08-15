import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/ui/initial/initial_screen.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';



class EmploymentScreen2 extends StatefulWidget {
  const EmploymentScreen2({super.key});

  @override
  State<EmploymentScreen2> createState() => _EmploymentScreen2State();
}

class _EmploymentScreen2State extends State<EmploymentScreen2> {
  String? employmentType;
  String? employmentStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Employment Details',
        isBackButton: true,
        skip: true,
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
            const Text('What type of employment are you looking for?'),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Full-Time'),
                    value: 'Full-Time',
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
                    title: const Text('Internship'),
                    value: 'Internship',
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                    color: Theme.of(context).primaryColor,
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
