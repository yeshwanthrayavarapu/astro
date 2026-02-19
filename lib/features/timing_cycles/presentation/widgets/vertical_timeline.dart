import 'package:flutter/material.dart';

class VerticalTimeline extends StatelessWidget {
  const VerticalTimeline({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Timeline line and dot
              Column(
                children: [
                  // Dot
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6200EA),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6200EA).withValues(alpha: 0.3),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  // Line
                  Expanded(
                    child: index != children.length - 1
                        ? Container(
                            width: 2,
                            color: const Color(0xFFE0E0E0), // Light grey line
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: children[index],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
