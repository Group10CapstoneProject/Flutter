class OfflineModel {
    OfflineModel({
        this.data,
        this.message,
    });

    Data? data;
    String? message;

    factory OfflineModel.fromJson(Map<String, dynamic> json) => OfflineModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        this.offlineClasses,
        this.count,
    });

    List<OfflineClass>? offlineClasses;
    int? count;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offlineClasses: List<OfflineClass>.from(json["offline_classes"].map((x) => OfflineClass.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "offline_classes": List<dynamic>.from(offlineClasses!.map((x) => x.toJson())),
        "count": count,
    };
}

class OfflineClass {
    OfflineClass({
        this.id,
        this.title,
        required this.time,
        this.price,
        this.duration,
        this.slot,
        this.slotBooked,
        this.picture,
        this.offlineClassCategoryId,
    });

    int? id;
    String? title;
    DateTime time;
    int? price;
    int? duration;
    int? slot;
    double? slotBooked;
    String? picture;
    int? offlineClassCategoryId;

    factory OfflineClass.fromJson(Map<String, dynamic> json) => OfflineClass(
        id: json["id"],
        title: json["title"],
        time: DateTime.parse(json["time"]),
        price: json["price"],
        duration: json["duration"],
        slot: json["slot"],
        slotBooked: json["slot_booked"].toDouble(),
        picture: json["picture"],
        offlineClassCategoryId: json["offline_class_category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "time": time.toIso8601String(),
        "price": price,
        "duration": duration,
        "slot": slot,
        "slot_booked": slotBooked,
        "picture": picture,
        "offline_class_category_id": offlineClassCategoryId,
    };
}
