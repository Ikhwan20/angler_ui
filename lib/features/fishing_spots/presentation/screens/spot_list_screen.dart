import 'package:flutter/material.dart';
import 'package:angler/features/fishing_spots/presentation/widgets/search_field_widget.dart';
import 'package:angler/features/fishing_spots/presentation/widgets/category_tabs_widget.dart';
import 'package:angler/features/fishing_spots/presentation/widgets/spot_list_widget.dart';

class SpotListScreen extends StatelessWidget {
  const SpotListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: const [SearchFieldWidget(), CategoryTabsWidget()],
              ),
            ),
            const SliverToBoxAdapter(child: SpotListWidget()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              icon: Icons.search,
              label: 'Explore',
              color: const Color(0xFF4A90E2),
              isActive: true,
            ),
            _buildNavItem(
              icon: Icons.favorite_border,
              label: 'Favorites',
              color: Colors.grey,
              isActive: false,
            ),
            _buildNavItem(
              icon: Icons.calendar_today,
              label: 'Bookings',
              color: Colors.grey,
              isActive: false,
            ),
            _buildNavItem(
              icon: Icons.chat_bubble_outline,
              label: 'Messages',
              color: Colors.grey,
              isActive: false,
            ),
            _buildNavItem(
              icon: Icons.person_outline,
              label: 'Profile',
              color: Colors.grey,
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required Color color,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
