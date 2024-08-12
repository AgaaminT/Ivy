import 'package:flutter/material.dart';

class ExperienceTab extends StatelessWidget {
  final bool isEditing;

  ExperienceTab({required this.isEditing});

  final List<Experience> experiences = [
    Experience(
        role: "UX Designer", company: "@uiux_agency", years: "2020-2023"),
    Experience(
        role: "Graphic Designer", company: "@uiux_agency", years: "2020-2023"),
    Experience(
        role: "Marketing Manager", company: "@uiux_agency", years: "2020-2023"),
    Experience(
        role: "Maths Tutor", company: "@uiux_agency", years: "2020-2023"),
    Experience(
        role: "Business Manager", company: "@uiux_agency", years: "2020-2023"),
    Experience(
        role: "UX Designer", company: "@uiux_agency", years: "2020-2023"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Experience",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            return ExperienceTile(
                experience: experiences[index], isEditing: isEditing);
          },
        ),
      ],
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final Experience experience;
  final bool isEditing;

  ExperienceTile({required this.experience, required this.isEditing});

  final TextEditingController roleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    roleController.text = experience.role;
    companyController.text = experience.company;
    yearsController.text = experience.years;

    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            Container(
              width: 2,
              height: 70,
              color: Colors.black,
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isEditing
                  ? TextField(
                      controller: roleController,
                      decoration: InputDecoration(labelText: 'Role'),
                    )
                  : Text(
                      roleController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
              isEditing
                  ? TextField(
                      controller: companyController,
                      decoration: InputDecoration(labelText: 'Company'),
                    )
                  : Text(
                      companyController.text,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
              isEditing
                  ? TextField(
                      controller: yearsController,
                      decoration: InputDecoration(labelText: 'Years'),
                    )
                  : Text(
                      yearsController.text,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class Experience {
  final String role;
  final String company;
  final String years;

  Experience({required this.role, required this.company, required this.years});
}
