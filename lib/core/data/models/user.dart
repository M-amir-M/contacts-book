// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.id,
        this.email,
        this.active,
    });

    final String? id;
    final String? email;
    final bool? active;

    UserModel copyWith({
        String? id,
        String? email,
        bool? active,
    }) => 
        UserModel(
            id: id ?? this.id,
            email: email ?? this.email,
            active: active ?? this.active,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        active: json["active"] == null ? null : json["active"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "active": active == null ? null : active,
    };
}
