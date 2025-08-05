class ScheduleModel {
  final String id;
  final String title;
  final String description;
  final String classType;
  final String category;
  final String tags;
  final DateTime date;
  final DateTime time;
  final String duration;
  final String repeat;
  final String location;
  final int maxAttendees;

  ScheduleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.classType,
    required this.category,
    required this.tags,
    required this.date,
    required this.time,
    required this.duration,
    required this.repeat,
    required this.location,
    required this.maxAttendees,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json, String id) {
    return ScheduleModel(
      id: id,
      title: json['title'],
      description: json['description'],
      classType: json['classType'],
      category: json['category'],
      tags: json['tags'],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      duration: json['duration'],
      repeat: json['repeat'],
      location: json['location'],
      maxAttendees: json['maxAttendees'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'classType': classType,
      'category': category,
      'tags': tags,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'duration': duration,
      'repeat': repeat,
      'location': location,
      'maxAttendees': maxAttendees,
    };
  }
}
