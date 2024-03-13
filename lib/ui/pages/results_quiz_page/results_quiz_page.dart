import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flags_app/core/models/quiz/answer.dart';
import 'package:flags_app/core/models/quiz/question.dart';
import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flags_app/ui/components/primary_button.dart';
import 'package:flags_app/ui/components/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultsQuizPage extends StatefulActionMapper {
  const ResultsQuizPage({
    super.key,
    required this.answers,
  });

  final Map<Question, Answer> answers;

  @override
  State<ResultsQuizPage> createState() => _ResultsQuizPageState();
}

class _ResultsQuizPageState extends State<ResultsQuizPage> {
  late final ConfettiController _controllerTopCenter;
  int _correctAnswer = 0;
  double _percent = 0.0;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    widget.answers.forEach((key, value) {
      if (value.correct) {
        _correctAnswer++;
      }
    });
    _percent = (_correctAnswer / widget.answers.length).clamp(0.0, 1.0);
    if (_percent >= 0.7) {
      _controllerTopCenter.play();
    }
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percent100 = 100 * _percent;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/flag_bg.png',
              alignment: Alignment.bottomCenter,
              opacity: const AlwaysStoppedAnimation(0.1),
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/bg_kuis.png',
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          //TOP CENTER - shoot down
          Positioned(
            top: -50,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              maxBlastForce: 5, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 0.05,
              createParticlePath: drawStar,
              numberOfParticles: 10, // a lot of particles at once
              gravity: 1,
            ),
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserWidget(
                  builder: (_, user) => Text(
                    'Hasil Kuis ${user.fullName}',
                    style: GoogleFonts.lilitaOne(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CircularPercentIndicator(
                  radius: 100,
                  percent: _percent,
                  animation: true,
                  lineWidth: 10,
                  linearGradient: const LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white70,
                    ],
                  ),
                  center: Text(
                    '${percent100.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.white10,
                ),
                const SizedBox(height: 20),
                Text(
                  'benar $_correctAnswer/${widget.answers.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 230,
                  child: PrimaryButton(
                    text: 'Kuis Lagi',
                    color: Colors.orange,
                    onTap: () => widget.dispatch(
                      const NavigateToAndReplaceAction('/quiz'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => widget.dispatch(
                    const NavigateToRootAction(),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
