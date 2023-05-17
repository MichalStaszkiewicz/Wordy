class Achievement {
  Achievement(
      {required this.id,
      required this.name,
      required this.description,
      required this.goal,
      this.progress});

  int id;
  String name;
  String description;
  int goal;
  int? progress;
}
