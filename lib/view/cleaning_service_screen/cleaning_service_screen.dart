import 'package:flutter/material.dart';

class CleaningserviceScreen extends StatelessWidget {
  const CleaningserviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      /// Bottom Cart Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "2 items  |  ₹3355",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "VIEW CART",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _serviceCard();
        },
      ),
    );
  }

  Widget _serviceCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          /// Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.orange),
                    SizedBox(width: 4),
                    Text("(4.2/5) 23 Orders", style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Bathroom Cleaning",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "60 Minutes",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 6),
                Text("₹ 499.00", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),

          /// Quantity Selector Only
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Text("-", style: TextStyle(fontSize: 16)),
                SizedBox(width: 10),
                Text("1"),
                SizedBox(width: 10),
                Text("+", style: TextStyle(fontSize: 16, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
