import 'package:thirty_days/models/image.dart';

class User {
  int? userId;
  String username;
  String firstname;
  String lastname;
  DateTime? dateOfBirth; // Marked as nullable to handle login case
  String email;
  String phone;
  String campusName;
  String? password;
  String? bio;
  Image? profilePicture;
  Image? bannerPicture;
  // List<User>? following;
  // List<User>? followers;
  String? verificationCode;

  // Main constructor
  User({
    this.userId,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.dateOfBirth,
    required this.email,
    required this.phone,
    required this.campusName,
    this.password,
    this.bio,
    this.profilePicture,
    this.bannerPicture,
    // this.following,
    // this.followers,
    this.verificationCode,
  });

  // Named constructor for login and registration
  User.registerOrLogin({
    required this.username,
    required this.firstname,
    required this.lastname,
    this.dateOfBirth, // Nullable for login cases
    required this.email,
    required this.phone,
    required this.campusName,
    required this.password,
  });

  // From JSON
  factory User.fromJson(Map<String, dynamic> json) {
    // Ensure we parse the nested 'user' object
    final userData = json['user'];

    return User(
      userId: userData['userId'],
      username: userData['username'],
      firstname: userData['firstname'],
      lastname: userData['lastname'],
      dateOfBirth: userData['dateOfBirth'] != null
          ? DateTime.parse(userData['dateOfBirth'])
          : null,
      email: userData['email'],
      phone: userData['phone'],
      campusName: userData['campusName'],
      bio: userData['bio'],
      profilePicture: userData['profilePicture'],
      bannerPicture: userData['bannerPicture'],

      //TODO: authorities field is in the form of a list of maps, might want to handle it later Kassim!!!

      // following: (userData['following'] as List<dynamic>?)
      //     ?.map((e) => User.fromJson(e))
      //     .toList(),
      // followers: (userData['followers'] as List<dynamic>?)
      //     ?.map((e) => User.fromJson(e))
      //     .toList(),
      verificationCode: userData['verificationCode'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'email': email,
      'phone': phone,
      'campusName': campusName,
      'password': password, // Normally, you'd exclude password here
      'bio': bio,
      'profilePicture': profilePicture,
      'bannerPicture': bannerPicture,
      // 'following': following?.map((e) => e.toJson()).toList(),
      // 'followers': followers?.map((e) => e.toJson()).toList(),
      'verificationCode': verificationCode,
    };
  }
}
