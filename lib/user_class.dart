class User {
  final String id;
  final String firstName;
  final String lastName;

  User({required this.id, required this.firstName, required this.lastName});

  void printUser() {
    String userStr = '$id $firstName $lastName';
    print(userStr);
  }
}
