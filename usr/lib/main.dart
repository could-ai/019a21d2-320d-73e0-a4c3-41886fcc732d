import 'package:flutter/material.dart';

import 'restaurant_menu_screen.dart';

void main() {
  runApp(const BiriyaniMasterApp());
}

class BiriyaniMasterApp extends StatelessWidget {
  const BiriyaniMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biriyani Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'Chicken Biriyani',
    'Mutton Biriyani',
    'Veg Biriyani',
    'Fish Biriyani',
  ];

  final List<Map<String, String>> restaurants = [
    {
      'name': 'Spice Biriyani House',
      'rating': '4.5',
      'deliveryTime': '25-30 mins',
      'image': 'https://via.placeholder.com/150x100?text=Biriyani',
    },
    {
      'name': 'Royal Dum Biriyani',
      'rating': '4.7',
      'deliveryTime': '20-25 mins',
      'image': 'https://via.placeholder.com/150x100?text=Dum+Biriyani',
    },
    {
      'name': 'Tasty Biriyani Corner',
      'rating': '4.3',
      'deliveryTime': '30-35 mins',
      'image': 'https://via.placeholder.com/150x100?text=Corner+Biriyani',
    },
    {
      'name': 'Hyderabadi Biriyani Palace',
      'rating': '4.6',
      'deliveryTime': '25-30 mins',
      'image': 'https://via.placeholder.com/150x100?text=Hyderabadi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biriyani Master'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What biriyani are you craving?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Featured Biriyani Restaurants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: Image.network(
                        restaurant['image']!,
                        width: 80,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(restaurant['name']!),
                      subtitle: Text(
                        '⭐ ${restaurant['rating']} • ${restaurant['deliveryTime']}',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantMenuScreen(
                              restaurantName: restaurant['name']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
