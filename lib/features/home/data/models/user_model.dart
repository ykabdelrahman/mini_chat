class UserModel {
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      id: data['uid'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      avatarUrl: data['avatarUrl'] ?? '',
    );
  }
}
