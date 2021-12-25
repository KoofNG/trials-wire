class LoginDataDto {
  String email;
  String password;

  LoginDataDto({String email, String password})
      : email = email,
        password = password;

  LoginDataDto.from(Map<String, String> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, String> toJson() {
    final Map<String, String> _data = Map<String, String>();
    _data['email'] = this.email;
    _data['password'] = this.password;
    return _data;
  }
}
