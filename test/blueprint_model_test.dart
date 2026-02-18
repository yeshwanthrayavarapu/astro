import 'package:flutter_test/flutter_test.dart';
import 'package:life_pattern/features/blueprint/domain/journal_entry.dart';
import 'package:life_pattern/features/blueprint/domain/user_pattern.dart';
import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';

void main() {
  test('UserPattern serialization round-trip', () {
    final pattern = UserPattern(
      id: '123',
      userId: 'user1',
      patternTemplateId: 'core_1',
      intensity: 85.5,
      isUnlocked: true,
      unlockedAt: DateTime(2023, 1, 1),
      journalEntries: [
        JournalEntry(
          id: 'j1',
          content: 'test content',
          createdAt: DateTime(2023, 1, 2),
        ),
      ],
    );

    final json = pattern.toJson();
    final fromJson = UserPattern.fromJson(json);

    expect(fromJson.id, pattern.id);
    expect(fromJson.userId, pattern.userId);
    expect(fromJson.intensity, pattern.intensity);
    expect(fromJson.isUnlocked, pattern.isUnlocked);
    expect(fromJson.journalEntries.length, 1);
    expect(fromJson.journalEntries.first.content, 'test content');
  });

  test('PatternTemplate serialization round-trip', () {
    final template = PatternTemplate(
      id: 'core_1',
      category: 'core',
      title: 'Title',
      shortDescription: 'Short',
      longDescription: 'Long',
      reflectionPrompts: ['Prompt 1'],
      iconName: 'icon',
    );

    final json = template.toJson();
    final fromJson = PatternTemplate.fromJson(json);

    expect(fromJson.id, template.id);
    expect(fromJson.title, template.title);
  });
}
