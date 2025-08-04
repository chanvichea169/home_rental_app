class Property {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final String address;
  final String location;
  final double latitude;
  final double longitude;
  final double price;
  final double rating;
  final int reviewCount;
  final int bedrooms;
  final int bathrooms;
  final double area; // in square feet/meters
  final List<String> amenities;
  final PropertyType type;
  final bool isFavorite;
  final DateTime availableFrom;
  final String ownerId;
  final List<String> tags;

  Property({
    required this.id,
    required this.title,
    this.description = '',
    required this.imageUrls,
    required this.address,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.price,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    this.amenities = const [],
    required this.type,
    this.isFavorite = false,
    required this.availableFrom,
    required this.ownerId,
    this.tags = const [],
  });

  // Helper method to get the first image (for thumbnails)
  String get mainImageUrl => imageUrls.isNotEmpty ? imageUrls.first : '';

  // Price formatted with currency
  String get formattedPrice => '\$${price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 2)}/mo';

  // Short address (first line)
  String get shortAddress => address.split(',').first;

  // Rating as stars (for UI)
  String get ratingStars => '⭐ ${rating.toStringAsFixed(1)} ($reviewCount)';

  // Property type as string
  String get typeString => type.toString().split('.').last;

  get yearBuilt => null;

  // Copy with method for immutability
  Property copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? imageUrls,
    String? address,
    String? location,
    double? latitude,
    double? longitude,
    double? price,
    double? rating,
    int? reviewCount,
    int? bedrooms,
    int? bathrooms,
    double? area,
    List<String>? amenities,
    PropertyType? type,
    bool? isFavorite,
    DateTime? availableFrom,
    String? ownerId,
    List<String>? tags,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      address: address ?? this.address,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      area: area ?? this.area,
      amenities: amenities ?? this.amenities,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite,
      availableFrom: availableFrom ?? this.availableFrom,
      ownerId: ownerId ?? this.ownerId,
      tags: tags ?? this.tags,
    );
  }
}

enum PropertyType {
  apartment,
  house,
  villa,
  condo,
  townhouse,
  loft,
  studio,
  other,
}
