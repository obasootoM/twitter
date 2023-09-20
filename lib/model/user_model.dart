import 'package:flutter/foundation.dart';

class Usermodel {
  final String email;
  final String name;
  final List<String> follower;
  final List<String> following;
  final String profilePics;
  final String bannerPics;
  final String uid;
  final String bio;
  final bool isTwitterBlue;
  Usermodel({
    required this.email,
    required this.name,
    required this.follower,
    required this.following,
    required this.profilePics,
    required this.bannerPics,
    required this.uid,
    required this.bio,
    required this.isTwitterBlue,
  });

  Usermodel copyWith({
    String? email,
    String? name,
    List<String>? follower,
    List<String>? following,
    String? profilePics,
    String? bannerPics,
    String? uid,
    String? bio,
    bool? isTwitterBlue,
  }) {
    return Usermodel(
      email: email ?? this.email,
      name: name ?? this.name,
      follower: follower ?? this.follower,
      following: following ?? this.following,
      profilePics: profilePics ?? this.profilePics,
      bannerPics: bannerPics ?? this.bannerPics,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'follower': follower});
    result.addAll({'following': following});
    result.addAll({'profilePics': profilePics});
    result.addAll({'bannerPics': bannerPics});
    result.addAll({'bio': bio});
    result.addAll({'isTwitterBlue': isTwitterBlue});
  
    return result;
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      follower: List<String>.from(map['follower']),
      following: List<String>.from(map['following']),
      profilePics: map['profilePics'] ?? '',
      bannerPics: map['bannerPics'] ?? '',
      uid: map['\$id'] ?? '',
      bio: map['bio'] ?? '',
      isTwitterBlue: map['isTwitterBlue'] ?? false,
    );
  }

 

  @override
  String toString() {
    return 'Usermodel(email: $email, name: $name, follower: $follower, following: $following, profilePics: $profilePics, bannerPics: $bannerPics, uid: $uid, bio: $bio, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Usermodel &&
      other.email == email &&
      other.name == name &&
      listEquals(other.follower, follower) &&
      listEquals(other.following, following) &&
      other.profilePics == profilePics &&
      other.bannerPics == bannerPics &&
      other.uid == uid &&
      other.bio == bio &&
      other.isTwitterBlue == isTwitterBlue;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      follower.hashCode ^
      following.hashCode ^
      profilePics.hashCode ^
      bannerPics.hashCode ^
      uid.hashCode ^
      bio.hashCode ^
      isTwitterBlue.hashCode;
  }
}
