class SoccerLeagues {
  final int id;
  final String name;
  final String icon;
  final String updatedAt;
  final String createdAt;

  SoccerLeagues({
    required this.id,
    required this.name,
    required this.icon,
    required this.updatedAt,
    required this.createdAt,
  });

  factory SoccerLeagues.fromJson(Map<String, dynamic> json) {
    return SoccerLeagues(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}
