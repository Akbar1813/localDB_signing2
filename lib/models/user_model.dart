class User{
  String? email;
  String? password;
  User({this.email,this.password});
  User.fromJson(Map<String, dynamic> json)
  : email = json['username'],
    password = json['password'];

  Map<String, dynamic> toJson() => {
    'username' : email,
    'password' : password
  };

}