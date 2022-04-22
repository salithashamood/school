class UserModel {
  final String jwtToken, refreshToken;

  UserModel({required this.jwtToken, required this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(jwtToken: json['jwtToken'], refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwtToken'] = this.jwtToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
