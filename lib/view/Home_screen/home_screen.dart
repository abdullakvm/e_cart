import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_cart/app_utils/app_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              _buildLocationHeader(), // location
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
                itemCount: AppUtils.myImages.length,
                itemBuilder: (context, index, _) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppUtils.myImages[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for a service",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              _buildavailableservice(),
              _buildcleaningservice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildcleaningservice() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cleaning Services",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.green),
                ],
              ),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(AppUtils.cleaningServices.length, (
                index,
              ) {
                final item = AppUtils.cleaningServices[index];

                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(item["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["title"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildavailableservice() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Available Services",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ServiceItem(icon: Icons.cleaning_services, title: "Cleaning"),
              ServiceItem(icon: Icons.delete, title: "Waste Disposal"),
              ServiceItem(icon: Icons.plumbing, title: "Plumbing"),
              ServiceItem(icon: Icons.plumbing, title: "Plumbing"),
            ],
          ),

          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ServiceItem(icon: Icons.cleaning_services, title: "Cleaning"),
              ServiceItem(icon: Icons.delete, title: "Waste Disposal"),
              ServiceItem(icon: Icons.plumbing, title: "Plumbing"),
              SeeAllItem(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, color: Colors.green, size: 25),

            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                ),

                Row(
                  children: [
                    Text(
                      "Perinthalmanna",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 26,
                color: Colors.green,
              ),
            ),

            Positioned(
              right: 6,
              top: 6,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//set of icons and names
class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ServiceItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEDED),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green, size: 30),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}

// see all button for Available Service
class SeeAllItem extends StatelessWidget {
  const SeeAllItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: InkWell(
            onTap: () {},
            child: const Icon(Icons.arrow_forward, color: Colors.green),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "See All",
          style: TextStyle(fontSize: 13, color: Colors.green),
        ),
      ],
    );
  }
}
