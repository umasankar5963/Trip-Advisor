class SevenWondersModel {
  List<SevenWonder> sevenWonders;

  SevenWondersModel({required this.sevenWonders});

  factory SevenWondersModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> wondersList = json['seven_wonders'];
    List<SevenWonder> wonders =
        wondersList.map((wonder) => SevenWonder.fromJson(wonder)).toList();
    return SevenWondersModel(sevenWonders: wonders);
  }
}

class SevenWonder {
  String name;
  String location;
  String details;
  String budget;
  String timings;
  String workingDays;
  String assetImage;

  SevenWonder({
    required this.name,
    required this.location,
    required this.details,
    required this.budget,
    required this.timings,
    required this.workingDays,
    required this.assetImage,
  });

  factory SevenWonder.fromJson(Map<String, dynamic> json) {
    return SevenWonder(
      name: json['name'],
      location: json['location'],
      details: json['details'],
      budget: json['budget'],
      timings: json['Timeings'],
      workingDays: json['working_days'],
      assetImage: json['asset_image'],
    );
  }
}
