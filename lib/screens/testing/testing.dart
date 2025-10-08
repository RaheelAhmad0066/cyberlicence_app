import 'package:cyber_licence/screens/completion/completion.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:math';

// EXACT MCQ Questions from DEVDOC - 20 questions per level
final Map<String, List<Map<String, dynamic>>> allPuzzles = {
  'Learner': [
    {
      'question': 'What is a password used for?',
      'options': [
        'To play games faster',
        'To watch videos',
        'To keep your accounts safe',
        'To make friends online',
      ],
      'correctIndex': 2,
      'explanation': 'Passwords protect your accounts.',
    },
    {
      'question': 'Which is a strong password?',
      'options': ['123456', 'password', 'Cat2018-!', 'abc'],
      'correctIndex': 2,
      'explanation': 'Strong passwords mix letters, numbers, symbols.',
    },
    {
      'question': 'Who should you share your password with?',
      'options': [
        'Best friend',
        'Your pet',
        'Only parents/guardians',
        'Everyone in class',
      ],
      'correctIndex': 2,
      'explanation': 'Only trusted adults help with passwords.',
    },
    {
      'question': 'Pop-up says \'Free iPad!\'—what now?',
      'options': [
        'Click fast',
        'Show it to an adult',
        'Type your name',
        'Share with friends',
      ],
      'correctIndex': 1,
      'explanation': 'Ask an adult; likely a scam.',
    },
    {
      'question': 'Which site is likely NOT safe?',
      'options': [
        'www.school.edu.au',
        'www.cartoonnetwork.com',
        'www.freegamesnow-randomclicks.xyz',
        'www.natgeokids.com',
      ],
      'correctIndex': 2,
      'explanation': 'Weird domains are risky.',
    },
    {
      'question': 'Stranger asks for your photo—do what?',
      'options': [
        'Send selfie',
        'Say hi',
        'Tell a trusted adult',
        'Ask for theirs',
      ],
      'correctIndex': 2,
      'explanation': 'Report to an adult immediately.',
    },
    {
      'question': 'Padlock icon on a browser tab means...',
      'options': [
        'Site is locked',
        'It\'s a secure website',
        'You can\'t use it',
        'It\'s a game site',
      ],
      'correctIndex': 1,
      'explanation': 'Padlock/HTTPS indicates security.',
    },
    {
      'question': 'Why log out after use?',
      'options': [
        'Save battery',
        'Keep your account safe',
        'So a friend can play',
        'Clear screen',
      ],
      'correctIndex': 1,
      'explanation': 'Prevents others using your account.',
    },
    {
      'question': 'If someone is mean online...',
      'options': [
        'Be mean back',
        'Tell a trusted adult',
        'Ignore forever',
        'Share it',
      ],
      'correctIndex': 1,
      'explanation': 'Get help; don\'t retaliate.',
    },
    {
      'question': 'Okay to share online?',
      'options': [
        'Full name',
        'Home address',
        'School name',
        'Favourite colour',
      ],
      'correctIndex': 3,
      'explanation': 'Keep private details off the web.',
    },
    {
      'question': 'What is phishing?',
      'options': [
        'Fishing game',
        'Tricking to steal info',
        'Playing puzzles',
        'Searching videos',
      ],
      'correctIndex': 1,
      'explanation': 'Phishing tries to steal info.',
    },
    {
      'question': 'Stay safe on public Wi-Fi by...',
      'options': [
        'Never using it',
        'Only gaming',
        'Asking an adult first',
        'Sharing password',
      ],
      'correctIndex': 2,
      'explanation': 'Check with an adult before connecting.',
    },
    {
      'question': 'A site asks age & address—do what?',
      'options': [
        'Type quickly',
        'Play elsewhere',
        'Ask an adult before continuing',
        'Share with a friend',
      ],
      'correctIndex': 2,
      'explanation': 'Confirm with an adult first.',
    },
    {
      'question': 'Before downloading an app...',
      'options': [
        'Download all fun ones',
        'Ask a friend',
        'Ask a parent/teacher',
        'Check for cartoons',
      ],
      'correctIndex': 2,
      'explanation': 'Adults help verify safety.',
    },
    {
      'question': 'Friend sends \'Free game coins\' link...',
      'options': [
        'Click fast',
        'Ask an adult first',
        'Forward to friends',
        'Try on phone',
      ],
      'correctIndex': 1,
      'explanation': 'Likely a scam—don\'t click.',
    },
    {
      'question': 'See a red warning on site—do what?',
      'options': [
        'Close tab & tell an adult',
        'Keep browsing',
        'Try later',
        'Refresh page',
      ],
      'correctIndex': 0,
      'explanation': 'Warnings mean stop and seek help.',
    },
    {
      'question': 'Why do apps ask location?',
      'options': [
        'Find friends',
        'No reason',
        'Track where you are',
        'Play music',
      ],
      'correctIndex': 2,
      'explanation': 'Location can reveal private info.',
    },
    {
      'question': 'Why not same password everywhere?',
      'options': [
        'Easier to remember',
        'One leak opens all',
        'It\'s fun',
        'Friends will guess',
      ],
      'correctIndex': 1,
      'explanation': 'Re-use increases risk.',
    },
    {
      'question': 'Good password habit is...',
      'options': [
        'Share with friends',
        'Change regularly',
        'Keep it easy',
        'Use pet\'s name',
      ],
      'correctIndex': 1,
      'explanation': 'Update passwords over time.',
    },
    {
      'question': 'Before clicking any link...',
      'options': [
        'Check where it goes',
        'Click fast',
        'Ask a friend to try',
        'Guess what it is',
      ],
      'correctIndex': 0,
      'explanation': 'Always check first.',
    },
  ],
  'Probationary': [
    {
      'question': 'What is personal information?',
      'options': [
        'Favorite color',
        'Home address',
        'Pet\'s nickname',
        'Favorite snack',
      ],
      'correctIndex': 1,
      'explanation': 'Your home address is private and should not be shared.',
    },
    {
      'question': 'Why keep your birthday private online?',
      'options': [
        'Hackers might guess passwords',
        'So friends forget it',
        'It changes daily',
        'It\'s not important',
      ],
      'correctIndex': 0,
      'explanation': 'Birthdays are often used in weak passwords.',
    },
    {
      'question': 'What is a digital footprint?',
      'options': [
        'A footprint in sand',
        'Everything you post online',
        'A computer game',
        'Shoe size',
      ],
      'correctIndex': 1,
      'explanation': 'Posts, likes, and shares can stay online a long time.',
    },
    {
      'question': 'Which site is safer to use?',
      'options': [
        'www.freegift-now.net',
        'www.roblox.com',
        'www.win-prize.click',
        'www.0fficial-youtube.info',
      ],
      'correctIndex': 1,
      'explanation': 'Recognizable, trusted domains are safer.',
    },
    {
      'question': 'What is phishing?',
      'options': [
        'Playing fishing games',
        'Posting photos',
        'Sending memes',
        'Scammers pretending to be real',
      ],
      'correctIndex': 3,
      'explanation': 'Phishing tries to trick you into sharing info.',
    },
    {
      'question': 'What do you do with a weird link in chat?',
      'options': [
        'Click it fast',
        'Ignore or ask an adult',
        'Share with everyone',
        'Save for later',
      ],
      'correctIndex': 1,
      'explanation': 'Don\'t click strange links—check first.',
    },
    {
      'question': 'How do you know a site is secure?',
      'options': [
        'It loads fast',
        'Has a padlock and HTTPS on browser',
        'Has a lock picture in a banner',
        'Is colorful',
      ],
      'correctIndex': 1,
      'explanation': 'HTTPS and a padlock are safety signals.',
    },
    {
      'question': 'What to do with a suspicious email?',
      'options': [
        'Reply politely',
        'Click the link inside',
        'Delete or report it',
        'Print it',
      ],
      'correctIndex': 2,
      'explanation': 'Don\'t interact—report or delete it.',
    },
    {
      'question': 'Which is safe to share online?',
      'options': [
        'Your real name',
        'Your favorite game',
        'Your home address',
        'Your school name',
      ],
      'correctIndex': 1,
      'explanation': 'Interests are fine; private details are not.',
    },
    {
      'question': 'Best action for a fake giveaway?',
      'options': [
        'Enter your email',
        'Share it widely',
        'Report and ignore',
        'Ask a stranger to check',
      ],
      'correctIndex': 2,
      'explanation': 'Report it and don\'t engage.',
    },
    {
      'question': 'Why is same password risky?',
      'options': [
        'Hard to type',
        'One hack opens all accounts',
        'It\'s too short',
        'It\'s funny',
      ],
      'correctIndex': 1,
      'explanation': 'Reusing passwords spreads the risk.',
    },
    {
      'question': 'When should you ask an adult?',
      'options': [
        'When confused online',
        'When you win a game',
        'When internet is slow',
        'When texting a friend',
      ],
      'correctIndex': 0,
      'explanation': 'Get help when unsure.',
    },
    {
      'question': 'Why use privacy settings?',
      'options': [
        'To block ads',
        'To keep strangers out',
        'To make apps free',
        'To change colors',
      ],
      'correctIndex': 1,
      'explanation': 'Private accounts limit who can see you.',
    },
    {
      'question': 'Before installing a new app, you should...',
      'options': [
        'Install all apps',
        'Ignore permissions',
        'Ask a parent/teacher',
        'Share it with friends',
      ],
      'correctIndex': 2,
      'explanation': 'Adults can help check safety.',
    },
    {
      'question': 'Safest username for games is...',
      'options': [
        'JohnSmith2010',
        'Your address',
        'Your real name',
        'StarTiger',
      ],
      'correctIndex': 3,
      'explanation': 'Use a nickname, not personal info.',
    },
    {
      'question': 'If someone is mean in game chat, you...',
      'options': [
        'Be mean back',
        'Block and report',
        'Ignore your feelings',
        'Send your photo',
      ],
      'correctIndex': 1,
      'explanation': 'Block/report and tell an adult.',
    },
    {
      'question': 'Why avoid "Free Robux" links?',
      'options': [
        'They steal info',
        'They give coins',
        'They are slow',
        'They ask only for email',
      ],
      'correctIndex': 0,
      'explanation': 'They often lead to scams.',
    },
    {
      'question': 'Which is a scam sign?',
      'options': [
        'Free iPhone ad',
        'Slow website',
        'Calm, clear title',
        'Teacher\'s email',
      ],
      'correctIndex': 0,
      'explanation': 'Too good to be true',
    },
    {
      'question': 'How to handle a stranger\'s friend request?',
      'options': [
        'Accept to be nice',
        'Chat first',
        'Ignore or decline',
        'Share your nickname',
      ],
      'correctIndex': 2,
      'explanation': 'Don\'t engage with strangers.',
    },
    {
      'question': 'First step if you get scammed?',
      'options': [
        'Tell an adult',
        'Hide it',
        'Send more info',
        'Delete the app quietly',
      ],
      'correctIndex': 0,
      'explanation': 'Get help immediately and change passwords.',
    },
  ],
  'Full': [
    {
      'question': 'What is digital citizenship?',
      'options': [
        'Being online all day',
        'Being responsible and safe online',
        'Owning many devices',
        'Posting everything',
      ],
      'correctIndex': 1,
      'explanation':
          'Digital citizenship is safe, kind, and smart behavior online.',
    },
    {
      'question': 'What is cyberbullying?',
      'options': [
        'Friendly messages',
        'Being mean or harmful online',
        'Playing games',
        'Watching videos',
      ],
      'correctIndex': 1,
      'explanation': 'Cyberbullying is harmful behavior using digital tools.',
    },
    {
      'question': 'Best response to cyberbullying?',
      'options': [
        'Be mean back',
        'Share it around',
        'Block, report, tell an adult',
        'Ignore forever',
      ],
      'correctIndex': 2,
      'explanation': 'Get help and stop the harm safely.',
    },
    {
      'question': 'What is misinformation?',
      'options': [
        'A school email',
        'False info online',
        'Your homework',
        'A class notice',
      ],
      'correctIndex': 1,
      'explanation': 'Misinformation is untrue or misleading content.',
    },
    {
      'question': 'Sign of fake news?',
      'options': [
        'ALL CAPS, shocking words',
        'Calm title',
        'Posted by your teacher',
        'Short headline',
      ],
      'correctIndex': 0,
      'explanation': 'Over-the-top titles can be a red flag.',
    },
    {
      'question': 'Why balance screen time?',
      'options': [
        'Devices are heavy',
        'Too much can harm health',
        'Teachers hate phones',
        'Wi-Fi slows down',
      ],
      'correctIndex': 1,
      'explanation': 'Balance supports sleep, mood, and focus.',
    },
    {
      'question': 'Why respect others\' privacy online?',
      'options': [
        'To get likes',
        'To avoid hurting them',
        'To be faster online',
        'To win games',
      ],
      'correctIndex': 1,
      'explanation': 'Sharing others\' info without permission is harmful.',
    },
    {
      'question': 'Which app has report tools?',
      'options': ['Paint', 'Calculator', 'TikTok', 'Camera'],
      'correctIndex': 2,
      'explanation': 'Most social apps include reporting tools.',
    },
    {
      'question': 'Why think before posting?',
      'options': [
        'To get likes',
        'Posts can affect real life',
        'To win games',
        'It\'s funny',
      ],
      'correctIndex': 1,
      'explanation': 'Online actions can have real consequences.',
    },
    {
      'question': 'Why read terms & conditions?',
      'options': [
        'To find jokes',
        'They explain the rules',
        'For homework',
        'To delete apps',
      ],
      'correctIndex': 1,
      'explanation': 'They outline what\'s allowed and expected.',
    },
    {
      'question': '"If you share a secret online"',
      'options': [
        'Stays private',
        'Can spread quickly',
        'Disappears',
        'Only friends see it',
      ],
      'correctIndex': 1,
      'explanation': 'It can spread fast and widely.',
    },
    {
      'question': 'Which headline is likely fake?',
      'options': [
        'Teacher Announces Field Trip',
        'BREAKING: FREE PHONES FOR EVERY STUDENT!',
        'Library Closed',
        'Math Test on Friday',
      ],
      'correctIndex': 1,
      'explanation': 'Extreme claims suggest low credibility.',
    },
    {
      'question': 'Why avoid peer pressure online, it...?',
      'options': [
        'It\'s boring',
        'Can lead to unsafe choices',
        'Friends are wrong',
        'Apps break',
      ],
      'correctIndex': 1,
      'explanation': 'Make choices based on safety and values.',
    },
    {
      'question': '"Build a good reputation by..."',
      'options': [
        'Posting kind, positive things',
        'Fighting online',
        'Ignoring rules',
        'Copying others',
      ],
      'correctIndex': 0,
      'explanation': 'Positive posts create a strong reputation.',
    },
    {
      'question': 'Healthy online habit?',
      'options': [
        'Take short breaks',
        'Never log out',
        'Stay up all night',
        'Reply to everyone',
      ],
      'correctIndex': 0,
      'explanation': 'Breaks protect health and focus.',
    },
    {
      'question': 'Why add context/emojis?',
      'options': [
        'For fun only',
        'Avoid being misunderstood',
        'To fill space',
        'Unlock features',
      ],
      'correctIndex': 1,
      'explanation': 'They help your message be clear and kind.',
    },
    {
      'question': 'How can posts affect your future?',
      'options': [
        'They disappear',
        'Schools/jobs may see them',
        'They speed up games',
        'Only reach friends',
      ],
      'correctIndex': 1,
      'explanation': 'Old posts can be found later.',
    },
    {
      'question': 'Why not forward bullying messages?',
      'options': [
        'Uses Wi-Fi',
        'Spreads the harm',
        'Takes time',
        'Fills storage',
      ],
      'correctIndex': 1,
      'explanation': 'Forwarding makes the problem worse.',
    },
    {
      'question': '"If someone pressures you online..."',
      'options': [
        'Do what they say',
        'Ignore or leave',
        'Share your password',
        'Post your info',
      ],
      'correctIndex': 1,
      'explanation': 'Protect yourself—step away and tell an adult.',
    },
    {
      'question': '"Be a role model online..."',
      'options': [
        'Being positive and responsible',
        'Sharing everything',
        'Winning games',
        'Ignoring others',
      ],
      'correctIndex': 0,
      'explanation': 'Lead with kindness, safety, and respect.',
    },
  ],
};

