class User {
  final String token;
  final String username;
  final String fullName;
  final String profileLink;

  User({this.token, this.username, this.fullName, this.profileLink});

  factory User.fromJson(Map<String, String> json) {
    return User(
        token: json['token'],
        username: json['username'],
        fullName: json['firstName'] + ' ' + json['lastName'],
        profileLink: json['profileLink']);
  }

  Map<String, dynamic> toJson() => {
        'token': token ?? '',
        'username': username ?? '',
        'fullName': fullName ?? '',
        'profileLink': profileLink ?? '',
      };
}
