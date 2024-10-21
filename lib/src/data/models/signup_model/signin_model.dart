class SignupModel{

  SignupModel({required this.nickname, required this.email, required this.password});

  final String nickname;
  final String email;
  final String password;

  Map<String, dynamic> toMap(){
    return {'nickname': nickname, 'email' : email,'password': password};
  }

}