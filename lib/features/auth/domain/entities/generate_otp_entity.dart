class GenerateOtpEntity {
  final String mobileNumber, countryCode;

  GenerateOtpEntity({required this.mobileNumber, required this.countryCode});

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': mobileNumber,
      'countryCode': countryCode,
    };
  }
}
