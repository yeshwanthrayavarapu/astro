import 'package:flutter/material.dart';

class BondCard extends StatelessWidget {
  const BondCard({
    super.key,
    required this.name,
    required this.relation,
    required this.compatibilityScore,
    this.avatarUrl,
    this.onTap,
  });

  final String name;
  final String relation;
  final int compatibilityScore;
  final String? avatarUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Determine color based on score
    Color scoreColor;
    if (compatibilityScore >= 90) {
      scoreColor = const Color(0xFF00C853); // High - Green
    } else if (compatibilityScore >= 70) {
      scoreColor = const Color(0xFF6200EA); // Med-High - Purple
    } else if (compatibilityScore >= 50) {
      scoreColor = const Color(0xFFFFAB00); // Medium - Amber
    } else {
      scoreColor = const Color(0xFFD50000); // Low - Red
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigate to detail
            // We need the bond ID, but this widget only has display fields.
            // Assumption: The parent widget passes the ID or handles navigation,
            // OR we need to pass the ID into BondCard.
            // Let's assume we need to add `id` to BondCard.
            // Actually, for now, let's just make sure the `onTap` callback is exposed or handled.
            // Wait, the previous code had `// TODO: Navigate to Bond Detail`.
            // I should add `onTap` callback to the widget parameters or pass the ID.
            // Let's update the widget to accept an `id` or `onTap`.
            // Given the signature, let's add `onTap` callback.
            if (onTap != null) onTap!();
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    image: avatarUrl != null
                        ? DecorationImage(
                            image: NetworkImage(avatarUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: avatarUrl == null
                      ? Icon(Icons.person,
                          size: 32, color: Colors.grey.shade400)
                      : null,
                ),
                const SizedBox(height: 12),

                // Name
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  relation,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 16),

                // Score Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: scoreColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.auto_awesome, size: 14, color: scoreColor),
                      const SizedBox(width: 4),
                      Text(
                        '$compatibilityScore% Synergy',
                        style: TextStyle(
                          color: scoreColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
