import 'package:ardent_web_demo/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;

  const DashboardScreen({super.key, required this.child});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDrawerOpen = false;
  final double minDrawerWidth = 50;
  final double maxDrawerWidth = 240;
  int? hoveredIndex;


  final List<DrawerItem> drawerItems = [
    DrawerItem(icon: Icons.home_outlined, label: 'Home', route: '/'),
    DrawerItem(
      icon: Icons.star_border_rounded,
      label: 'Rankings',
      route: '/rankings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_buildDrawer(), Expanded(child: widget.child)]),
    );
  }

  Widget _buildDrawer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => isDrawerOpen = true),
        onExit: (_) => setState(() => isDrawerOpen = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isDrawerOpen ? maxDrawerWidth : minDrawerWidth,
          child: Drawer(
            elevation: 0,
            child: Container(
              color: AppColors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  Text("LOGO"),
                  _buildProfileImage(),
                  SizedBox(height: 10),
                  const Divider(height: 1, color: Colors.grey),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children:
                          drawerItems
                              .map((item) => _buildDrawerItem(item))
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ), // Optional if you only use ClipRRect
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              child: Image.network(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
                fit: BoxFit.cover, // Better for profile images
              ),
            ),
          ),

          if (isDrawerOpen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello !",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Tosha Shah",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(DrawerItem item) {
    final isSelected = GoRouterState.of(context).uri.toString() == item.route;
    final index = drawerItems.indexOf(item);
    final isHovered = hoveredIndex == index;

    final bool showGreyBackground = isHovered && !isSelected;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50,
        child: MouseRegion(
          onEnter: (_) => setState(() => hoveredIndex = index),
          onExit: (_) => setState(() => hoveredIndex = null),
          child: InkWell(
            onTap: () => context.go(item.route),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryRed
                    : showGreyBackground
                    ? AppColors.cardDark
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      item.icon,
                      color: isSelected ? Colors.white : Colors.grey,
                      size: 24,
                    ),
                  ),
                  if (isDrawerOpen)
                    Expanded(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isDrawerOpen ? 1.0 : 0.0,
                        child: Text(
                          item.label,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class DrawerItem {
  final IconData icon;
  final String label;
  final String route;

  DrawerItem({required this.icon, required this.label, required this.route});
}
