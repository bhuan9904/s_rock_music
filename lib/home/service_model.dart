class ServiceModel {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final String leadingIcon;

  ServiceModel({
    required this.title,
    required this.subtitle,
    required this.backgroundImage,
    required this.leadingIcon,
  });

  // Helper method to safely get string values from the map
  static String getString(Map<String, dynamic> map, String key) {
    // Try exact key first
    if (map.containsKey(key)) return map[key].toString();
    // Try key with trailing space
    if (map.containsKey('$key ')) return map['$key '].toString();
    // Try key with leading/trailing whitespace trimmed
    for (final k in map.keys) {
      if (k.trim() == key) return map[k].toString();
    }
    return '';
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      title: getString(map, 'title'),
      subtitle: getString(map, 'subtitle'),
      backgroundImage: getString(map, 'backgroundImage'),
      leadingIcon: getString(map, 'leadingIcon'),
    );
  }

factory ServiceModel.mock() {
  return ServiceModel(
    title: 'Music Streaming',
    subtitle: 'Listen to your favorite tracks',
    backgroundImage: 'assets/images/bg1.png',
    leadingIcon: 'assets/images/music_one.png',
  );
}



  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'backgroundImage': backgroundImage,
      'leadingIcon': leadingIcon,
    };
  }
}
