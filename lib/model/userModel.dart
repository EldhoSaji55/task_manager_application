class Usermodel {
  int? id;
  String? name;
  String? email;
  String? password;
  bool? agreedTerms;

  Usermodel({this.id, this.name, this.email, this.password, this.agreedTerms});

  factory Usermodel.fromMap(Map<String, dynamic> json) => Usermodel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        agreedTerms: json["agreedTerms"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "agreedTerms": agreedTerms,
      };
}
