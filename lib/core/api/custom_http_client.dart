import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oru_mobiles/core/errors/exceptions.dart';

enum MutipartRequestMethodType {
  post,
  put,
}

class CustomHttpClient {
  final Dio _dio = Dio();
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          final errorMessage =
              e.response!.data['message'] ?? 'An error occurred';
          throw ApiException(message: errorMessage);
        }
      }
      throw ApiException(message: e.toString());
    }
  }

  Future<Response> post({
    required String url,
    Map<String, String>? headers,
    dynamic bodyData,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(bodyData ?? {}),
        options: Options(),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          final errorMessage =
              e.response!.data['message'] ?? 'An error occurred';
          throw ApiException(message: errorMessage);
        }
      }
      throw ApiException(message: e.toString());
    }
  }

  Future<Response> put({
    required String url,
    Map<String, String>? headers,
    required dynamic bodyData,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: jsonEncode(bodyData),
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          final errorMessage =
              e.response!.data['message'] ?? 'An error occurred';
          throw ApiException(message: errorMessage);
        }
      }
      throw ApiException(message: e.toString());
    }
  }

  Future<Response> patch({
    required String url,
    Map<String, String>? headers,
    dynamic bodyData,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: jsonEncode(bodyData),
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          final errorMessage =
              e.response!.data['message'] ?? 'An error occurred';
          throw ApiException(message: errorMessage);
        }
      }
      throw ApiException(message: e.toString());
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, String>? headers,
    dynamic bodyData,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: jsonEncode(bodyData),
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          final errorMessage =
              e.response!.data['message'] ?? 'An error occurred';
          throw ApiException(message: errorMessage);
        }
      }
      throw ApiException(message: e.toString());
    }
  }

  Future<Response> createMultipartRequest({
    required FormData formData,
    required String url,
    MutipartRequestMethodType method = MutipartRequestMethodType.post,
  }) async {
    try {
      if (method == MutipartRequestMethodType.post) {
        final response = await _dio.post(
          url,
          data: formData,
          options: Options(headers: {}),
        );

        return response;
      } else {
        final response = await _dio.put(
          url,
          data: formData,
          options: Options(headers: {}),
        );

        return response;
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          final errorMessage =
              e.response!.data['message'] ?? 'An error occurred';
          throw ApiException(message: errorMessage);
        }
      }
      throw ApiException(message: e.toString());
    }
  }
}
