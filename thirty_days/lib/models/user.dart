class User {
  int? userId;
  String username;
  String firstname;
  String lastname;
  DateTime? dateOfBirth; // Marked as nullable to handle login case
  String email;
  int phone;
  String campusName;
  String password;
  String? bio;
  String? profilePicture;
  String? bannerPicture;
  List<User>? following;
  List<User>? followers;
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
    required this.password,
    this.bio,
    this.profilePicture,
    this.bannerPicture,
    this.following,
    this.followers,
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
    return User(
      userId: json['userId'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      email: json['email'],
      phone: json['phone'],
      campusName: json['campusName'],
      password: json['password'], // Normally, you'd exclude password here
      bio: json['bio'],
      profilePicture: json['profilePicture'],
      bannerPicture: json['bannerPicture'],
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e))
          .toList(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e))
          .toList(),
      verificationCode: json['verificationCode'],
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
      'following': following?.map((e) => e.toJson()).toList(),
      'followers': followers?.map((e) => e.toJson()).toList(),
      'verificationCode': verificationCode,
    };
  }
}
