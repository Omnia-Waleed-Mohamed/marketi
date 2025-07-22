class SignUpRequest {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };
}
