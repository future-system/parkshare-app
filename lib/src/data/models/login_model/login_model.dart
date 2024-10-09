class LoginModel{

  LoginModel({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toMap(){
    return {'login' : email,'password': password};
  }

}