class TestingScreen extends StatefulWidget {
  final String level;
  final Function(bool) onPass;

  const TestingScreen({super.key, required this.level, required this.onPass});

  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedOptionIndex;
  Random random = Random();
  bool showExplanation = false;
  String? currentExplanation;
  bool hasAnswered = false; // NEW: Track if user has answered

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    // Get 10 random questions from the 20 available
    final allQuestions = List<Map<String, dynamic>>.from(
      allPuzzles[widget.level]!,
    );
    allQuestions.shuffle(random);
    selectedQuestions = allQuestions.take(10).toList();

    currentQuestionIndex = 0;
    score = 0;
    selectedOptionIndex = null;
    showExplanation = false;
    hasAnswered = false;
    setState(() {});
  }

  void _selectOption(int index) {
    // Only allow selection if user hasn't answered yet
    if (hasAnswered) return;

    setState(() {
      selectedOptionIndex = index;
      currentExplanation =
          selectedQuestions[currentQuestionIndex]['explanation'];
      showExplanation = true;
      hasAnswered = true;

      // Check if answer is correct and update score immediately
      if (selectedOptionIndex ==
          selectedQuestions[currentQuestionIndex]['correctIndex']) {
        score++;
      }
    });
  }

  void _nextQuestion() {
    if (!hasAnswered) return; // Must answer before proceeding

    setState(() {
      if (currentQuestionIndex < selectedQuestions.length - 1) {
        currentQuestionIndex++;
        selectedOptionIndex = null;
        showExplanation = false;
        hasAnswered = false;
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    // Pass requires 90% or more (9 out of 10)
    bool passed = score >= 9;
    widget.onPass(passed);

    String resultTitle = passed ? "Congratulations! 🎉" : "Oops! Try Again 😞";

    // Different messages for Full level vs others
    String continueButtonText;
    if (passed) {
      if (widget.level == 'Full') {
        continueButtonText = "View Your CyberLicence";
      } else {
        continueButtonText = "Continue to Next Level";
      }
    } else {
      continueButtonText = "Retry Puzzle";
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => FadeInUp(
        child: AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                passed ? Icons.verified_rounded : Icons.error_outline_rounded,
                size: 70,
                color: passed ? AppColors.success : AppColors.error,
              ),
              const SizedBox(height: 16),
              Text(
                resultTitle,
                style: CustomTextStyle.headingLargeDark.copyWith(
                  color: passed ? AppColors.success : AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "You scored $score / 10 (${(score * 10)}%)",
                style: CustomTextStyle.body.copyWith(
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              if (!passed)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "You need 90% (9/10) to pass",
                    style: CustomTextStyle.hint.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),

              // Primary Action Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (passed) {
                    // Go to completion screen if passed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompletionScreen(level: widget.level),
                      ),
                    );
                  } else {
                    // Retry - reload new random questions
                    _loadQuestions();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: passed ? AppColors.success : AppColors.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                child: Text(
                  continueButtonText,
                  style: CustomTextStyle.subHeading.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 12),

              // Back to Flashcards button
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Go back to flashcards
                },
                child: Text(
                  "Back to Flashcards",
                  style: CustomTextStyle.subHeading.copyWith(
                    color: passed ? AppColors.success : AppColors.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _restartTest() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Restart Test?", style: CustomTextStyle.headingLargeDark),
        content: Text(
          "Your current progress will be lost. Start with a new set of 10 random questions?",
          style: CustomTextStyle.body,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: CustomTextStyle.subHeading.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _loadQuestions();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Restart",
              style: CustomTextStyle.subHeading.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (selectedQuestions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentQuestion = selectedQuestions[currentQuestionIndex];
    final options = currentQuestion['options'] as List<String>;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'Puzzle - ${widget.level}',
          style: CustomTextStyle.headingLargeGreen.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _restartTest,
            tooltip: "Restart with new questions",
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Progress indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.extension,
                    color: AppColors.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Puzzle ${currentQuestionIndex + 1} of 10",
                    style: CustomTextStyle.subHeading,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: (currentQuestionIndex + 1) / 10,
                backgroundColor: AppColors.cardBackground,
                color: AppColors.primary,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 24),

              // Question
              Container(
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
                child: Text(
                  currentQuestion['question'],
                  style: CustomTextStyle.headingLargeGreen.copyWith(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              // Answer Options (A, B, C, D)
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final optionLabel = String.fromCharCode(65 + index);
                    final isSelected = selectedOptionIndex == index;
                    final isCorrect = index == currentQuestion['correctIndex'];
                    final showCorrect = hasAnswered && isCorrect;
                    final showIncorrect =
                        hasAnswered && isSelected && !isCorrect;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ZoomIn(
                        delay: Duration(milliseconds: 100 * index),
                        child: InkWell(
                          onTap: () => _selectOption(index),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: showCorrect
                                  ? AppColors.success
                                  : showIncorrect
                                  ? AppColors.error
                                  : AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: showCorrect
                                    ? AppColors.success
                                    : showIncorrect
                                    ? AppColors.error
                                    : AppColors.textSecondary.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: (showCorrect || showIncorrect)
                                        ? Colors.white
                                        : AppColors.primary.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      optionLabel,
                                      style: CustomTextStyle.subHeading
                                          .copyWith(
                                            color: showCorrect
                                                ? AppColors.success
                                                : showIncorrect
                                                ? AppColors.error
                                                : AppColors.textPrimary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    options[index],
                                    style: CustomTextStyle.body.copyWith(
                                      color: (showCorrect || showIncorrect)
                                          ? Colors.white
                                          : AppColors.textPrimary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                if (showCorrect)
                                  const Icon(Icons.check, color: Colors.white),
                                if (showIncorrect)
                                  const Icon(Icons.close, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Explanation
              if (showExplanation && currentExplanation != null)
                FadeInUp(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: AppColors.secondary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            currentExplanation!,
                            style: CustomTextStyle.body.copyWith(
                              color: AppColors.textPrimary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: hasAnswered ? _nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.textSecondary
                        .withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    currentQuestionIndex < selectedQuestions.length - 1
                        ? "Next Puzzle"
                        : "Finish",
                    style: CustomTextStyle.subHeading.copyWith(
                      color: Colors.white,
                      fontSize: 18,
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
}
