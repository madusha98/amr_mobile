class ElectricityAccount {
  String userId;
  String accId;
  String accNo;
  String outstanding;
  String location;

  ElectricityAccount(
      {this.accId, this.accNo, this.location, this.userId, this.outstanding});

  Map<String, String> get toAwsJson => {
        'userId': userId,
        'accId': accId,
        'accNo': accNo,
        'outstanding': outstanding,
        'location': location
      };
}
