import 'package:flutter/material.dart';

class PodcastDetailPage extends StatelessWidget {
  const PodcastDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Podcast player',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.black,
              child: Center(
                child: Image.asset(
                  'assets/podcast.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Finance and economics',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'The mystery of gold prices',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Progress bar
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      activeTrackColor: Colors.blue[700],
                      inactiveTrackColor: Colors.grey[300],
                      thumbColor: Colors.blue[700],
                    ),
                    child: Slider(
                      value: 0.1,
                      onChanged: (_) {},
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0:47',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '5:15',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Player controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.skip_previous, color: Colors.grey[700]),
                      Icon(Icons.replay_10, color: Colors.grey[700]),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.forward_30, color: Colors.grey[700]),
                      Icon(Icons.skip_next, color: Colors.grey[700]),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Playback speed
                  Center(
                    child: Text(
                      '1x speed',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                      "In this episode Ken and Rory breakdown when a trader should look at placing a trade in the market. The important factors to consider and their own respective processes,Download the two blokes trading app for market breakdowns, analysis, trade ideas, education and more. Speak to the blokes as well as other community members. Get involved today!  www.twoblokestrading.com"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
