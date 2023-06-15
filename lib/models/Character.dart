class Character {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;

  const Character({
    required this.id,
    this.name = "",
    this.image = "",
    this.status = "",
    this.species = "",
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
    );
  }
}
