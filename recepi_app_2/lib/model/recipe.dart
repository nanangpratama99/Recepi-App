class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe(
      {required this.images,
      required this.name,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] != null ? json['name'] as String : '',
      images: json['images'] != null &&
              json['images'].isNotEmpty &&
              json['images'][0]['resizableImageUrl'] != null
          ? json['images'][0]['resizableImageUrl'] as String
          : '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      totalTime: json['totalTime'] != null ? json['totalTime'] as String : '',
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
