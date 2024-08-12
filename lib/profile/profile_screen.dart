import 'package:flutter/material.dart';
import 'package:ivy/profile/experience_screen.dart';
import 'package:ivy/profile/posts_screen.dart';
import 'package:ivy/profile/top_skills.dart';
import 'package:ivy/ui/initial/initial_screen.dart';
import 'package:ivy/widgets/custom_navigator.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isEditing = false;

  final TextEditingController nameController =
      TextEditingController(text: "Sajan.iit");
  final TextEditingController jobTitleController =
      TextEditingController(text: "UI Designer");
  final TextEditingController locationController =
      TextEditingController(text: "Ahmedabad, Gujarat");
  final TextEditingController aboutController = TextEditingController(
      text:
          "Hey, I am Sajan Nair, also known by my smart name sajan.bh3, I am Founder and CEO of Agaamin, the only Handshake registry outside the US. My vision revolves around creating a vernacular Internet accessible to all 2.5 billion users on the internet who do not come from English-speaking countries. Feel free to reach me out for any specific queries.");
  final TextEditingController phoneController =
      TextEditingController(text: "+92 1234567890");
  final TextEditingController emailController =
      TextEditingController(text: "ayeshabazmi@gmail.com");
  final TextEditingController addressController = TextEditingController(
      text: "Street 2, house #05, Motarway Route Road Islamabad, Pakistan");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            CustomNavigator(
                context: context,
                screen: const InitialScreen(
                  index: 0,
                )).pushReplacement();
          },
        ),
        actions: [
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.check, color: Colors.black),
              onPressed: () {
                setState(() {
                  isEditing = false;
                });
              },
            )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww'),
                      ),
                      if (isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.edit, color: Colors.black),
                            onPressed: () {
                              // Implement profile picture editing
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  isEditing
                      ? TextField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: "Name"),
                        )
                      : Text(
                          nameController.text,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  isEditing
                      ? TextField(
                          controller: jobTitleController,
                          decoration: InputDecoration(labelText: "Job Title"),
                        )
                      : Text(
                          jobTitleController.text,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.grey[700], size: 16),
                      const SizedBox(width: 5),
                      isEditing
                          ? Expanded(
                              child: TextField(
                                controller: locationController,
                                decoration:
                                    InputDecoration(labelText: "Location"),
                              ),
                            )
                          : Text(
                              locationController.text,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (!isEditing)
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "122",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text("followers"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "67",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text("following"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "37K",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text("likes"),
                          ],
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  if (!isEditing)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {},
                          child: const Text(
                            "Share Profile",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Tabs Section
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    const TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Color(0xFF7167e4),
                      tabs: [
                        Tab(text: "Personal Info"),
                        Tab(text: "Experience"),
                        Tab(text: "Top Skills"),
                        Tab(text: "Posts"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Personal Info Tab
                          SingleChildScrollView(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "About Me",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        isEditing
                                            ? TextField(
                                                controller: aboutController,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'About Me'),
                                              )
                                            : Text(
                                                aboutController.text,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Contact Here",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.phone,
                                                color: Colors.grey[700]),
                                            const SizedBox(width: 10),
                                            isEditing
                                                ? Expanded(
                                                    child: TextField(
                                                      controller:
                                                          phoneController,
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  'Phone'),
                                                    ),
                                                  )
                                                : Text(phoneController.text),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.email,
                                                color: Colors.grey[700]),
                                            const SizedBox(width: 10),
                                            isEditing
                                                ? Expanded(
                                                    child: TextField(
                                                      controller:
                                                          emailController,
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  'Email'),
                                                    ),
                                                  )
                                                : Text(emailController.text),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors.grey[700]),
                                            const SizedBox(width: 8),
                                            isEditing
                                                ? Expanded(
                                                    child: TextField(
                                                      controller:
                                                          addressController,
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  'Address'),
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: Text(
                                                      addressController.text,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[700]),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Experience Tab
                          SingleChildScrollView(
                            padding: EdgeInsets.all(16.0),
                            child: ExperienceTab(isEditing: isEditing),
                          ),
                          // Top Skills Tab
                          SingleChildScrollView(
                            padding: EdgeInsets.all(16.0),
                            child: TopSkillsTab(isEditing: isEditing),
                          ),
                          // Posts Tab
                          SingleChildScrollView(
                            padding: EdgeInsets.all(16.0),
                            child: PostsTab(isEditing: isEditing),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
