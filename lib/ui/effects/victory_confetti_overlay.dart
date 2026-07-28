import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class VictoryConfettiOverlay extends StatefulWidget {
  final bool enabled;
  final Duration duration;
  final Widget child;

  const VictoryConfettiOverlay({
    super.key,
    required this.child,
    this.enabled = true,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<VictoryConfettiOverlay> createState() => VictoryConfettiOverlayState();
}

class VictoryConfettiOverlayState extends State<VictoryConfettiOverlay> {
  late final ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: widget.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void play() {
    if (!widget.enabled) return;
    _controller.stop();
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        IgnorePointer(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 22,
              maxBlastForce: 18,
              minBlastForce: 8,
              gravity: 0.35,
              shouldLoop: false,
            ),
          ),
        ),
        IgnorePointer(
          child: Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirection: 0.2,
              emissionFrequency: 0.03,
              numberOfParticles: 12,
              gravity: 0.4,
            ),
          ),
        ),
        IgnorePointer(
          child: Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirection: 2.9,
              emissionFrequency: 0.03,
              numberOfParticles: 12,
              gravity: 0.4,
            ),
          ),
        ),
      ],
    );
  }
}
