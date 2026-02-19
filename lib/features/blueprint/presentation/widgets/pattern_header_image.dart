import 'package:flutter/material.dart';

class PatternHeaderImage extends StatelessWidget {
  const PatternHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4527A0), // Deep Purple
            Color(0xFF7B1FA2), // Purple
            Color(0xFFAB47BC), // Light Purple
          ],
        ),
      ),
      child: Stack(
        children: [
          // Abstract shapes/texture overlay
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          // Center Icon or Graphic
          Center(
            child: Icon(
              Icons.auto_awesome,
              size: 64,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
