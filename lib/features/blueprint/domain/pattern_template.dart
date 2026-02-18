class PatternTemplate {
  final String id;
  final String category; // 'core_self', 'growth', 'relationships'
  final String title;
  final String shortDescription;
  final String longDescription;
  final List<String> reflectionPrompts;
  final String? iconName;

  const PatternTemplate({
    required this.id,
    required this.category,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.reflectionPrompts,
    this.iconName,
  });

  // No fromJson/toJson needed for constants, but useful if fetched from Firestore
  factory PatternTemplate.fromJson(Map<String, dynamic> json) {
    return PatternTemplate(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      shortDescription: json['shortDescription'] as String,
      longDescription: json['longDescription'] as String,
      reflectionPrompts: (json['reflectionPrompts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      iconName: json['iconName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
      'reflectionPrompts': reflectionPrompts,
      'iconName': iconName,
    };
  }
}
