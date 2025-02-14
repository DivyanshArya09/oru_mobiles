class ProductModel {
  final String id;
  final String deviceCondition;
  final String listedBy;
  final String deviceStorage;
  final List<ImageModel> images;
  final DefaultImageModel defaultImage;
  final String listingState;
  final String listingLocation;
  final String listingLocality;
  final String listingPrice;
  final String make;
  final String marketingName;
  final bool openForNegotiation;
  final bool verified;
  final String listingId;
  final String status;
  final String verifiedDate;
  final String listingDate;
  final String deviceRam;
  final String warranty;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final LocationModel location;

  ProductModel({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.defaultImage,
    required this.listingState,
    required this.listingLocation,
    required this.listingLocality,
    required this.listingPrice,
    required this.make,
    required this.marketingName,
    required this.openForNegotiation,
    required this.verified,
    required this.listingId,
    required this.status,
    required this.verifiedDate,
    required this.listingDate,
    required this.deviceRam,
    required this.warranty,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      deviceCondition: json['deviceCondition'] ?? '',
      listedBy: json['listedBy'] ?? '',
      deviceStorage: json['deviceStorage'] ?? '',
      images: (json['images'] as List?)
              ?.map((img) => ImageModel.fromJson(img))
              .toList() ??
          [],
      defaultImage: json['defaultImage'] != null
          ? DefaultImageModel.fromJson(json['defaultImage'])
          : DefaultImageModel(fullImage: '', id: ''),
      listingState: json['listingState'] ?? '',
      listingLocation: json['listingLocation'] ?? '',
      listingLocality: json['listingLocality'] ?? '',
      listingPrice: json['listingPrice'] ?? '',
      make: json['make'] ?? '',
      marketingName: json['marketingName'] ?? '',
      openForNegotiation: json['openForNegotiation'] ?? false,
      verified: json['verified'] ?? false,
      listingId: json['listingId'] ?? '',
      status: json['status'] ?? '',
      verifiedDate: json['verifiedDate'] ?? '',
      listingDate: json['listingDate'] ?? '',
      deviceRam: json['deviceRam'] ?? '',
      warranty: json['warranty'] ?? '',
      imagePath: json['imagePath'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : LocationModel(type: '', coordinates: [], id: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'deviceCondition': deviceCondition,
      'listedBy': listedBy,
      'deviceStorage': deviceStorage,
      'images': images.map((img) => img.toJson()).toList(),
      'defaultImage': defaultImage.toJson(),
      'listingState': listingState,
      'listingLocation': listingLocation,
      'listingLocality': listingLocality,
      'listingPrice': listingPrice,
      'make': make,
      'marketingName': marketingName,
      'openForNegotiation': openForNegotiation,
      'verified': verified,
      'listingId': listingId,
      'status': status,
      'verifiedDate': verifiedDate,
      'listingDate': listingDate,
      'deviceRam': deviceRam,
      'warranty': warranty,
      'imagePath': imagePath,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'location': location.toJson(),
    };
  }
}

class ImageModel {
  final String thumbImage;
  final String fullImage;
  final String isVarified;
  final String option;
  final String id;

  ImageModel({
    required this.thumbImage,
    required this.fullImage,
    required this.isVarified,
    required this.option,
    required this.id,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      thumbImage: json['thumbImage'],
      fullImage: json['fullImage'],
      isVarified: json['isVarified'],
      option: json['option'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbImage': thumbImage,
      'fullImage': fullImage,
      'isVarified': isVarified,
      'option': option,
      '_id': id,
    };
  }
}

class DefaultImageModel {
  final String fullImage;
  final String id;

  DefaultImageModel({
    required this.fullImage,
    required this.id,
  });

  factory DefaultImageModel.fromJson(Map<String, dynamic> json) {
    return DefaultImageModel(
      fullImage: json['fullImage'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullImage': fullImage,
      '_id': id,
    };
  }
}

class LocationModel {
  final String type;
  final List<double> coordinates;
  final String id;

  LocationModel({
    required this.type,
    required this.coordinates,
    required this.id,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
      '_id': id,
    };
  }
}
