class User {
  final int id;
  final String? userName;
  final String? passWord;

  User(
      {required this.id,
       this.userName,
       this.passWord,
      });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      passWord: json['password'] ?? ''
      );
}
