import 'package:e_cart/controller/go_router_controller/go_router_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(url: 'YOUR_PROJECT_URL', anonKey: 'YOUR_ANON_KEY');
  // // if (kIsWeb) {
  //   await Supabase.instance.client.auth.getSessionFromUrl(Uri.base);
  // }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
