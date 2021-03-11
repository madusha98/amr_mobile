class BillData {
  String month;
  double value;
  int units;

  BillData(Set<Object> set, {
    this.month,
    this.value,
    this.units,
  });

  Map<String, dynamic> get toAwsJson => {
        'month': month,
        'bill_amount': value,
        'units_count': units,
      };
}
