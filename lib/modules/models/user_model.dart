import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, required this.photoURL});

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  String toJSON() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> pMap) {
    return UserModel(name: pMap['name'], photoURL: pMap['photoURL']);
  }

  factory UserModel.fromJson(String pJSON) =>
      UserModel.fromMap(jsonDecode(pJSON));
}
