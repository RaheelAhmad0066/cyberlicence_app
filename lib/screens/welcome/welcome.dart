import 'package:cyber_licence/screens/work/work.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';
import 'package:cyber_licence/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String selectedAvatar = '';
  final TextEditingController _nameController = TextEditingController();
  bool parentConfirmed = false;

  final List<String> avatars = [
    AppImages.avatar,
    AppImages.avatar1,
    AppImages.avatar2,
    AppImages.avatar3,
    AppImages.avatar4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// App Title
              Text("CyberLicence", style: CustomTextStyle.headingLargeGreen),
              const SizedBox(height: 20),
              Text(
                "CyberLience teaches you how to stay safe online,just like learning to drive safely.",
                style: CustomTextStyle.hint.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              /// Name Input
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Your Name",
                  style: CustomTextStyle.subHeading,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Type your name",
                    hintStyle: CustomTextStyle.hint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  style: CustomTextStyle.body,
                ),
              ),
              const SizedBox(height: 30),

              /// Avatar Selection
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose Your Avatar",
                  style: CustomTextStyle.subHeading,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: avatars.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedAvatar == avatars[index];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => selectedAvatar = avatars[index]),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        // margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.all(2), // 👈 extra padding
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // 👈 makes border circular
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 3,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.3),
                                    blurRadius: 12,
                                  ),
                                ]
                              : [],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            avatars[index],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// Parent Confirmation
              Row(
                children: [
                  Checkbox(
                    value: parentConfirmed,
                    onChanged: (val) => setState(() => parentConfirmed = val!),
                    activeColor: AppColors.primary,
                  ),
                  Expanded(
                    child: Text(
                      "A parent or responsible adult is present to help me.",
                      style: CustomTextStyle.body,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              /// Start Button
              GestureDetector(
                onTap: () async {
                  if (_nameController.text.isNotEmpty &&
                      selectedAvatar.isNotEmpty &&
                      parentConfirmed) {
                    // ✅ Save preferences
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('userName', _nameController.text);

                    // ✅ Navigate to next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HowItWorksScreen(
                          name: _nameController.text,
                          avatarPath: selectedAvatar,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please fill all fields and confirm adult help.",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Start Learning",
                      style: CustomTextStyle.subHeading.copyWith(
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

  Widget _buildLevelCircle(String text, Color color) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: color,
      child: Text(
        text,
        style: CustomTextStyle.headingLargeDark.copyWith(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
