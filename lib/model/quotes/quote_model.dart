class QuoteModel {
  String? id;
  String? categoryId;
  String? categoryName;
  String? quoteText;
  String? createdAt;

  QuoteModel({
    this.id,
    this.categoryId,
    this.categoryName,
    this.quoteText,
    this.createdAt,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id']?.toString(),
      categoryId: json['category_id']?.toString(),
      categoryName: json['category_name'] ?? '',
      quoteText: json['quote_text'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'category_name': categoryName,
      'quote_text': quoteText,
      'created_at': createdAt,
    };
  }
}
