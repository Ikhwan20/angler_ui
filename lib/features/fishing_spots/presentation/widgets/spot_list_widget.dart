import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:angler/data/models/fishing_spot_model.dart';
import 'package:angler/features/fishing_spots/presentation/widgets/spot_card.dart';

class SpotListWidget extends StatelessWidget {
  const SpotListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20),
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      shrinkWrap: true,
      itemCount: sampleFishingSpots.length,
      itemBuilder: (context, index) {
        final spot = sampleFishingSpots[index];
        return GestureDetector(
          onTap: () {
            // ✅ Navigate to detail screen with spot ID
            debugPrint('🎣 Navigating to spot detail: ${spot.id}');
            context.push('/fishing-spots/${spot.id}');
          },
          child: SpotCard(spot: spot),
        );
      },
    );
  }
}
