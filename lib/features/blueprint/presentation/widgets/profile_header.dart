import 'package:flutter/material.dart';

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
        // Avatar with Glow
        Container(
          width: 100,
          height: 100,
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
            image: avatarUrl != null
                ? DecorationImage(
                    image: NetworkImage(avatarUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: avatarUrl == null
              ? const Icon(Icons.person, size: 48, color: Color(0xFFB39DDB))
              : null,
        ),
        const SizedBox(height: 16),

        // Name
        Text(
          name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A1A),
              ),
        ),

        const SizedBox(height: 8),

        // Type Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6), // Light purple
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFD1C4E9)),
          ),
          child: Text(
            type.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF6200EA),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
