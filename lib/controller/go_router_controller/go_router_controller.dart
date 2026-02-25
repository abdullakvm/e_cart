// import 'dart:async';
// import 'package:e_cart/view/Home_screen/home_screen.dart';
// import 'package:e_cart/view/Login_screen/login_screen.dart';
// import 'package:e_cart/view/Tab_bar_screen/tab_bar_screen.dart';
// import 'package:e_cart/view/account_screen/account_screen.dart';
// import 'package:e_cart/view/bookings_screen/booking_screen.dart';
// import 'package:e_cart/view/cart_screen/cart_screen.dart';
// import 'package:e_cart/view/custome_bottom_navigation/custome_bottom_navigation.dart';
// import 'package:e_cart/view/splash_screen/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// // Refresh notifier for GoRouter when auth state changes
// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }

// // Supabase client
// final supabase = Supabase.instance.client;

// // App Router
// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',

//   // Auto refresh when login/logout happens
//   refreshListenable: GoRouterRefreshStream(supabase.auth.onAuthStateChange),

//   // Auth redirect logic
//   redirect: (context, state) {
//     final session = supabase.auth.currentSession;
//     final isLoggedIn = session != null;

//     final goingToLogin = state.matchedLocation == '/login';
//     final goingToSplash = state.matchedLocation == '/splash';

//     // Stay on splash until it decides where to go
//     if (goingToSplash) return null;

//     // Not logged in → redirect to login
//     if (!isLoggedIn && !goingToLogin) return '/login';

//     // Logged in → prevent showing login again
//     if (isLoggedIn && goingToLogin) return '/';

//     return null; // no redirect
//   },

//   routes: [
//     // Splash Screen
//     GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),

//     // Login Screen
//     // GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

//     // Bottom Navigation Shell
//     ShellRoute(
//       builder: (context, state, child) => CustomBottomNav(child: child),
//       routes: [
//         GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
//         GoRoute(
//           path: '/bookings',
//           builder: (context, state) => const BookingScreen(),
//         ),
//         GoRoute(
//           path: '/account',
//           builder: (context, state) => const AccountScreen(),
//         ),
//       ],
//     ),

//     //  Cart Screen (outside bottom nav)
//     GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),

//     // Service Screen
//     GoRoute(
//       path: '/service',
//       builder: (context, state) => const TabbarScreen(),
//     ),
//   ],
// );

// ============================================
import 'package:e_cart/view/Home_screen/home_screen.dart';
import 'package:e_cart/view/Tab_bar_screen/tab_bar_screen.dart';
import 'package:e_cart/view/account_screen/account_screen.dart';
import 'package:e_cart/view/bookings_screen/booking_screen.dart';
import 'package:e_cart/view/cart_screen/cart_screen.dart';
import 'package:e_cart/view/custome_bottom_navigation/custome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    /// 🔹 Bottom Navigation Wrapper
    ShellRoute(
      builder: (context, state, child) {
        return CustomBottomNav(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(
          path: '/bookings',
          builder: (context, state) => BookingScreen(),
        ),
        GoRoute(path: '/account', builder: (context, state) => AccountScreen()),
      ],
    ),

    /// 🔹 Cart Screen (Outside Bottom Nav)
    GoRoute(path: '/cart', builder: (context, state) => CartScreen()),

    /// 🔹 Available Service Screen (Outside Bottom Nav)
    GoRoute(path: '/service', builder: (context, state) => TabbarScreen()),
  ],
);
