import 'package:flutter/material.dart';
import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';
import 'package:life_pattern/features/blueprint/domain/user_pattern.dart';

class PatternCard extends StatelessWidget {
  const PatternCard({
    super.key,
    required this.userPattern,
    required this.template,
    required this.onTap,
  });

  final UserPattern userPattern;
  final PatternTemplate template;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // New design: White card with purple accent
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6200EA).withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Icon & Name
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3E5F5), // Light purple
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getIcon(template.iconName),
                    color: const Color(0xFFAB47BC),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    template.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
                if (!userPattern.isUnlocked)
                  const Icon(Icons.lock, size: 16, color: Color(0xFFE0E0E0))
                else
                  const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Color(0xFFE0E0E0)),
              ],
            ),

            const SizedBox(height: 12),

            // Short Description
            Text(
              template.shortDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF757575),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            // Intensity / Status
            if (userPattern.isUnlocked)
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: userPattern.intensity / 100,
                        backgroundColor: const Color(0xFFF5F5F5),
                        valueColor: AlwaysStoppedAnimation(
                          const Color(0xFF6200EA).withValues(alpha: 0.5),
                        ),
                        minHeight: 4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${userPattern.intensity.toInt()}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6200EA).withValues(alpha: 0.8),
                    ),
                  ),
                ],
              )
            else
              Text(
                'Unlock to reveal',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6200EA).withValues(alpha: 0.8),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String? name) {
    if (name == null) return Icons.star_outline;
    switch (name) {
      case 'water_drop':
        return Icons.water_drop_outlined;
      case 'flight':
        return Icons.flight_outlined;
      case 'psychology':
        return Icons.psychology_outlined;
      case 'favorite':
        return Icons.favorite_border;
      case 'palette':
        return Icons.palette_outlined;
      case 'healing':
        return Icons.healing_outlined;
      case 'star':
        return Icons.star_border;
      case 'change_circle':
        return Icons.change_circle_outlined;
      case 'balance':
        return Icons.balance_outlined;
      case 'mic':
        return Icons.mic_none;
      case 'diversity_1':
        return Icons.diversity_1_outlined;
      case 'shield':
        return Icons.shield_outlined;
      case 'chat_bubble':
        return Icons.chat_bubble_outline;
      case 'handshake':
        return Icons.handshake_outlined;
      case 'group':
        return Icons.group_outlined;
      default:
        return Icons.star_outline;
    }
  }
}
