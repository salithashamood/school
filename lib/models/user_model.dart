class UserModel {
  final String jwtToken, refreshToken;

  UserModel({required this.jwtToken, required this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(jwtToken: json['jwtToken'], refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jwtToken'] = jwtToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
