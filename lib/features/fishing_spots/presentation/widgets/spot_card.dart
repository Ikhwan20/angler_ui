import 'package:flutter/material.dart';
import 'package:angler/data/models/fishing_spot_model.dart';

class SpotCard extends StatelessWidget {
  final FishingSpotModel spot;

  const SpotCard({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image with favorite icon
        Stack(
          children: [
            Container(
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(spot.imageUrl),
                  fit: BoxFit.cover,
                  onError: (error, stackTrace) {
                    debugPrint('Image load error: $error');
                  },
                ),
              ),
            ),
            const Positioned(
              top: 20,
              right: 20,
              child: Icon(Icons.favorite_border, color: Colors.white, size: 30),
            ),
          ],
        ),

        const SizedBox(height: 15),

        // Name and Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                spot.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, size: 15),
                const SizedBox(width: 5),
                Text(
                  spot.rating.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Location
        Text(
          spot.location,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),

        // Distance
        Text(
          '${spot.distance} kilometers away',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),

        // Duration
        Text(
          spot.duration,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),

        // Price
        Row(
          children: [
            Text(
              '\$${spot.price}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Text(
              ' per trip',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
