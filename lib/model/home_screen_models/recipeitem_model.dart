class Recipeitemmodel {
  String imagePath;
  String name;
  double? rating;
  String? time;
  bool isLiked;
  Recipeitemmodel({
    required this.imagePath,
    required this.name,
    this.rating,
    this.time,
    this.isLiked=false,
    });
}

