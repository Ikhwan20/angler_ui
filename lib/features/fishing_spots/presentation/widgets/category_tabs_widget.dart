import 'package:flutter/material.dart';
import 'package:angler/core/widgets/custom_tab_item.dart';

class CategoryTabsWidget extends StatelessWidget {
  const CategoryTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: SizedBox(
        height: 55,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            SizedBox(
              height: 42,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  CustomTabItem(
                    text: 'Lakes',
                    imageUrl: 'assets/images/lakes.jpeg',
                  ),
                  SizedBox(width: 30),
                  CustomTabItem(
                    text: 'Beachfront',
                    imageUrl: 'assets/images/beachfront.jpeg',
                  ),
                  SizedBox(width: 30),
                  CustomTabItem(
                    text: 'Islands',
                    imageUrl: 'assets/images/island.png',
                  ),
                  SizedBox(width: 30),
                  CustomTabItem(
                    text: 'Deep Sea',
                    imageUrl: 'assets/images/views.jpeg',
                  ),
                  SizedBox(width: 30),
                  CustomTabItem(
                    text: 'Rivers',
                    imageUrl: 'assets/images/pool.jpeg',
                  ),
                  SizedBox(width: 30),
                  CustomTabItem(
                    text: 'Charters',
                    imageUrl: 'assets/images/villa.png',
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              child: Container(color: Colors.black, height: 3, width: 55),
            ),
          ],
        ),
      ),
    );
  }
}
