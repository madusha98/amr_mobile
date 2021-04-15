class ElectricityAccount {
  String userId;
  String accId;
  String accNo;
  String outstanding;
  String location;
  String lastReading;
  int lastReadDate;
  int date;
  String accName;

  ElectricityAccount({
    this.accId,
    this.accNo,
    this.location,
    this.userId,
    this.outstanding,
    this.lastReadDate,
    this.date,
    this.lastReading,
    this.accName,
  });

  Map<String, String> get toAwsJson => {
        'userId': userId,
        'accNo': accNo,
        'location': location,
        'accName': accName,
        'lastReading': lastReading,
        'lastReadDate': lastReadDate.toString(),
        'outstanding': outstanding
      };

  factory ElectricityAccount.fromJson(dynamic json) => ElectricityAccount(
      accId: json['accId'],
      accNo: json['accNo'],
      userId: json['userId'],
      outstanding: json['outstanding'],
      location: json['location'],
      lastReadDate: json['lastReadDate'].toInt(),
      lastReading: json['lastReading'],
      date: json['date'].toInt(),
      accName: json['accName']);
}
