import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/screens/claim_screen.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';

class EligibilityScreen extends StatefulWidget {
  @override
  _EligibilityScreenState createState() => _EligibilityScreenState();
}

class _EligibilityScreenState extends State<EligibilityScreen> {
  final TextEditingController nameController = TextEditingController();
  String? selectedYear;
  List<String> years = List<String>.generate(
      50, (index) => (2024 + index).toString().substring(2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.h),
              customTextWidget(
                "Congrats you're eligible for .iit tld",
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: 'Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text("YY"),
                            value: selectedYear,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedYear = newValue;
                              });
                            },
                            items: years
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            ".iit",
                            style: GoogleFonts.rubik(
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    infoTextWithIcon(
                      "Enter the year you'll graduate in 'YY' (eg. if you graduate in 2024 enter 24)",
                    ),
                    SizedBox(height: 8.h),
                    infoTextWithIcon(
                      "Note: Please mention correct information, you won't be able to change your Smart Name",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              customTextWidget(
                "Hurray ${nameController.text.isNotEmpty ? nameController.text : 'rishi24'}.iit is available!",
                fontSize: 18.sp,
                textAlign: TextAlign.center,
                color: Colors.green,
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    CustomNavigator(
                            context: context, screen: ClaimSmartNameScreen())
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
                        color: Colors.teal),
                    child: Center(
                      child: customTextWidget(
                        'Claim',
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
      ),
    );
  }

  Widget infoTextWithIcon(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.teal,
          size: 16.sp,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: customTextWidget(
            text,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
