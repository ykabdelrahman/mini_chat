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

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['uid'] ?? '',
      username: data['username'] ?? 'Unknown',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      avatarUrl: data['avatarUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
    };
  }
}
