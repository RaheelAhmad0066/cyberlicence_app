import 'package:cyber_licence/screens/flashcard/flashcard.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';
import 'package:flutter/material.dart';

class HowItWorksScreen extends StatefulWidget {
  final String name;
  final String avatarPath;

  const HowItWorksScreen({
    super.key,
    required this.name,
    required this.avatarPath,
  });

  @override
  State<HowItWorksScreen> createState() => _HowItWorksScreenState();
}

class _HowItWorksScreenState extends State<HowItWorksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Heading
              Text(
                'How CyberLicence Works',
                style: CustomTextStyle.headingLargeGreen,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),

              /// Steps with Icons
              Expanded(
                child: ListView(
                  children: [
                    _buildStepWithIcon(
                      Icons.school,
                      'Learn from the flashcards',
                      'Study fun cards to learn about cyber safety.',
                    ),
                    _buildStepWithIcon(
                      Icons.quiz,
                      'Attempt the quiz',
                      'Answer questions to test what you learned.',
                    ),
                    _buildStepWithIcon(
                      Icons.emoji_events,
                      'Move from L → P → F',
                      'Pass with 90% or more to progress.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Roadmap Flow (L → P → F)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLevelIndicator('L', AppColors.secondary), // Yellow
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.textPrimary,
                    ),
                    _buildLevelIndicator('P', Colors.red.shade300), // Soft Red
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.textPrimary,
                    ),
                    _buildLevelIndicator('F', AppColors.primary), // Green
                  ],
                ),
              ),

              const SizedBox(height: 32),

              /// Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FlashcardsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 16,
                  ),
                  shadowColor: AppColors.primary.withOpacity(0.3),
                  elevation: 6,
                ),
                child: Text(
                  'Let’s Drive Safely Online',
                  style: CustomTextStyle.subHeading.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepWithIcon(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primary, size: 28),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: CustomTextStyle.subHeading),
                  const SizedBox(height: 4),
                  Text(description, style: CustomTextStyle.hint),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelIndicator(String level, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textPrimary, width: 1.2),
      ),
      child: Text(level, style: CustomTextStyle.subHeading),
    );
  }
}
