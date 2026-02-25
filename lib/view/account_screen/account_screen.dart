import 'package:e_cart/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("My Account"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  radius: 30,
                  child: Text(
                    "FE",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fathima Ebrahim",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("+91 908 786 4233"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Wallet Section
            Card(
              color: Colors.green.shade100,
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text(
                  "Wallet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                subtitle: Text(
                  "Balance - 125",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Menu Options
            Expanded(
              child: ListView(
                children: [
                  _buildCards(
                    name: "Edit Profile",
                    cicon: Icons.person_2_outlined,
                  ),
                  _buildCards(
                    name: "Saved Address",
                    cicon: Icons.location_on_outlined,
                  ),
                  _buildCards(
                    name: "Terms & Conditions",
                    cicon: Icons.note_alt_outlined,
                  ),
                  _buildCards(
                    name: "Privacy Policy",
                    cicon: Icons.note_alt_outlined,
                  ),
                  _buildCards(
                    name: "Refer a Friend",
                    cicon: Icons.groups_2_outlined,
                  ),
                  _buildCards(
                    name: "Customer Support",
                    cicon: Icons.call_outlined,
                  ),
                  _buildCards(
                    name: "Logout",
                    cicon: Icons.logout_outlined,
                    colorbg: Colors.redAccent,
                    colortxt: Colors.white,
                    coloricon: Colors.white,
                    onTap: () async {
                //        await ref
                // .read(authProvider.notifier)
                // .signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCards({
    required String name,
    required IconData cicon,
    Color colorbg = Colors.transparent,
    Color colortxt = const Color.fromARGB(255, 78, 76, 76),
    Color coloricon = Colors.grey,
    VoidCallback? onTap,  
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.3),
            width: 2,
          ),
          color: colorbg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(cicon, color: coloricon),
            SizedBox(width: 8),
            Text(
              name,
              style: TextStyle(
                color: colortxt,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
