class Coin {
  final String type;
  final List<Map<String, dynamic>> content;

  Coin({required this.type, required this.content});
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      type: json['type'],
      content: json['content']
    );
  }
}