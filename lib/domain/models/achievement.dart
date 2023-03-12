class Achievement {
  Achievement(
      {required this.name,
      required this.image,
      required this.description,
      required this.achieved,
      required this.currentProgress,
      required this.progressToAchieve});
  String name;
  String image;
  String description;
  bool achieved;
  int currentProgress;
  int progressToAchieve;
}
