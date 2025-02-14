import 'package:oru_mobiles/core/api/custom_http_client.dart';
import 'package:oru_mobiles/core/constants/url_constants.dart';
import 'package:oru_mobiles/core/errors/exceptions.dart';
import 'package:oru_mobiles/features/auth/data/models/user_model.dart';
import 'package:oru_mobiles/features/auth/domain/entities/generate_otp_entity.dart';
import 'package:oru_mobiles/features/auth/domain/entities/validate_otp_entity.dart';

class AuthRemoteDataSources {
  final _client = CustomHttpClient();

  Future<String> genrateOTP({required GenerateOtpEntity entity}) async {
    try {
      final response = await _client.post(
        url: createOtpUrl,
        bodyData: entity.toMap(),
      );
      if (response.statusCode == 200) {
        return response.data['reason'] ?? '';
      } else {
        throw ApiException(message: response.data['error'] ?? 'Sever error');
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<UserModel> validateOtp({required ValidateOtpEntity entity}) async {
    try {
      final response = await _client.post(
        url: validateOtpUrl,
        bodyData: entity.toMap(),
      );
      if (response.statusCode == 200) {
        try {
          return UserModel.fromJson(response.data['user']);
        } catch (e) {
          throw ApiException(message: e.toString());
        }
      } else {
        throw ApiException(message: response.data['error'] ?? 'Sever error');
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
