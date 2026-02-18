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
    final cs = Theme.of(context).colorScheme;
    // userPattern.isUnlocked == true => unlocked
    // userPattern.isUnlocked == false => locked

    final isLockedState = !userPattern.isUnlocked;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.outlineVariant),
      ),
      color: isLockedState
          ? cs.surfaceContainer.withAlpha(128)
          : cs.surfaceContainerLow,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getIcon(template.iconName),
                    color: isLockedState ? cs.onSurfaceVariant : cs.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      template.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isLockedState
                                ? cs.onSurfaceVariant
                                : cs.onSurface,
                          ),
                    ),
                  ),
                  if (isLockedState)
                    Icon(Icons.lock_outline,
                        size: 18, color: cs.onSurfaceVariant),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                template.shortDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 16),
              if (!isLockedState) ...[
                Row(
                  children: [
                    Text(
                      'Intensity',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: userPattern.intensity / 100,
                        backgroundColor: cs.surfaceContainerHighest,
                        color: cs.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${userPattern.intensity.toInt()}%',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ] else ...[
                Text(
                  'Unlock to reveal insights',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: cs.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ],
          ),
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
