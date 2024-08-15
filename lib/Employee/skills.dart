import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/Employee/EmploymentScreen1.dart';
import 'package:ivy/Employee/education_screen.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  bool showMoreSkills = false;
  List<String> skills = [
    'Writing',
    'Presentation Skills',
    'Java',
    'Python',
    'Leadership Skills',
    'ML',
    'Communication',
    'Teamwork',
    'Project Management',
  ];
  List<String> displayedSkills = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    displayedSkills = skills.take(6).toList();
  }

  void toggleMoreSkills() {
    setState(() {
      showMoreSkills = !showMoreSkills;
      displayedSkills = showMoreSkills ? skills : skills.take(6).toList();
    });
  }

  void searchSkills(String query) {
    setState(() {
      searchQuery = query;
      filterSkills(query);
    });
  }

  void filterSkills(String query) {
    List<String> filteredSkills = skills
        .where((skill) => skill.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      displayedSkills =
          showMoreSkills ? filteredSkills : filteredSkills.take(6).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Key Skills',
        isBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Type your skills here...',
              ),
              onChanged: searchSkills,
            ),
            const SizedBox(height: 16),
            const Text(
              'Or choose from below',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: displayedSkills
                        .map((skill) => Chip(label: Text(skill)))
                        .toList(),
                  ),
                  if (skills.length >
                      6) // Only show the button if there are more than 6 skills
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: toggleMoreSkills,
                        child: Text(
                          showMoreSkills ? '-less' : '+more',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(
                          context: context, screen: const EmploymentScreen1())
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
