class AccountDetails {
  final String authToken;
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final double balance;

  AccountDetails(
      {required this.username,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.authToken,
      required this.email,
      required this.balance});

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(
        username: json["username"],
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        authToken: json["id"],
        balance: json["balance"],
        email: json["email"]);
  }
}
