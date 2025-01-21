import 'package:flutter/material.dart';
import 'package:twoblokes/feature/podcast/podcast_detail_page.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({Key? key}) : super(key: key);

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
              'Podcasts+',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Daily and weekly',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
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
            .map((podcast) => PodcastCard(podcast: podcast))
            .toList(),
      ),
    );
  }
}

class PodcastCard extends StatelessWidget {
  final PodcastInfo podcast;

  const PodcastCard({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PodcastDetailPage()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Podcast Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              podcast.imageUrl,
              width: double.infinity,
              height: 140,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            podcast.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          // Description
          Text(
            podcast.description,
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

class PodcastInfo {
  final String title;
  final String description;
  final String imageUrl;

  PodcastInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

// Dummy data
final List<PodcastInfo> podcastData = [
  PodcastInfo(
    title: 'The Intelligence',
    description:
        'Gain a fresh perspective on the events and trends shaping your world with our daily podcast.',
    imageUrl: 'assets/podcast.png',
  ),
  PodcastInfo(
    title: 'Money Talks',
    description:
        'Make sense of the biggest stories in economics, business and markets.',
    imageUrl: 'assets/podcast2.png',
  ),
  PodcastInfo(
    title: 'Checks and Balance',
    description:
        'Stay ahead on market trends and economic insights with our weekly analysis.',
    imageUrl: 'assets/podcast3.png',
  ),
  PodcastInfo(
    title: 'Drum Tower',
    description:
        'Explore the stories and insights from experienced traders and market analysts.',
    imageUrl: 'assets/podcast.png',
  ),
];
