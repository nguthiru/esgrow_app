class UserSearchModel {
  final String id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;

  UserSearchModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName});

  factory UserSearchModel.fromJson(Map<String, dynamic> json) {
    return UserSearchModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"]);
  }
}
