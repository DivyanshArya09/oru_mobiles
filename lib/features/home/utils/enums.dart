enum SortingType {
  priceHighToLow,
  priceLowToHigh,
  latest,
  distance,
}

extension SortingTypeExtension on SortingType {
  String get label {
    switch (this) {
      case SortingType.priceHighToLow:
        return 'Price: High to Low';
      case SortingType.priceLowToHigh:
        return 'Price: Low to High';
      case SortingType.latest:
        return 'Latest';
      case SortingType.distance:
        return 'Distance';
    }
  }

  Map<String, int>? get toJson {
    switch (this) {
      case SortingType.priceHighToLow:
        return {"price": -1};
      case SortingType.priceLowToHigh:
        return {"price": 1};
      case SortingType.latest:
        return {"date": -1};
      case SortingType.distance:
        return {"distance": 1};
    }
  }
}

extension StringExtension on String {
  SortingType get toSortingType {
    switch (this) {
      case 'Price: High to Low':
        return SortingType.priceHighToLow;
      case 'Price: Low to High':
        return SortingType.priceLowToHigh;
      case 'Latest':
        return SortingType.latest;
      case 'Distance':
        return SortingType.distance;
      default:
        return SortingType.latest;
    }
  }
}
