import 'package:cyber_licence/screens/completion/completion.dart';
import 'package:cyber_licence/screens/flashcard/flashcard.dart';
import 'package:cyber_licence/utils/app_styles.dart';
import 'package:cyber_licence/utils/colors.dart';

import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'dart:math';

class TestingScreen extends StatefulWidget {
  final String level;
  final Function(bool) onPass;

  const TestingScreen({super.key, required this.level, required this.onPass});

  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  List<Map<String, String>> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  List<int> usedIndices = [];
  Random random = Random();
  List<String> answerOptions = [];
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    final allQuestions = flashcards[widget.level]!;
    usedIndices.clear();
    questions.clear();
    while (usedIndices.length < 10 && allQuestions.isNotEmpty) {
      int index = random.nextInt(allQuestions.length);
      if (!usedIndices.contains(index)) {
        usedIndices.add(index);
        questions.add(allQuestions[index]);
      }
    }
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    _generateAnswerOptions();
    setState(() {});
  }

  void _generateAnswerOptions() {
    if (currentQuestionIndex >= questions.length) return;
    final allAnswers = flashcards[widget.level]!
        .map((q) => q['answer']!)
        .toList();
    answerOptions.clear();
    answerOptions.add(questions[currentQuestionIndex]['answer']!);
    while (answerOptions.length < 4) {
      final randomAnswer = allAnswers[random.nextInt(allAnswers.length)];
      if (!answerOptions.contains(randomAnswer)) {
        answerOptions.add(randomAnswer);
      }
    }
    answerOptions.shuffle();
    setState(() {});
  }

  void _checkAnswer(String selected) {
    setState(() {
      selectedAnswer = selected;
    });
    if (selected == questions[currentQuestionIndex]['answer']) {
      score++;
    }
  }

  void _nextQuestion() {
    if (selectedAnswer == null) return;
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
        _generateAnswerOptions();
      } else {
        _showResult();
      }
    });
  }

  void _showResult() async {
    bool passed = score >= 9;
    widget.onPass(passed);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => FadeInUp(
        child: AlertDialog(
          backgroundColor: passed
              ? AppColors.success.withOpacity(0.15)
              : AppColors.error.withOpacity(0.15),
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
                passed ? "Congratulations! 🎉" : "Oops! Try Again 😞",
                style: CustomTextStyle.headingLargeDark.copyWith(
                  color: passed ? AppColors.success : AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "You scored $score / 10",
                style: CustomTextStyle.body.copyWith(
                  color: passed ? AppColors.success : AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (passed) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompletionScreen(level: widget.level),
                      ),
                    );
                  } else {
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
                  passed ? "Next Level" : "Retry",
                  style: CustomTextStyle.subHeading.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              if (!passed)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back to Flashcards",
                    style: CustomTextStyle.subHeading.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty || answerOptions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Puzzle Header
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
              Text(
                questions[currentQuestionIndex]['question']!,
                style: CustomTextStyle.headingLargeGreen.copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Answer Options
              Expanded(
                child: ListView.builder(
                  itemCount: answerOptions.length,
                  itemBuilder: (context, index) {
                    final option = answerOptions[index];
                    final isSelected = option == selectedAnswer;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ZoomIn(
                        delay: Duration(milliseconds: 100 * index),
                        child: isSelected
                            ? ElevatedButton(
                                onPressed: () => _checkAnswer(option),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.success,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 24,
                                  ),
                                ),
                                child: Text(
                                  option,
                                  style: CustomTextStyle.subHeading.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : OutlinedButton(
                                onPressed: () => _checkAnswer(option),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: AppColors.primary,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 24,
                                  ),
                                ),
                                child: Text(
                                  option,
                                  style: CustomTextStyle.body.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Next Button
              ElevatedButton(
                onPressed: selectedAnswer != null ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 14,
                  ),
                ),
                child: Text(
                  "Solve Puzzle",
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
}
