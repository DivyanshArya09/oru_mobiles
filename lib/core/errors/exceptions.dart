class ServerException implements Exception {}

class CacheException implements Exception {}

class ApiException implements Exception {
  final String message;

  ApiException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class FirebaseException implements Exception {
  final String message;

  FirebaseException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class ValidationException implements Exception {
  final String message;
  ValidationException({required this.message});
}
