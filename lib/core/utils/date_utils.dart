import 'package:intl/intl.dart';

/// Utility functions for date and time formatting used across the app.
abstract final class AppDateUtils {
  static final DateFormat _dateFormat = DateFormat('MMMM d, y');
  static final DateFormat _timeFormat = DateFormat('h:mm a');
  static final DateFormat _shortDateFormat = DateFormat('MMM d');

  /// Formats a [DateTime] as "January 1, 2000".
  static String formatDate(DateTime date) => _dateFormat.format(date);

  /// Formats a [DateTime] as "12:00 PM".
  static String formatTime(DateTime date) => _timeFormat.format(date);

  /// Formats a [DateTime] as "Jan 1".
  static String formatShortDate(DateTime date) => _shortDateFormat.format(date);

  /// Returns the user's age from a birth date.
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
