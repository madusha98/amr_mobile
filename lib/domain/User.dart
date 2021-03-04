class User {
  String name;
  String email;
  String password;
  String phone;
  String nic;

  User({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.nic,
  });

  Map<String, dynamic> get toAwsJson => {
        'name': name,
        'phone_number': phone,
        'email': email,
        'custom:nic': nic,
      };
}
