import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';

class BenefitsPage extends StatelessWidget {
  const BenefitsPage({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title':
          'The Future of AI: How Artificial Intelligence Will Change the World',
      'image': 'assets/images/Ai.jpeg',
    },
    {
      'title': 'Principles of Healthy Eating: Fruits and Vegetables',
      'image': 'assets/images/healthyfood.jpeg',
    },
    {
      'title': 'Workout Routines for Men: The Ultimate Guide',
      'image': 'assets/images/gym.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Benefits'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsApp.width * 0.09,
            vertical: DimensionsApp.height * 0.05,
          ),
          child: Column(
            spacing: 60,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Buttons
              Row(
                spacing: 2,
                children: [
                  _buildFilterButton("Deals", selected: true),

                  _buildFilterButton("Phone directory"),

                  _buildFilterButton("useful links"),
                ],
              ),

              // Articles List
              Expanded(
                child: ListView.separated(
                  itemCount: articles.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Row(
                      spacing: 20,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            article['image']!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            article['title']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable button
  Widget _buildFilterButton(String label, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.blue[100] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
