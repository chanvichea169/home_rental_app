import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ models/property.dart';
import '../widgets/property_card.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final property = ModalRoute.of(context)!.settings.arguments as Property;
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    // Fake related properties data
    final relatedProperties = [
      Property(
        id: '1',
        title: 'Modern Apartment in ${property.location}',
        description: 'Beautiful apartment in the same neighborhood with modern amenities',
        imageUrls: [
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        ],
        address: '123 Nearby St, ${property.location}',
        location: property.location,
        latitude: property.latitude + 0.01,
        longitude: property.longitude + 0.01,
        price: property.price * 0.9,
        rating: (property.rating - 0.2).clamp(0.0, 5.0),
        reviewCount: property.reviewCount - 5,
        bedrooms: property.bedrooms,
        bathrooms: property.bathrooms,
        area: property.area,
        amenities: property.amenities,
        type: property.type,
        isFavorite: false,
        availableFrom: property.availableFrom.add(const Duration(days: 30)),
        ownerId: 'owner_123',
        tags: ['modern', 'renovated'],
      ),
      Property(
        id: '2',
        title: 'Cozy ${property.typeString} Nearby',
        description: 'Charming property just a few blocks away',
        imageUrls: [
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        ],
        address: '456 Adjacent Ave, ${property.location}',
        location: property.location,
        latitude: property.latitude - 0.01,
        longitude: property.longitude - 0.01,
        price: property.price * 1.1,
        rating: (property.rating + 0.1).clamp(0.0, 5.0),
        reviewCount: property.reviewCount + 3,
        bedrooms: property.bedrooms,
        bathrooms: property.bathrooms,
        area: property.area,
        amenities: property.amenities,
        type: property.type,
        isFavorite: false,
        availableFrom: property.availableFrom.add(const Duration(days: 15)),
        ownerId: 'owner_456',
        tags: ['cozy', 'well-maintained'],
      ),
      Property(
        id: '3',
        title: 'Luxury ${property.typeString}',
        description: 'High-end property with premium features and stunning views',
        imageUrls: [
          'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        ],
        address: '789 Premium Blvd, ${property.location}',
        location: property.location,
        latitude: property.latitude + 0.02,
        longitude: property.longitude + 0.02,
        price: property.price * 1.3,
        rating: (property.rating + 0.3).clamp(0.0, 5.0),
        reviewCount: property.reviewCount + 10,
        bedrooms: property.bedrooms + 1,
        bathrooms: property.bathrooms + 1,
        area: property.area * 1.2,
        amenities: [...property.amenities, 'Swimming pool', 'Gym'],
        type: property.type,
        isFavorite: false,
        availableFrom: property.availableFrom,
        ownerId: 'owner_789',
        tags: ['luxury', 'premium'],
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                property.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: property.isFavorite ? Colors.red : Colors.black,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Gallery with Thumbnails
            Stack(
              children: [
                // Main Image
                SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Image.network(
                    property.imageUrls[_selectedImageIndex],
                    fit: BoxFit.cover,
                  ),
                ),

                // Thumbnail Gallery
                if (property.imageUrls.length > 1)
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: property.imageUrls.length,
                        itemBuilder: (ctx, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImageIndex = index;
                            });
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _selectedImageIndex == index
                                    ? theme.primaryColor
                                    : Colors.white,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(property.imageUrls[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Photo Count
                Positioned(
                  bottom: property.imageUrls.length > 1 ? 104 : 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${property.imageUrls.length} photos',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price and Basic Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.formattedPrice,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          property.typeString.toUpperCase(),
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Address
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: theme.primaryColor),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          property.address,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(property.ratingStars),
                      const Spacer(),
                      Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Available from ${DateFormat('MMM d, y').format(property.availableFrom)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Features
                  Text('Features', style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildFeatureItem(Icons.king_bed, '${property.bedrooms} Beds', theme.primaryColor),
                      _buildFeatureItem(Icons.bathtub, '${property.bathrooms} Baths', theme.primaryColor),
                      _buildFeatureItem(Icons.zoom_out_map, '${property.area} sqft', theme.primaryColor),
                      _buildFeatureItem(_getTypeIcon(property.type), property.typeString, theme.primaryColor),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Description
                  Text('Description', style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
                  const SizedBox(height: 8),
                  Text(
                    property.description.isNotEmpty
                        ? property.description
                        : 'Beautiful ${property.typeString} located in ${property.location}. This property offers modern amenities and comfortable living spaces.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Amenities
                  // Amenities Section with improved colors
                  Text('Amenities', style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor, // Using theme color for consistency
                    fontWeight: FontWeight.bold,
                    fontSize: 18, // Slightly larger
                  )),
                  const SizedBox(height: 12),
                  if (property.amenities.isNotEmpty)
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: property.amenities.map((amenity) => Chip(
                        label: Text(amenity),
                        backgroundColor: theme.primaryColor.withOpacity(0.1), // Subtle primary color tint
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: theme.primaryColor.withOpacity(0.3)), // Border with primary color
                        ),
                        labelStyle: TextStyle(
                          color: theme.primaryColor, // Primary color text
                          fontWeight: FontWeight.w500,
                        ),
                      )).toList(),
                    )
                  else
                    Chip(
                      label: Text('Swimming Pool'),
                      backgroundColor: theme.primaryColor.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: theme.primaryColor.withOpacity(0.3)),
                      ),
                      labelStyle: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 24),

                  Text('Similar Properties', style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 280, // Increased height to prevent overflow
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: relatedProperties.length,
                      itemBuilder: (ctx, index) => Container(
                        width: 240, // Slightly wider to accommodate content
                        margin: const EdgeInsets.only(right: 16),
                        child: PropertyCard(
                          property: relatedProperties[index],
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/details',
                              arguments: relatedProperties[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Action Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[200]!)),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.chat_bubble_outline, color: theme.primaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text('Book Now', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: Colors.grey[800])),
        ],
      ),
    );
  }

  IconData _getTypeIcon(PropertyType type) {
    switch (type) {
      case PropertyType.apartment:
        return Icons.apartment;
      case PropertyType.house:
        return Icons.house;
      case PropertyType.villa:
        return Icons.villa;
      case PropertyType.condo:
        return Icons.home_work;
      case PropertyType.townhouse:
        return Icons.home;
      default:
        return Icons.home;
    }
  }
}