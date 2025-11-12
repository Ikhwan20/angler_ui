class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? phone;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.phone,
    required this.createdAt,
  });

  // From JSON (API response)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profile_image'],
      phone: json['phone'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  // To JSON (API request)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_image': profileImage,
      'phone': phone,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // CopyWith for immutability
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    String? phone,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // For debugging
  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email)';
  }
}
