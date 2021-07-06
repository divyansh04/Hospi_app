import 'dart:convert';

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));

String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  Staff({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.phone,
    this.address,
    this.category,
  });

  String id;
  String name;
  String gender;
  int age;
  int phone;
  String address;
  String category;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        phone: json["phone number"],
        address: json["address"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "age": age,
        "phone number": phone,
        "address": address,
        "category": category,
      };
}
