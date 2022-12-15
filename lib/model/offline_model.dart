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
    this.location,
    this.description,
    this.accessClass,
    this.offlineClassCategory,
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
  String? location;
  String? description;
  bool? accessClass;
  OfflineClassCategory? offlineClassCategory;

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
        location: json["location"],
        description: json["description"],
        accessClass: json["access_class"],
        offlineClassCategory: (json["offline_class_category"] != null)
            ? OfflineClassCategory.fromJson(json["offline_class_category"])
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
