class Users {

  String name;
  String email;
  String phone;
  String aboutMeDescription;

  // Constructor
  Users({

    required this.name,
    required this.email,
    required this.phone,
    required this.aboutMeDescription,
  });

  Users copy({

    String? name,
    String? phone,
    String? email,
    String? about,
  }) =>
      Users(

        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? this.aboutMeDescription,
      );

  static Users fromJson(Map<String, dynamic> json) => Users(

        name: json['name'],
        email: json['email'],
        aboutMeDescription: json['about'],
        phone: json['phone'],
      );
  Users.fromSnapshot(snapshot)
      :

        name = snapshot.data()["name"],
        email = snapshot.data()["email"],
        phone = snapshot.data()["phone"],
        aboutMeDescription = snapshot.data()["aboutMeDescription"];
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,

        'phone': phone,
      };
}
