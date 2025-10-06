import 'package:cyber_licence/screens/testing/testing.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animate_do/animate_do.dart';

// Flashcard data - EXACTLY from DEVDOC (20 cards per level)
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
          'Use big/small letters, numbers, and symbols (e.g., Cat#2024). Avoid \'1234\' or \'password\'.',
    },
    {
      'question': 'Never share your password',
      'answer': 'Keep it private. Even best friends shouldn\'t know it.',
    },
    {
      'question': 'What is personal information',
      'answer': 'Your name, address, phone, school, and photos are private.',
    },
    {
      'question': 'If something feels weird or scary online ...',
      'answer': 'Ask a trusted adult.',
    },
    {
      'question': 'Unsafe Links',
      'answer':
          '"Free prizes" links are often tricks. Don\'t click; ask an adult first.',
    },
    {
      'question': 'What does the Padlock on a browser mean?',
      'answer':
          'A padlock/HTTPS shows a site is more secure before entering info.',
    },
    {
      'question': 'What should you do after using shared/public devices.',
      'answer': 'Log out after using.',
    },
    {
      'question': 'Be Kind Online',
      'answer': 'Use kind words. If someone is mean, tell an adult.',
    },
    {
      'question': 'What is a Pop-Up?',
      'answer':
          'Pop-ups are sudden windows; some are tricks. Don\'t click without checking.',
    },
    {
      'question': 'Online Friends aren\'t always real',
      'answer': 'People can pretend to be someone else.',
    },
    {
      'question': 'Game Chats',
      'answer': 'Be careful in chats. Never share personal info.',
    },
    {
      'question': 'Don\'t download without permission',
      'answer': 'Ask an adult before downloading anything.',
    },
    {
      'question': 'Use a nickname online',
      'answer':
          'Choose a nickname (e.g., StarTiger) instead of your real name.',
    },
    {
      'question': 'Trusted Websites',
      'answer': 'Use sites you know (school portal, kids\' learning).',
    },
    {
      'question': 'Public Wi-Fi',
      'answer': 'On public Wi-Fi, avoid logging into important accounts.',
    },
    {
      'question': 'Check before clicking',
      'answer': 'Buttons like "YOU WON" are often fake. Show an adult.',
    },
    {
      'question': 'Not everything is true online',
      'answer': 'Some posts are fake. Ask a teacher/parent if unsure.',
    },
    {
      'question': 'Digital footprint',
      'answer': 'What you share can stay online. Think before posting.',
    },
  ],
  'Probationary': [
    {
      'question': 'Personal information',
      'answer':
          'Your name, address, phone, birthday, and school are private. Ask an adult before sharing.',
    },
    {
      'question': 'Keep your birthday private',
      'answer':
          'Birthdays help hackers guess passwords. Don\'t post your exact birthday publicly.',
    },
    {
      'question': 'Digital footprint',
      'answer':
          'Everything you post or share online can stay there for a long time.',
    },
    {
      'question': 'Privacy settings',
      'answer':
          'Make accounts private so only people you know can see your posts.',
    },
    {
      'question': 'Fake Giveaways',
      'answer':
          '"Free iPhone!" or "Free Robux!" is usually a trick. Don\'t click - check with an adult.',
    },
    {
      'question': 'Phishing Messages',
      'answer':
          'Scammers pretend to be someone else to steal info. Be careful with messages asking for details.',
    },
    {
      'question': 'Strange links',
      'answer':
          'Links that look weird or come from strangers can be dangerous. Avoid them.',
    },
    {
      'question': 'Fake shopping Sites',
      'answer':
          'If the deal seems too good to be true, it probably is. Stick to trusted stores.',
    },
    {
      'question': 'Location in photos',
      'answer':
          'Photos can reveal where you live or go to school. Share carefully.',
    },
    {
      'question': 'If you\'re unsure about something online ...',
      'answer': 'Pause and ask a trusted adult.',
    },
    {
      'question': 'Think before you post',
      'answer': 'Would you say it in real life? Think first, then post.',
    },
    {
      'question': 'Secure Websites',
      'answer': 'Look for HTTPS and a padlock before entering any information.',
    },
    {
      'question': 'Stronger Passwords',
      'answer':
          'Use letters, numbers, and symbols. Avoid names, birthdays, or the word "password."',
    },
    {
      'question': 'Verification Codes',
      'answer': 'Never share one-time codes sent to your phone or email.',
    },
    {
      'question': 'Apps collect data',
      'answer':
          'Some apps track what you do. Ask an adult before installing new apps.',
    },
    {
      'question': 'App permissions',
      'answer':
          'Only allow what\'s needed (camera for photos, mic for voice). Turn off extras.',
    },
    {
      'question': 'Suspicious emails',
      'answer':
          'If an email asks for your password or money, Don\'t reply, report or delete it.',
    },
    {
      'question': 'Too good to be true',
      'answer': 'Big prizes or gifts online are often fake. Be careful.',
    },
    {
      'question': 'Report & Block',
      'answer': 'If someone acts mean or unsafe, block and report them.',
    },
    {
      'question': 'Game chat Safety',
      'answer': 'Only talk about the game. Never share personal info in chat.',
    },
  ],
  'Full': [
    {
      'question': 'How should you behave online?',
      'answer':
          'Being responsible, kind, and safe online in everything you do.',
    },
    {
      'question': 'What Is Cyberbullying?',
      'answer':
          'When someone is mean or harmful online---messages, posts, or sharing hurtful content.',
    },
    {
      'question': 'Responding to Bullying',
      'answer': 'Don\'t fight back. Block, report, and tell a trusted adult.',
    },
    {
      'question': 'Misinformation',
      'answer':
          'False info shared online, sometimes by accident. Always verify.',
    },
    {
      'question': 'Fact-Checking',
      'answer':
          'Check trusted sources and compare more than one website before believing.',
    },
    {
      'question': 'Screen time balance',
      'answer':
          'Too much screen time can affect sleep, mood, and health. Take breaks.',
    },
    {
      'question': 'Respect others\' privacy',
      'answer':
          'Don\'t share someone else\'s photo or info without permission.',
    },
    {
      'question': 'Reporting tools',
      'answer':
          'Use report buttons on apps like TikTok, YouTube, or Discord to flag harm.',
    },
    {
      'question': 'Think Before Posting',
      'answer': 'Would you say it face to face? If not, don\'t post it.',
    },
    {
      'question': 'Real-Life effects of online activity',
      'answer':
          'Online actions can affect school, friendships, and opportunities.',
    },
    {
      'question': 'Online heated arguments',
      'answer': 'Online fights grow quickly. It\'s okay to step away.',
    },
    {
      'question': 'Terms & Conditions',
      'answer': 'These explain rules for using apps or sites. Know the basics.',
    },
    {
      'question': 'Sharing Secrets',
      'answer': 'Once a secret is online, it can spread fast. Be careful.',
    },
    {
      'question': 'Fake news tricks',
      'answer':
          'ALL CAPS or "SHOCKING!" headlines can be misleading. Stay skeptical.',
    },
    {
      'question': 'Tone & Emojis',
      'answer':
          'Text can be misunderstood. Add context or emojis to be clear and kind.',
    },
    {
      'question': 'Healthy gaming behaviour',
      'answer':
          'Good friends respect your boundaries and safety rules in games.',
    },
    {
      'question': 'Peer pressure',
      'answer':
          'Just because others do it online doesn\'t make it safe or right.',
    },
    {
      'question': 'Reputation matters',
      'answer':
          'Future schools or jobs may see old posts. Build a positive record.',
    },
    {
      'question': 'Take breaks',
      'answer': 'Short offline breaks help your eyes and brain reset.',
    },
    {
      'question': 'Be a role model',
      'answer': 'Lead by example---be positive, helpful, and safe online.',
    },
  ],
};

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
  bool isFullCompleted = false;
  bool isLearnerPassed = false;
  bool isProbationaryPassed = false;
  bool isFullPassed = false;

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
      isFullCompleted = prefs.getBool('isFullCompleted') ?? false;
      isLearnerPassed = prefs.getBool('isLearnerPassed') ?? false;
      isProbationaryPassed = prefs.getBool('isProbationaryPassed') ?? false;
      isFullPassed = prefs.getBool('isFullPassed') ?? false;
    });
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLearnerCompleted', isLearnerCompleted);
    await prefs.setBool('isProbationaryCompleted', isProbationaryCompleted);
    await prefs.setBool('isFullCompleted', isFullCompleted);
    await prefs.setBool('isLearnerPassed', isLearnerPassed);
    await prefs.setBool('isProbationaryPassed', isProbationaryPassed);
    await prefs.setBool('isFullPassed', isFullPassed);
  }

  void _nextCard() {
    setState(() {
      if (currentCardIndex < flashcards[selectedLevel]!.length - 1) {
        currentCardIndex++;
        showAnswer = false;
      } else {
        // Mark level as completed when all flashcards viewed
        if (selectedLevel == 'Learner') {
          isLearnerCompleted = true;
        } else if (selectedLevel == 'Probationary') {
          isProbationaryCompleted = true;
        } else if (selectedLevel == 'Full') {
          isFullCompleted = true;
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

  bool _canAttemptPuzzle() {
    if (selectedLevel == 'Learner') {
      return isLearnerCompleted; // Can attempt L Puzzle if completed all L FCs
    } else if (selectedLevel == 'Probationary') {
      return isLearnerCompleted &&
          isProbationaryCompleted &&
          isLearnerPassed; // Can attempt P Puzzle if completed L & P FCs AND passed L Puzzle
    } else if (selectedLevel == 'Full') {
      return isLearnerCompleted &&
          isProbationaryCompleted &&
          isFullCompleted &&
          isLearnerPassed &&
          isProbationaryPassed; // Can attempt F Puzzle if completed L, P & F FCs AND passed L & P Puzzles
    }
    return false;
  }

  String _getPuzzleButtonText() {
    if (!_canAttemptPuzzle()) {
      return "Complete Requirements";
    }
    return "Go to Puzzles";
  }

  void _goToPuzzles() {
    if (!_canAttemptPuzzle()) {
      String message = "";
      if (selectedLevel == 'Learner') {
        message = "Complete all Learner flashcards first!";
      } else if (selectedLevel == 'Probationary') {
        if (!isLearnerCompleted) {
          message = "Complete Learner flashcards first!";
        } else if (!isProbationaryCompleted) {
          message = "Complete Probationary flashcards first!";
        } else if (!isLearnerPassed) {
          message = "Pass Learner puzzles first!";
        }
      } else if (selectedLevel == 'Full') {
        if (!isLearnerCompleted) {
          message = "Complete Learner flashcards first!";
        } else if (!isProbationaryCompleted) {
          message = "Complete Probationary flashcards first!";
        } else if (!isFullCompleted) {
          message = "Complete Full flashcards first!";
        } else if (!isLearnerPassed) {
          message = "Pass Learner puzzles first!";
        } else if (!isProbationaryPassed) {
          message = "Pass Probationary puzzles first!";
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

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
              } else if (selectedLevel == 'Full') {
                isFullPassed = passed;
              }
              _saveProgress();
            });
          },
        ),
      ),
    );
  }

  Color _getLevelColor(String level) {
    if (level == 'Learner') return AppColors.secondary;
    if (level == 'Probationary') return const Color(0xFFFF6B6B); // Light Red
    if (level == 'Full') return AppColors.success;
    return AppColors.primary;
  }

  bool _isLevelUnlocked(String level) {
    if (level == 'Learner') return true; // Always unlocked
    if (level == 'Probationary') return isLearnerCompleted && isLearnerPassed;
    if (level == 'Full') return isProbationaryCompleted && isProbationaryPassed;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final currentFlashcards = flashcards[selectedLevel]!;
    final isLastCard = currentCardIndex == currentFlashcards.length - 1;

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
                    _buildLevelButton('Learner'),
                    _buildLevelButton('Probationary'),
                    _buildLevelButton('Full'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Progress indicators
              _buildProgressIndicators(),

              const SizedBox(height: 12),

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
                      onPressed: _nextCard,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        isLastCard ? "Finish" : "Next",
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

              // Go to Puzzles Button - Show when on last card
              if (isLastCard)
                ZoomIn(
                  child: ElevatedButton.icon(
                    onPressed: _goToPuzzles,
                    icon: const Icon(Icons.extension, color: Colors.white),
                    label: Text(
                      _getPuzzleButtonText(),
                      style: CustomTextStyle.subHeading.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _canAttemptPuzzle()
                          ? AppColors.primary
                          : AppColors.textSecondary,
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

  Widget _buildLevelButton(String level) {
    final isCompleted = level == 'Learner'
        ? isLearnerCompleted
        : level == 'Probationary'
        ? isProbationaryCompleted
        : isFullCompleted;
    final isUnlocked = _isLevelUnlocked(level);
    final isPassed = level == 'Learner'
        ? isLearnerPassed
        : level == 'Probationary'
        ? isProbationaryPassed
        : isFullPassed;

    Color buttonColor = _getLevelColor(level);
    if (isPassed) buttonColor = AppColors.success;
    if (!isUnlocked) buttonColor = AppColors.textSecondary.withOpacity(0.5);

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
            backgroundColor: buttonColor,
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

  Widget _buildProgressIndicators() {
    return Column(
      children: [
        // Card counter
        Text(
          'Card ${currentCardIndex + 1} / ${flashcards[selectedLevel]!.length}',
          style: CustomTextStyle.subHeading,
        ),

        const SizedBox(height: 8),

        // Progress status
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLearnerCompleted && selectedLevel == 'Learner')
              Icon(Icons.check_circle, color: AppColors.success, size: 16),
            if (isProbationaryCompleted && selectedLevel == 'Probationary')
              Icon(Icons.check_circle, color: AppColors.success, size: 16),
            if (isFullCompleted && selectedLevel == 'Full')
              Icon(Icons.check_circle, color: AppColors.success, size: 16),

            const SizedBox(width: 4),

            Text(
              selectedLevel == 'Learner' && isLearnerCompleted
                  ? 'Completed!'
                  : selectedLevel == 'Probationary' && isProbationaryCompleted
                  ? 'Completed!'
                  : selectedLevel == 'Full' && isFullCompleted
                  ? 'Completed!'
                  : 'In Progress',
              style: CustomTextStyle.hint.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
