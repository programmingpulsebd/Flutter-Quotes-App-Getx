class SliderImage {
  final String id;
  final String image;

  SliderImage({required this.id, required this.image});

  factory SliderImage.fromJson(Map<String, dynamic> json) {
    return SliderImage(
      id: json['id'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
