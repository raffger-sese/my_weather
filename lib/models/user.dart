class User {
  final String token;
  final String username;
  final String fullName;
  final String profileLink;
  final String profilePic;

  User(
      {this.token,
      this.username,
      this.fullName,
      this.profileLink,
      this.profilePic});

  factory User.fromGithubJson(Map<String, dynamic> json) {
    return User(
        username: json['nickname'],
        fullName: json['name'],
        profilePic: json['picture']);
  }

  Map<String, dynamic> toJson() => {
        'username': username ?? '',
        'fullName': fullName ?? '',
        'profilePic': profilePic ?? '',
      };
}
