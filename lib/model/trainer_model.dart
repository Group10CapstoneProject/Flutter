class TrainerModel {
    TrainerModel({
        this.id,
        this.name,
        this.email,
        this.age,
        this.phone,
        this.gender,
        this.price,
        this.picture,
        this.trainerSkill,
    });

    int? id;
    String? name;
    String? email;
    int? age;
    String? phone;
    String? gender;
    int? price;
    String? picture;
    List<TrainerSkill>? trainerSkill;

    factory TrainerModel.fromJson(Map<String, dynamic> json) => TrainerModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        phone: json["phone"],
        gender: json["gender"],
        price: json["price"],
        picture: json["picture"],
        trainerSkill: (json["trainer_skill"] != null) 
        ? List<TrainerSkill>.from(json["trainer_skill"].map((x) => TrainerSkill.fromJson(x))) 
        : null,
    );
}

class TrainerSkill {
    TrainerSkill({
        this.skillId,
        this.skillName,
    });

    int? skillId;
    String? skillName;

    factory TrainerSkill.fromJson(Map<String, dynamic> json) => TrainerSkill(
        skillId: json["skill_id"],
        skillName: json["skill_name"],
    );
}
