import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.type,
    this.avatarUrl,
  });

  final String name;
  final String type;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Glow effect
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6200EA).withValues(alpha: 0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
            // Avatar
            CircleAvatar(
              radius: 56,
              backgroundColor: Colors.grey.shade200,
              backgroundImage:
                  avatarUrl != null ? NetworkImage(avatarUrl!) : null,
              child: avatarUrl == null
                  ? const Icon(Icons.person, size: 64, color: Colors.grey)
                  : null,
            ),
            // Settings Icon (Absolute positioning)
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.grey),
                onPressed: () => context.go('/settings'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF6200EA).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            type,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xFF6200EA),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
          ),
        ),
      ],
    );
  }
}
