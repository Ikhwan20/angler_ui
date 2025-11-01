class FishingSpotModel {
  final String id;
  final String imageUrl;
  final String name;
  final String location;
  final int distance;
  final double rating;
  final int price;
  final String duration;

  FishingSpotModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.distance,
    required this.rating,
    required this.price,
    required this.duration,
  });

  // Convert from JSON (for future API)
  factory FishingSpotModel.fromJson(Map<String, dynamic> json) {
    return FishingSpotModel(
      id: json['id'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      distance: json['distance'] ?? 0,
      rating: (json['rating'] ?? 0.0).toDouble(),
      price: json['price'] ?? 0,
      duration: json['duration'] ?? '',
    );
  }

  // Convert to JSON (for future API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'location': location,
      'distance': distance,
      'rating': rating,
      'price': price,
      'duration': duration,
    };
  }
}

// Sample fishing spots data (from your friend's destinations)
final List<FishingSpotModel> sampleFishingSpots = [
  FishingSpotModel(
    id: '1',
    imageUrl: 'assets/images/abiansemal.webp',
    name: 'Abiansemal Fishing Spot',
    location: 'Abiansemal, Indonesia',
    distance: 769,
    rating: 4.87,
    price: 365,
    duration: 'Jul 2-7',
  ),
  FishingSpotModel(
    id: '2',
    imageUrl: 'assets/images/Santorini.webp',
    name: 'Santorini Fishing Charter',
    location: 'Santorini, Greece',
    distance: 1169,
    rating: 4.49,
    price: 285,
    duration: 'April 20-25',
  ),
  FishingSpotModel(
    id: '3',
    imageUrl: 'assets/images/LakeArrowhead.webp',
    name: 'Lake Arrowhead Fishing',
    location: 'Lake Arrowhead, California, US',
    distance: 2029,
    rating: 4.57,
    price: 245,
    duration: 'Sept 2-7',
  ),
  FishingSpotModel(
    id: '4',
    imageUrl: 'assets/images/spain.webp',
    name: 'Tias Deep Sea Fishing',
    location: 'Tias, Spain',
    distance: 969,
    rating: 4.03,
    price: 199,
    duration: 'Dec 12-16',
  ),
  FishingSpotModel(
    id: '5',
    imageUrl: 'assets/images/dubai.webp',
    name: 'Dubai Marina Fishing',
    location: 'Dubai, UAE',
    distance: 3969,
    rating: 4.90,
    price: 95,
    duration: 'Nov 1-6',
  ),
  FishingSpotModel(
    id: '6',
    imageUrl: 'assets/images/beachfront.jpeg',
    name: 'Beachfront Fishing Spot',
    location: 'Malibu, California',
    distance: 1500,
    rating: 4.65,
    price: 320,
    duration: 'Aug 10-15',
  ),
  FishingSpotModel(
    id: '7',
    imageUrl: 'assets/images/island.png',
    name: 'Island Paradise Fishing',
    location: 'Bali, Indonesia',
    distance: 850,
    rating: 4.92,
    price: 280,
    duration: 'Jun 5-10',
  ),
  FishingSpotModel(
    id: '8',
    imageUrl: 'assets/images/lakes.jpeg',
    name: 'Mountain Lakes Fishing',
    location: 'Colorado, US',
    distance: 1800,
    rating: 4.71,
    price: 210,
    duration: 'May 15-20',
  ),
];
