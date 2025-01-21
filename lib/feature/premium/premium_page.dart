import 'package:flutter/material.dart';
import 'package:twoblokes/feature/podcast/podcast_detail_page.dart';
import 'package:twoblokes/feature/premium/premium_page_detail.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Premium',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
        children: podcastData
            .map((podcast) => PremiumCard(premiumInfo: podcast))
            .toList(),
      ),
    );
  }
}

class PremiumCard extends StatelessWidget {
  final PremiumInfo premiumInfo;

  const PremiumCard({
    Key? key,
    required this.premiumInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PremiumDetailPage()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Podcast Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              premiumInfo.imageUrl,
              width: double.infinity,
              height: 140,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            premiumInfo.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          // Description
          Text(
            premiumInfo.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.3,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class PremiumInfo {
  final String title;
  final String description;
  final String imageUrl;

  PremiumInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

// Dummy data
final List<PremiumInfo> podcastData = [
  PremiumInfo(
    title: 'Premium Analysis',
    description: 'Lead by Two Blokes',
    imageUrl: 'assets/premium.png',
  ),
  PremiumInfo(
    title: 'Trade Alerts',
    description: 'Lead by Two Blokes',
    imageUrl: 'assets/premium2.png',
  ),
  PremiumInfo(
    title: 'Live Trade Room',
    description: 'Lead by Two Blokes',
    imageUrl: 'assets/premium3.png',
  ),
];
