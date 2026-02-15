class Quotes {
  String? id;
  String? monishiId;
  String? monishiName;
  String? quote;
  String? createdAt;

  Quotes({
    this.id,
    this.monishiId,
    this.monishiName,
    this.quote,
    this.createdAt,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['id']?.toString(),
      monishiId: json['monishi_id']?.toString(),
      monishiName: json['monishi_name'],
      quote: json['quote'],         // ✔ correct key
      createdAt: json['created_at'],
    );
  }
}
