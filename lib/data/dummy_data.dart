import '../ models/property.dart';

final List<Property> dummyProperties = [
  Property(
    id: 'p1',
    title: 'Modern Luxury Apartment',
    description: 'Stylish and contemporary apartment in the heart of the city with stunning views and premium amenities.',
    imageUrls: [
      'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2', // Modern apartment
      'https://images.unsplash.com/photo-1493809842364-78817add7ffb', // Living room
      'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688'  // Kitchen
    ],
    address: '123 Riverside, Sangkat Tonle Bassac, Phnom Penh',
    location: 'Phnom Penh',
    latitude: 11.5564,
    longitude: 104.9282,
    price: 650.0,
    rating: 4.8,
    reviewCount: 42,
    bedrooms: 2,
    bathrooms: 2,
    area: 85.0,
    amenities: [
      'Swimming Pool',
      'Gym',
      'Parking',
      'WiFi',
      'Air Conditioning',
      'Smart TV'
    ],
    type: PropertyType.apartment,
    isFavorite: true,
    availableFrom: DateTime.now().add(Duration(days: 3)),
    ownerId: 'o1',
    tags: ['luxury', 'central', 'view'],
  ),
  Property(
    id: 'p2',
    title: 'Premium Villa with Private Pool',
    description: 'Exclusive villa with private pool, garden area and full staff service available.',
    imageUrls: [
      'https://images.unsplash.com/photo-1580587771525-78b9dba3b914', // Luxury villa
      'https://images.unsplash.com/photo-1600585154340-be6161a56a0c', // Pool area
      'https://images.unsplash.com/photo-1493809842364-78817add7ffb'  // Bedroom
    ],
    address: '456 Heritage Road, Siem Reap',
    location: 'Siem Reap',
    latitude: 13.3671,
    longitude: 103.8448,
    price: 1200.0,
    rating: 4.9,
    reviewCount: 28,
    bedrooms: 4,
    bathrooms: 3,
    area: 220.0,
    amenities: [
      'Private Pool',
      'Garden',
      'Daily Cleaning',
      'Fully Furnished',
      'Kitchen',
      'Security'
    ],
    type: PropertyType.villa,
    isFavorite: false,
    availableFrom: DateTime.now().add(Duration(days: 7)),
    ownerId: 'o2',
    tags: ['premium', 'private', 'staffed'],
  ),
  Property(
    id: 'p3',
    title: 'Cozy City Condo',
    description: 'Compact and comfortable condo perfect for urban living with great access to public transport.',
    imageUrls: [
      'https://images.unsplash.com/photo-1484154218962-a197022b5858', // City condo
      'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267', // Bathroom
      'https://images.unsplash.com/photo-1486946255434-2466348c2166'  // Balcony view
    ],
    address: '789 Central Boulevard, Phnom Penh',
    location: 'Phnom Penh',
    latitude: 11.5695,
    longitude: 104.9215,
    price: 380.0,
    rating: 4.3,
    reviewCount: 15,
    bedrooms: 1,
    bathrooms: 1,
    area: 45.0,
    amenities: [
      'WiFi',
      'Air Conditioning',
      'Elevator',
      'Security',
      'Laundry'
    ],
    type: PropertyType.condo,
    isFavorite: false,
    availableFrom: DateTime.now(),
    ownerId: 'o3',
    tags: ['affordable', 'central', 'compact'],
  ),
  Property(
    id: 'p4',
    title: 'Cozy City Condo',
    description: 'Compact and comfortable condo perfect for urban living with great access to public transport.',
    imageUrls: [
      'https://images.unsplash.com/photo-1484154218962-a197022b5858', // City condo
      'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267', // Bathroom
      'https://images.unsplash.com/photo-1486946255434-2466348c2166'  // Balcony view
    ],
    address: '789 Central Boulevard, Phnom Penh',
    location: 'Phnom Penh',
    latitude: 11.5695,
    longitude: 104.9215,
    price: 380.0,
    rating: 4.3,
    reviewCount: 15,
    bedrooms: 1,
    bathrooms: 1,
    area: 45.0,
    amenities: [
      'WiFi',
      'Air Conditioning',
      'Elevator',
      'Security',
      'Laundry'
    ],
    type: PropertyType.condo,
    isFavorite: false,
    availableFrom: DateTime.now(),
    ownerId: 'o3',
    tags: ['affordable', 'central', 'compact'],
  ),
];