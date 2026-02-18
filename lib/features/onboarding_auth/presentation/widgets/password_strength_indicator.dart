import 'package:flutter/material.dart';

/// Visual password strength indicator bar.
///
/// Shows Weak / Fair / Strong based on password complexity.
class PasswordStrengthIndicator extends StatelessWidget {
  const PasswordStrengthIndicator({super.key, required this.password});

  final String password;

  _PasswordStrength get _strength {
    if (password.isEmpty) return _PasswordStrength.none;
    if (password.length < 6) return _PasswordStrength.weak;

    int score = 0;
    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) score++;

    if (score <= 1) return _PasswordStrength.weak;
    if (score <= 2) return _PasswordStrength.fair;
    return _PasswordStrength.strong;
  }

  @override
  Widget build(BuildContext context) {
    final strength = _strength;
    if (strength == _PasswordStrength.none) return const SizedBox.shrink();

    final cs = Theme.of(context).colorScheme;

    final (color, label, fraction) = switch (strength) {
      _PasswordStrength.weak => (cs.error, 'Weak', 0.33),
      _PasswordStrength.fair => (Colors.orange, 'Fair', 0.66),
      _PasswordStrength.strong => (Colors.green, 'Strong', 1.0),
      _PasswordStrength.none => (cs.outline, '', 0.0),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: fraction,
            backgroundColor: cs.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 4,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
        ),
      ],
    );
  }
}

enum _PasswordStrength { none, weak, fair, strong }
