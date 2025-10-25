// create nav bar properly later

import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  SearchfField(),
                  Tabs(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Destinations(),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -2),
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
                color: Colors.red,
                isActive: true,
              ),
              _buildNavItem(
                icon: Icons.favorite_border,
                label: 'Wishlists',
                color: Colors.grey,
                isActive: false,
              ),
              _buildNavItem(
                imagePath: 'assets/images/airbnb.png',
                label: 'Trips',
                color: Colors.grey,
                isActive: false,
              ),
              _buildNavItem(
                imagePath: 'assets/images/chat.png',
                label: 'Inbox',
                color: Colors.grey,
                isActive: false,
              ),
              _buildNavItem(
                imagePath: 'assets/images/user-2.png',
                label: 'Profile',
                color: Colors.grey,
                isActive: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    IconData? icon,
    String? imagePath,
    required String label,
    required Color color,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: color,
              size: 22,
            )
          else if (imagePath != null)
            Image.asset(
              imagePath,
              height: 22,
              width: 22,
              color: color,
            ),
          const SizedBox(height: 3),
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