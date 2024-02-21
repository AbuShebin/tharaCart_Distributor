class Address{
  final String city;
  final String district;
  final String state;
  final int pinCode;

  Address({
    required this.city,
    required this.state,
    required this.pinCode,
    required this.district
  });


  Address copyWith({
    String? city,
    String? state,
    String? district,
    int? pinCode,
  }) {
    return Address(
        city: city ??this.city,
        state: state??this.state,
        pinCode: pinCode??this.pinCode,
        district: district??this.district);
  }


  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'district': district,
    };
  }

  factory Address.fromMap(dynamic map) {
    return Address(
      city:map['city'] as String,
      state:map['state'] as String,
      pinCode: map['pinCode']??0,
      district:map['district'] as String,
);
}

}
