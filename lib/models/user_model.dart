class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String email;
  final String phone;
  final String gender;
  final HairModel hair;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.phone,
    required this.gender,
    required this.hair,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      hair: HairModel.fromJson(json['hair']),
    );
  }
}

class HairModel {
  final String color;
  final String type;

  HairModel({required this.color, required this.type});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(color: json['color'], type: json['type']);
  }
}
