import 'package:oru_mobiles/core/api/custom_http_client.dart';
import 'package:oru_mobiles/core/constants/url_constants.dart';
import 'package:oru_mobiles/core/errors/exceptions.dart';
import 'package:oru_mobiles/features/home/data/models/faq_model.dart';
import 'package:oru_mobiles/features/home/data/models/mobile_brand_model.dart';

class HomeRemoteDataSources {
  final CustomHttpClient _client = CustomHttpClient();

  Future<List<MobileBrandModel>> getBrands() async {
    try {
      final response = await _client.get(
        url: getBrandsUrl,
      );
      if (response.statusCode == 200) {
        return (response.data['dataObject'] as List)
            .map((e) => MobileBrandModel.fromJson(e))
            .toList();
      } else {
        throw ApiException(message: response.data['error'] ?? 'Sever error');
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<List<FaqModel>> getFaqs() async {
    try {
      final response = await _client.get(
        url: getFaqUrl,
      );
      if (response.statusCode == 200) {
        return (response.data['FAQs'] as List)
            .map((e) => FaqModel.fromJson(e))
            .toList();
      } else {
        throw ApiException(message: response.data['error'] ?? 'Sever error');
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
