class Player {
  final String name;
  final String socketId;
  final double points;
  final String playerType;

  Player(
      {required this.name,
      required this.socketId,
      required this.points,
      required this.playerType});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'socketId': socketId,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'] ?? '',
      socketId: map['socketId'] ?? '',
      points: map['points'] ?? '',
      playerType: map['playerType'] ?? '',
    );
  }

  Player copyWith({
    String? name,
    String? socketId,
    double? points,
    String? playerType,
  }) {
    return Player(
      name: name ?? this.name,
      socketId: socketId ?? this.socketId,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
