import 'package:capstone_alterra_flutter/model/trainer_model.dart';

class OfflineModel {
  OfflineModel({
    this.id,
    this.title,
    required this.time,
    this.price,
    this.duration,
    this.slot,
    this.slotBooked,
    this.picture,
    this.trainerId,
    this.trainerName,
    this.location,
    this.description,
    this.accessClass,
    this.offlineClassCategory,
    this.trainerModel,
  });

  int? id;
  String? title;
  DateTime time;
  int? price;
  int? duration;
  int? slot;
  double? slotBooked;
  String? picture;
  int? trainerId;
  String? trainerName;
  String? location;
  String? description;
  bool? accessClass;
  OfflineClassCategory? offlineClassCategory;
  TrainerModel? trainerModel;

  factory OfflineModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      OfflineModel(
        id: json["id"],
        title: json["title"],
        time: DateTime.parse(json["time"]),
        price: json["price"],
        duration: json["duration"],
        slot: json["slot"],
        slotBooked: json["slot_booked"].toDouble(),
        picture: json["picture"],
        trainerId: json["trainer_id"],
        trainerName: json["trainer_name"],
        location: json["location"],
        description: json["description"],
        accessClass: json["access_class"],
        offlineClassCategory: (json["offline_class_category"] != null)
            ? OfflineClassCategory.fromJson(json["offline_class_category"])
            : null,
        trainerModel: (json["trainer"] != null)
            ? TrainerModel.fromJson(json["trainer"])
            : null,
      );
}

class OfflineClassCategory {
  OfflineClassCategory({
    this.id,
    this.name,
    this.description,
    this.picture,
    this.offlineClassCount,
  });

  int? id;
  String? name;
  String? description;
  String? picture;
  int? offlineClassCount;

  factory OfflineClassCategory.fromJson(Map<String, dynamic> json) =>
      OfflineClassCategory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        picture: json["picture"],
        offlineClassCount: json["offline_class_count"],
      );
}
