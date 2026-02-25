// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../providers/auth_provider.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   bool _isLoading = false;

//   Future<void> _handleGoogleLogin() async {
//     try {
//       setState(() {
//         _isLoading = true;
//       });

//       // await ref.read(authProvider.notifier).signInWithGoogle();
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Login failed: $e")));
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final session = ref.watch(authProvider);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.shopping_cart, size: 80, color: Colors.blue),
//                 const SizedBox(height: 20),

//                 const Text(
//                   "Welcome to E-Cart",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 40),

//                 if (_isLoading)
//                   const CircularProgressIndicator()
//                 else
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton.icon(
//                       icon: const Icon(Icons.login),
//                       label: const Text(
//                         "Sign in with Google",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       onPressed: _handleGoogleLogin,
//                     ),
//                   ),

//                 const SizedBox(height: 20),

//                 if (session != null)
//                   const Text(
//                     "Redirecting...",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
