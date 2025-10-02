import 'package:cyber_licence/screens/work/work.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';
import 'package:cyber_licence/utils/images.dart';
import 'package:flutter/material.dart';

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
                height: 100,
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
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.3),
                                    blurRadius: 12,
                                  ),
                                ]
                              : [],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            avatars[index],
                            width: 70,
                            height: 70,
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
              const SizedBox(height: 30),

              /// How it Works
              Text(
                "How CyberLicence Works",
                style: CustomTextStyle.headingLargeGreen,
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Learn from the flashcards",
                    style: CustomTextStyle.body,
                  ),
                  Text("• Solve the puzzles", style: CustomTextStyle.body),
                  Text(
                    "• Pass with 90% or more 🎯",
                    style: CustomTextStyle.body,
                  ),
                  Text(
                    "• Unlock levels as you progress",
                    style: CustomTextStyle.body,
                  ),
                ],
              ),
              const SizedBox(height: 28),

              /// Roadmap Flow (L → P → F)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLevelCircle("L", Colors.yellow),
                  const SizedBox(width: 18),
                  _buildLevelCircle("P", Colors.red.shade300),
                  const SizedBox(width: 18),
                  _buildLevelCircle("F", AppColors.primary),
                ],
              ),
              const SizedBox(height: 50),

              /// Start Button
              GestureDetector(
                onTap: () {
                  if (_nameController.text.isNotEmpty &&
                      selectedAvatar.isNotEmpty &&
                      parentConfirmed) {
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "Let’s Drive Safely Online",
                    style: CustomTextStyle.subHeading.copyWith(
                      color: Colors.white,
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
