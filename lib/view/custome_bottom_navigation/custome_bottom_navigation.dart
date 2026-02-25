import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNav extends StatelessWidget {
  final Widget child;

  const CustomBottomNav({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int selectedIndex = 0;

    if (location == '/bookings') {
      selectedIndex = 1;
    } else if (location == '/account') {
      selectedIndex = 2;
    }

    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: child, 
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 15, spreadRadius: 2),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(
                context,
                icon: Icons.home_rounded,
                label: "Home",
                index: 0,
                selectedIndex: selectedIndex,
                route: '/',
              ),
              _navItem(
                context,
                icon: Icons.calendar_today_rounded,
                label: "Bookings",
                index: 1,
                selectedIndex: selectedIndex,
                route: '/bookings',
              ),
              _navItem(
                context,
                icon: Icons.person_rounded,
                label: "Account",
                index: 2,
                selectedIndex: selectedIndex,
                route: '/account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int selectedIndex,
    required String route,
  }) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.go(route); 
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.green.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.green : Colors.grey,
              ),
              if (isSelected) ...[
                const SizedBox(width: 3),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}