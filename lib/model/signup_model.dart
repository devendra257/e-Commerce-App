class SignUpModel {
  String? fName;
  String? lName;
  String? email;
  String? phone;
  String? password;

  SignUpModel({
    this.fName,
    this.lName,
    this.email,
    this.phone,
    this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        fName: json["f_name"],
        lName: json["l_name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "f_name": fName,
        "l_name": lName,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
