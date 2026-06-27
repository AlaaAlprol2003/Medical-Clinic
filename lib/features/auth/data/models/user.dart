class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  String phone;
  String password;
  
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        
      };

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          name: json["name"],
          email: json["email"],
          password: json["password"],
          phone: json["phone"],
          
        );
}