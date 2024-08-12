import 'package:flutter/material.dart';

class TopSkillsTab extends StatelessWidget {
  final bool isEditing;

  TopSkillsTab({required this.isEditing});

  final List<String> skills = [
    "UX Design",
    "Graphic Design",
    "Marketing",
    "React",
    "Java Script"
  ];

  final TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Top Skills",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills.map((skill) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.circle, size: 10, color: Colors.grey),
                          const SizedBox(width: 10),
                          isEditing
                              ? Expanded(
                                  child: TextField(
                                    controller: skillController..text = skill,
                                    decoration: const InputDecoration(
                                        labelText: 'Skill'),
                                  ),
                                )
                              : Text(skill,
                                  style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
