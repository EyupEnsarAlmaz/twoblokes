import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoblokes/feature/education/education_page.dart';
import 'package:twoblokes/feature/home/home_page.dart';
import 'package:twoblokes/feature/news/news_detail_page.dart';
import 'package:twoblokes/feature/podcast/podcast_page.dart';
import 'package:twoblokes/feature/premium/premium_page.dart';
import 'package:twoblokes/product/bloc/news/news_bloc.dart';
import 'package:twoblokes/product/bloc/news/news_state.dart';
import 'package:twoblokes/product/model/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EducationPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PodcastPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PremiumPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsBody(),
    );
  }
}

class NewsBody extends StatelessWidget {
  bool _isValidArticle(NewsModel newsItem) {
    return newsItem.title.isNotEmpty &&
        newsItem.title != '[Removed]' &&
        newsItem.description != null &&
        newsItem.description.isNotEmpty &&
        newsItem.description != '[Removed]';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsError) {
          return Center(child: Text(state.message));
        }
        if (state is NewsLoaded) {
          final validNews =
              (state.news as List<NewsModel>).where(_isValidArticle).toList();

          return ListView.builder(
            itemCount: validNews.length,
            itemBuilder: (context, index) {
              final newsItem = validNews[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(news: newsItem),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (newsItem.imageUrl.isNotEmpty)
                        Image.network(
                          newsItem.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox.shrink();
                          },
                        ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsItem.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (newsItem.description.isNotEmpty)
                              Text(newsItem.description),
                            const SizedBox(height: 8),
                            if (newsItem.source.isNotEmpty)
                              Text(
                                'Source: ${newsItem.source}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: Text('No news available'));
      },
    );
  }
}
