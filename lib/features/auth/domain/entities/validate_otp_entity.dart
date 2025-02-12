class ValidateOtpEntity {
  final String mobileNumber, countryCode, otp;

  ValidateOtpEntity(
      {required this.mobileNumber,
      required this.countryCode,
      required this.otp});

  ValidateOtpEntity copyWith({
    String? mobileNumber,
    String? countryCode,
    String? otp,
  }) {
    return ValidateOtpEntity(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      countryCode: countryCode ?? this.countryCode,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': int.parse(mobileNumber),
      'countryCode': int.parse(countryCode),
      'otp': int.parse(otp),
    };
  }
}
