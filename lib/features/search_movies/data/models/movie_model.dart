class MovieModel {
  int id;
  String name;
  List<String> writers;
  int releaseYear;

  MovieModel(
      {required this.id,
      required this.name,
      required this.writers,
      required this.releaseYear});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        name: json['name'],
        writers: List<String>.from(json['writers']),
        releaseYear: json['release_year']);
  }
}
