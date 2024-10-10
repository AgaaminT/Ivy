import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/utils/routes/widgets/custom_appbar.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/utils/routes/widgets/custom_text_widget.dart';

import 'skills.dart';

class EducationForm extends StatefulWidget {
  const EducationForm({super.key});

  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  bool showMoreCourses = false;
  bool showMoreSpecializations = false;

  void toggleMoreCourses() {
    setState(() {
      showMoreCourses = !showMoreCourses;
    });
  }

  void toggleMoreSpecializations() {
    setState(() {
      showMoreSpecializations = !showMoreSpecializations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ('Education Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Highest Qualification', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 8.0,
              children: [
                Chip(label: Text('Doctorate')),
                Chip(label: Text('Post Graduate')),
                Chip(label: Text('Graduate')),
                Chip(label: Text('Diploma')),
                Chip(label: Text('Class XII')),
                Chip(label: Text('Class X')),
                Chip(label: Text('Below X')),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Course', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                const Chip(label: Text('B Tech')),
                const Chip(label: Text('B.Com')),
                const Chip(label: Text('BCA')),
                const Chip(label: Text('BBA')),
                if (showMoreCourses) ...[
                  const Chip(label: Text('M Tech')),
                  const Chip(label: Text('M.Com')),
                  const Chip(label: Text('MCA')),
                  const Chip(label: Text('MBA')),
                ],
              ],
            ),
            TextButton(
              onPressed: toggleMoreCourses,
              child: Text(
                showMoreCourses ? '-less' : '+more',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Specialization', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                const Chip(label: Text('CSE')),
                const Chip(label: Text('ECE')),
                const Chip(label: Text('IT')),
                const Chip(label: Text('Aerospace')),
                const Chip(label: Text('Mechanical')),
                if (showMoreSpecializations) ...[
                  const Chip(label: Text('AI')),
                  const Chip(label: Text('Civil')),
                  const Chip(label: Text('Electrical')),
                  const Chip(label: Text('Biomedical')),
                ],
              ],
            ),
            TextButton(
              onPressed: toggleMoreSpecializations,
              child: Text(
                showMoreSpecializations ? '-less' : '+more',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(
                          context: context, screen: const SkillsScreen())
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
