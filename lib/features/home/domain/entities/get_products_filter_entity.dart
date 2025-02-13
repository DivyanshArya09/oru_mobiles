import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';
import 'package:oru_mobiles/features/home/utils/enums.dart';

class GetProductsFilterEntity {
  final List<FilterEntity> filters;
  final SortingType? sortingType;
  GetProductsFilterEntity({required this.filters, this.sortingType});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> filtersMap = {};
    for (var filter in filters) {
      filtersMap[filter.label] = filter.options
          .where((option) => option.isSelected!)
          .map((option) => option.label)
          .toList();
    }

    if (sortingType != null) {
      filtersMap['sort'] = sortingType!.toJson;
    }

    return {
      'filter': filtersMap,
    };
  }

  factory GetProductsFilterEntity.toDefault() {
    return GetProductsFilterEntity(filters: []);
  }
}





// class GetProductsFilterEntity {
//   final List<String> condition;
//   final List<String> make;
//   final List<String> storage;
//   final List<String> ram;
//   final List<String> warranty;
//   final List<String> priceRange;
//   final bool verified;
//   final Map<String, int>? sort;
//   final int page;

//   GetProductsFilterEntity({
//     required this.condition,
//     required this.make,
//     required this.storage,
//     required this.ram,
//     required this.warranty,
//     required this.priceRange,
//     required this.verified,
//     this.sort,
//     required this.page,
//   });

//   GetProductsFilterEntity copyWith({
//     List<String>? condition,
//     List<String>? make,
//     List<String>? storage,
//     List<String>? ram,
//     List<String>? warranty,
//     List<String>? priceRange,
//     bool? verified,
//     Map<String, int>? sort,
//     int? page,
//   }) {
//     return GetProductsFilterEntity(
//       condition: condition ?? this.condition,
//       make: make ?? this.make,
//       storage: storage ?? this.storage,
//       ram: ram ?? this.ram,
//       warranty: warranty ?? this.warranty,
//       priceRange: priceRange ?? this.priceRange,
//       verified: verified ?? this.verified,
//       sort: sort ?? this.sort,
//       page: page ?? this.page,
//     );
//   }

//   factory GetProductsFilterEntity.toDefault() {
//     return GetProductsFilterEntity(
//       condition: [],
//       make: [],
//       storage: [],
//       ram: [],
//       warranty: [],
//       priceRange: [],
//       verified: false,
//       sort: null,
//       page: 1,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'filter': {
//         'condition': condition,
//         'make': make,
//         'storage': storage,
//         'ram': ram,
//         'warranty': warranty,
//         'priceRange': priceRange,
//         'verified': verified,
//         if (sort != null) 'sort': sort,
//         'page': page,
//       }
//     };
//   }
// }
