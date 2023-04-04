class NewsUser {
  final String? name;
  final String? email;
  final String? profileImage;

  NewsUser({
    this.name,
    this.email,
    this.profileImage,
  });

  factory NewsUser.fromJson(json) {
    return NewsUser(
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "profileImage": profileImage,
    };
  }
}
