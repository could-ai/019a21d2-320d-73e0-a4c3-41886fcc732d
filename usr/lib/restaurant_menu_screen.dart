import 'package:flutter/material.dart';

class RestaurantMenuScreen extends StatefulWidget {
  final String restaurantName;

  const RestaurantMenuScreen({super.key, required this.restaurantName});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Chicken Biriyani',
      'price': 180,
      'description': 'Aromatic basmati rice cooked with tender chicken, spices, and saffron.',
      'image': 'https://via.placeholder.com/100x100?text=Chicken+Biriyani',
    },
    {
      'name': 'Mutton Biriyani',
      'price': 220,
      'description': 'Slow-cooked mutton with rice, caramelized onions, and rich spices.',
      'image': 'https://via.placeholder.com/100x100?text=Mutton+Biriyani',
    },
    {
      'name': 'Veg Biriyani',
      'price': 150,
      'description': 'Fragrant rice with mixed vegetables, nuts, and authentic spices.',
      'image': 'https://via.placeholder.com/100x100?text=Veg+Biriyani',
    },
    {
      'name': 'Fish Biriyani',
      'price': 200,
      'description': 'Fresh fish marinated in spices, cooked with basmati rice and herbs.',
      'image': 'https://via.placeholder.com/100x100?text=Fish+Biriyani',
    },
    {
      'name': 'Paneer Biriyani',
      'price': 170,
      'description': 'Cottage cheese cubes with rice, saffron, and a blend of Indian spices.',
      'image': 'https://via.placeholder.com/100x100?text=Paneer+Biriyani',
    },
    {
      'name': 'Egg Biriyani',
      'price': 140,
      'description': 'Boiled eggs cooked in spiced rice with onions, tomatoes, and coriander.',
      'image': 'https://via.placeholder.com/100x100?text=Egg+Biriyani',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurantName),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Navigate to cart
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cart feature coming soon!')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(
                    item['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['description'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '₹${item['price']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add to cart functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item['name']} added to cart!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
