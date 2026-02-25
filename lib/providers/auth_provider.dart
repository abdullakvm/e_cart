// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// // Supabase Client Provider
// final supabaseClientProvider = Provider<SupabaseClient>(
//   (ref) => Supabase.instance.client,
// );

// // Auth State Provider
// final authProvider = StateNotifierProvider<AuthNotifier, Session?>(
//   (ref) => AuthNotifier(ref),
// );

// class AuthNotifier extends StateNotifier<Session?> {
//   final Ref ref;
//   late final StreamSubscription<AuthState> _authSubscription;

//   AuthNotifier(this.ref) : super(Supabase.instance.client.auth.currentSession) {
//     // Listen to auth changes
//     _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
//       data,
//     ) {
//       final session = data.session;
//       state = session; // update state automatically
//     });
//   }

//   SupabaseClient get _client => ref.read(supabaseClientProvider);

//   // Google Login
//   Future<void> signInWithGoogle() async {
//     await _client.auth.signInWithOAuth(
//       OAuthProvider.google,
//       redirectTo: kIsWeb
//           ? null
//           : 'io.supabase.flutter://login-callback',
//     );
//   }
  

//   // Logout
//   Future<void> signOut() async {
//     await _client.auth.signOut();
//     // state will auto update via listener
//   }

//   //Check logged in
//   bool get isLoggedIn => state != null;

//   @override
//   void dispose() {
//     _authSubscription.cancel();
//     super.dispose();
//   }
// }
