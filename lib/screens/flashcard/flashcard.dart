import 'package:cyber_licence/screens/testing/testing.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animate_do/animate_do.dart';
// import 'testing_screen.dart';

// Flashcard data (20 cards per level)
final Map<String, List<Map<String, String>>> flashcards = {
  'Learner': [
    {
      'question': 'What is the Internet?',
      'answer':
          'The internet connects people around the world for games, videos, and learning.',
    },
    {
      'question': 'What is a password?',
      'answer':
          'A password is a secret key to keep your accounts safe. Only share with a parent/guardian.',
    },
    {
      'question': 'How to make strong passwords?',
      'answer':
          'Use big/small letters, numbers, and symbols (e.g., Cat#2024). Avoid 1234 or password.',
    },
    {
      'question': 'Never share your password',
      'answer': 'Keep it private. Even best friends should not know it.',
    },
    {
      'question': 'What is personal information?',
      'answer':
          'Your name, address, school, phone number. Keep it private online.',
    },
    {
      'question': 'Why keep your birthday private?',
      'answer': 'Hackers can use birthdays to guess passwords.',
    },
    {
      'question': 'What is a digital footprint?',
      'answer':
          'Everything you post, write, or share online stays there for a long time.',
    },
    {
      'question': 'Should you talk to strangers online?',
      'answer': 'No. Strangers online may not be who they say they are.',
    },
    {
      'question': 'What is a trusted adult?',
      'answer': 'A parent, teacher, or guardian who can guide you online.',
    },
    {
      'question': 'What is a virus in computers?',
      'answer': 'A harmful program that damages your files or steals info.',
    },
    {
      'question': 'What is a pop-up ad?',
      'answer': 'An ad that suddenly appears. Don’t click it—close it safely.',
    },
    {
      'question': 'Why should you check for HTTPS?',
      'answer': 'Websites with https:// are safer. Look for the lock icon.',
    },
    {
      'question': 'Why use a nickname online?',
      'answer': 'Nicknames keep your real identity safe.',
    },
    {
      'question': 'What is cyberbullying?',
      'answer': 'When someone is mean, rude, or hurtful online.',
    },
    {
      'question': 'What should you do if bullied online?',
      'answer': 'Don’t reply. Block them, tell a parent or teacher.',
    },
    {
      'question': 'Why log out of accounts?',
      'answer': 'Logging out keeps others from using your account.',
    },
    {
      'question': 'Why avoid public Wi-Fi?',
      'answer': 'Hackers can steal your information on public Wi-Fi.',
    },
    {
      'question': 'What are app permissions?',
      'answer':
          'Permissions decide what info an app can access. Ask an adult before allowing.',
    },
    {
      'question': 'What is a safe app?',
      'answer': 'Apps downloaded from trusted stores and approved by parents.',
    },
    {
      'question': 'Golden rule of internet use?',
      'answer': 'Be safe, kind, and respectful to everyone online.',
    },
  ],

  'Probationary': [
    {
      'question': 'What is phishing?',
      'answer':
          'Tricking people into sharing passwords or info through fake emails or links.',
    },
    {
      'question': 'What is a firewall?',
      'answer': 'A firewall protects your computer from hackers and malware.',
    },
    {
      'question': 'What is a scam email?',
      'answer':
          'An email pretending to be real but tries to steal money or info.',
    },
    {
      'question': 'Why use antivirus software?',
      'answer': 'It blocks and removes harmful software from your computer.',
    },
    {
      'question': 'What is a fake website?',
      'answer': 'A site that looks real but is made to steal information.',
    },
    {
      'question': 'Why not click on unknown links?',
      'answer': 'They may lead to scams or download viruses.',
    },
    {
      'question': 'What are privacy settings?',
      'answer': 'Tools to control who can see your posts or info online.',
    },
    {
      'question': 'Why check privacy settings often?',
      'answer': 'To make sure only the right people can see your information.',
    },
    {
      'question': 'What is a hacker?',
      'answer':
          'Someone who breaks into accounts, devices, or websites without permission.',
    },
    {
      'question': 'Why not use same password everywhere?',
      'answer': 'If one account is hacked, all others become unsafe.',
    },
    {
      'question': 'What is a strong Wi-Fi password?',
      'answer': 'A password that is long, unique, and hard to guess.',
    },
    {
      'question': 'What is a digital footprint reminder?',
      'answer':
          'Everything you post online (photos, comments) may stay forever.',
    },
    {
      'question': 'Why report bad online behavior?',
      'answer': 'To keep the internet safe and stop bullies or scammers.',
    },
    {
      'question': 'What is a software update?',
      'answer': 'Updates fix bugs and make devices more secure.',
    },
    {
      'question': 'What is a VPN?',
      'answer': 'A tool that makes your internet private and safe.',
    },
    {
      'question': 'Why avoid free game downloads?',
      'answer': 'They may contain viruses or unsafe ads.',
    },
    {
      'question': 'What is a digital reputation?',
      'answer': 'The way people see you online based on your posts.',
    },
    {
      'question': 'Why be careful what you post?',
      'answer': 'Once posted, it can be copied or shared forever.',
    },
    {
      'question': 'What is a safe chat?',
      'answer': 'Talking only with people you know in real life.',
    },
    {
      'question': 'What is a safe browser?',
      'answer': 'A browser that blocks harmful websites and keeps you safe.',
    },
  ],

  'Full': [
    {
      'question': 'What is two-factor authentication?',
      'answer':
          'A second step for login (like a code to your phone) to prove it’s you.',
    },
    {
      'question': 'Why update software?',
      'answer': 'Updates patch security holes and keep devices safe.',
    },
    {
      'question': 'What is encryption?',
      'answer':
          'A method of scrambling information so only the right person can read it.',
    },
    {
      'question': 'What is a data breach?',
      'answer': 'When hackers steal information from a company’s database.',
    },
    {
      'question': 'Why use different emails?',
      'answer':
          'Using different emails for accounts reduces risks if one is hacked.',
    },
    {
      'question': 'What is malware?',
      'answer': 'Software that damages devices or steals data.',
    },
    {
      'question': 'Why avoid suspicious downloads?',
      'answer': 'They may secretly install malware on your device.',
    },
    {
      'question': 'What are cookies in browsing?',
      'answer': 'Small files that track what you do online.',
    },
    {
      'question': 'Why clear cookies?',
      'answer': 'Clearing cookies helps protect your privacy.',
    },
    {
      'question': 'What is a password manager?',
      'answer': 'A secure tool that stores all your passwords safely.',
    },
    {
      'question': 'Why not share your location?',
      'answer': 'It reveals where you are and can be unsafe.',
    },
    {
      'question': 'What is social engineering?',
      'answer': 'Tricking people into giving private information.',
    },
    {
      'question': 'Why check website URLs?',
      'answer': 'Fake websites often use tricky names to fool you.',
    },
    {
      'question': 'What is a secure backup?',
      'answer': 'Saving copies of your data safely in another place.',
    },
    {
      'question': 'Why backup data?',
      'answer': 'So you don’t lose it if your device breaks or is stolen.',
    },
    {
      'question': 'What is a bot online?',
      'answer': 'A program pretending to be a human online.',
    },
    {
      'question': 'Why avoid clicking ads?',
      'answer': 'Many ads lead to unsafe sites or malware.',
    },
    {
      'question': 'What is a trusted app store?',
      'answer':
          'Official stores (like Google Play, App Store) with safer apps.',
    },
    {
      'question': 'Why check app permissions?',
      'answer': 'To control what data apps can access (camera, contacts, etc).',
    },
    {
      'question': 'Golden rule at Full Level?',
      'answer': 'Always think before you click, post, or share!',
    },
  ],
};
// <- aapke 60 flashcards L,P,F

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  String selectedLevel = 'Learner';
  int currentCardIndex = 0;
  bool showAnswer = false;
  bool isLearnerCompleted = false;
  bool isProbationaryCompleted = false;
  bool isLearnerPassed = false;
  bool isProbationaryPassed = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLearnerCompleted = prefs.getBool('isLearnerCompleted') ?? false;
      isProbationaryCompleted =
          prefs.getBool('isProbationaryCompleted') ?? false;
      isLearnerPassed = prefs.getBool('isLearnerPassed') ?? false;
      isProbationaryPassed = prefs.getBool('isProbationaryPassed') ?? false;
    });
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLearnerCompleted', isLearnerCompleted);
    await prefs.setBool('isProbationaryCompleted', isProbationaryCompleted);
    await prefs.setBool('isLearnerPassed', isLearnerPassed);
    await prefs.setBool('isProbationaryPassed', isProbationaryPassed);
  }

  void _nextCard() {
    setState(() {
      if (currentCardIndex < flashcards[selectedLevel]!.length - 1) {
        currentCardIndex++;
        showAnswer = false;
      } else {
        if (selectedLevel == 'Learner') {
          isLearnerCompleted = true;
        } else if (selectedLevel == 'Probationary') {
          isProbationaryCompleted = true;
        }
        _saveProgress();
      }
    });
  }

  void _previousCard() {
    setState(() {
      if (currentCardIndex > 0) {
        currentCardIndex--;
        showAnswer = false;
      }
    });
  }

  void _goToTesting() {
    setState(() {
      if (selectedLevel == 'Learner') {
        isLearnerCompleted = true;
      } else if (selectedLevel == 'Probationary') {
        isProbationaryCompleted = true;
      }
      _saveProgress();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TestingScreen(
            level: selectedLevel,
            onPass: (bool passed) {
              setState(() {
                if (selectedLevel == 'Learner') {
                  isLearnerPassed = passed;
                } else if (selectedLevel == 'Probationary') {
                  isProbationaryPassed = passed;
                }
                _saveProgress();
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentFlashcards = flashcards[selectedLevel]!;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'CyberLicence',
          style: CustomTextStyle.headingLargeGreen.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Level Buttons Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLevelButton(
                      'Learner',
                      isLearnerCompleted,
                      true,
                      AppColors.secondary,
                    ),
                    _buildLevelButton(
                      'Probationary',
                      isProbationaryCompleted,
                      isLearnerCompleted && isLearnerPassed,
                      AppColors.error,
                    ),
                    _buildLevelButton(
                      'Full',
                      false,
                      isLearnerCompleted &&
                          isLearnerPassed &&
                          isProbationaryCompleted &&
                          isProbationaryPassed,
                      AppColors.success,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Flashcard Box
              Expanded(
                child: FlipInY(
                  duration: const Duration(milliseconds: 400),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showAnswer = !showAnswer;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            showAnswer
                                ? currentFlashcards[currentCardIndex]['answer']!
                                : currentFlashcards[currentCardIndex]['question']!,
                            style: CustomTextStyle.subHeading.copyWith(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            showAnswer
                                ? 'Tap to see Question'
                                : 'Tap to see Answer',
                            style: CustomTextStyle.hint,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomIn(
                    child: ElevatedButton.icon(
                      onPressed: currentCardIndex > 0 ? _previousCard : null,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        "Back",
                        style: CustomTextStyle.subHeading.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                  ZoomIn(
                    child: ElevatedButton.icon(
                      onPressed: currentCardIndex < currentFlashcards.length - 1
                          ? _nextCard
                          : _goToTesting,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        currentCardIndex < currentFlashcards.length - 1
                            ? "Next"
                            : "Finish",
                        style: CustomTextStyle.subHeading.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Go to Puzzles Button
              if (currentCardIndex == currentFlashcards.length - 1 &&
                  ((selectedLevel == 'Learner' && isLearnerCompleted) ||
                      (selectedLevel == 'Probationary' &&
                          isLearnerCompleted &&
                          isLearnerPassed &&
                          isProbationaryCompleted) ||
                      (selectedLevel == 'Full' &&
                          isLearnerCompleted &&
                          isLearnerPassed &&
                          isProbationaryCompleted &&
                          isProbationaryPassed)))
                ZoomIn(
                  child: ElevatedButton.icon(
                    onPressed: _goToTesting,
                    icon: const Icon(Icons.extension, color: Colors.white),
                    label: Text(
                      "Go to Puzzles",
                      style: CustomTextStyle.subHeading.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelButton(
    String level,
    bool isCompleted,
    bool isUnlocked,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ZoomIn(
        child: ElevatedButton(
          onPressed: isUnlocked
              ? () {
                  setState(() {
                    selectedLevel = level;
                    currentCardIndex = 0;
                    showAnswer = false;
                  });
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isCompleted ? AppColors.success : color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(110, 42),
            elevation: 2,
          ),
          child: Text(
            level,
            style: CustomTextStyle.subHeading.copyWith(
              color: isUnlocked ? Colors.white : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
