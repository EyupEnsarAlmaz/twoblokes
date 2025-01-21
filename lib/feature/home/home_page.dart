import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twoblokes/feature/earnings_calender/earnings_calender.dart';
import 'package:twoblokes/feature/economic_calender/economic_calender.dart';
import 'package:twoblokes/feature/education/education_page.dart';
import 'package:twoblokes/feature/news/news_page.dart';
import 'package:twoblokes/feature/podcast/podcast_page.dart';
import 'package:twoblokes/feature/premium/premium_page.dart';
import 'package:twoblokes/feature/profile/profile_page.dart';

import '../bullish_bearish/bullish_bearish_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeBody(),
    EducationPage(),
    PodcastPage(),
    PremiumPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/twoblokes.png',
          height: 40,
        ),
        actions: [
          PopupMenuButton(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Icon(
                Icons.chat_bubble,
                size: 30,
                color: Colors.grey,
              ),
            ),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: "message",
                child: Row(
                  children: [
                    const Text(
                      'No new message',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          PopupMenuButton(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.grey,
              ),
            ),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: "notifications",
                child: Row(
                  children: [
                    const Text(
                      'No new notifications',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName:
                  Text("Jonathan ", style: TextStyle(color: Colors.black)),
              accountEmail: Text("jonathan@twoblokestrading.com",
                  style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: Image.asset("assets/jonathanpp.png").image,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('News'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewsPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_view_week_rounded),
              title: Text('Economic Calender'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MobileEconomicCalendar();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Earnings Calender'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EarningsCalendar();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Supports and Resistance'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapatır
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('AI Signals'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapatır
              },
            ),
            ListTile(
              leading: Icon(Icons.add_chart),
              title: Text('Bullish and Bearish'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LiquidationsTable();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapatır
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.podcasts),
            label: 'Podcast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      _buildRateCard(
                        title: 'DXY',
                        value: '96,29',
                        change: '-0,01',
                        isUp: false,
                      ),
                      _buildRateCard(
                        title: 'Euro / USD',
                        value: '1.034',
                        change: '0,00',
                        isUp: false,
                      ),
                      _buildRateCard(
                        title: 'Gold',
                        value: '2500',
                        change: '0,06',
                        isUp: true,
                      ),
                      _buildRateCard(
                        title: 'Nasdaq',
                        value: '9,911',
                        change: '0,00',
                        isUp: true,
                      ),
                      _buildRateCard(
                        title: 'Bitcoin',
                        value: '94,191',
                        change: '-0,43',
                        isUp: false,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue[600],
                          child: const Text(
                            'EA',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Post Something...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          hint: const Text('Category'),
                          value: _selectedCategory,
                          items: <String>[
                            'Crypto',
                            'Forex',
                            'Stocks',
                            'Beginner'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        SentimentToggleButtons(onSentimentChanged: (a) {}),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildPostOption(Icons.image, 'Photo'),
                        _buildPostOption(Icons.videocam, 'Video'),
                        _buildPostOption(Icons.mic, 'Audio'),
                        _buildPostOption(Icons.more_horiz, 'More'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTabItem('Crypto', true),
                      _buildTabItem('Forex', false),
                      _buildTabItem('Stocks', false),
                      _buildTabItem('Podcast', false),
                      _buildTabItem('Beginner', false),
                      _buildTabItem('Daily market', false),
                    ],
                  ),
                ),
              ),
              MarketAnalysisPost(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildRateCard({
  required String title,
  required String value,
  required String change,
  required bool isUp,
}) {
  return Container(
    width: 110,
    margin: const EdgeInsets.only(right: 10, left: 5),
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '%$change',
                  style: TextStyle(
                    fontSize: 14,
                    color: isUp ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildTabItem(String text, bool isSelected) {
  return InkWell(
    onTap: () {
      // Handle tab selection
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget _buildCircularButton(dynamic icon, Color color) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey[200],
    ),
    child: Center(
      child: icon is IconData
          ? Icon(icon, color: color)
          : Text(
              icon.toString(),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
    ),
  );
}

Widget _buildPostOption(IconData icon, String label) {
  return Row(
    children: [
      Icon(icon, color: Colors.grey),
      const SizedBox(width: 4),
      Text(label, style: const TextStyle(color: Colors.grey)),
    ],
  );
}

Widget _buildTickerItem({
  required String symbol,
  required String price,
  required double changePercent,
}) {
  final isPositive = changePercent >= 0;

  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(right: 1), // Thin divider effect
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.shade200,
        width: 1,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          symbol,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          price,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${isPositive ? '+' : ''}${changePercent.toStringAsFixed(2)}%',
          style: TextStyle(
            fontSize: 16,
            color: isPositive ? Colors.green : Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

class MarketAnalysisPost extends StatelessWidget {
  const MarketAnalysisPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with author info
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: Image.asset("assets/jonathanpp.png").image,
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jonathon Farrerly",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.photo, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            "Fri at 1:26 PM",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.public,
                              size: 16, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'WTI crude oil futures rallying, surpassing \$76.6 per barrel, reaching the highest level since October, driven by a drop in US crude stockpiles.\n\n'
              'Cold weather in the US reduced inventory levels at Cushing, Oklahoma, to their lowest since 2014. The global oil market is tightening due to reduced supply from key exporters like Russia and Iran, as well as a surge in demand for heating fuels.',
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
          // Show more/less button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'less',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.blue[700],
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset("assets/tradeimage.png").image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SentimentToggleButtons extends StatefulWidget {
  final Function(String?) onSentimentChanged;

  const SentimentToggleButtons({Key? key, required this.onSentimentChanged})
      : super(key: key);

  @override
  _SentimentToggleButtonsState createState() => _SentimentToggleButtonsState();
}

class _SentimentToggleButtonsState extends State<SentimentToggleButtons> {
  String? _selectedSentiment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSentimentButton('Bullish', Colors.green[600]!),
          _buildSentimentButton('Bearish', Colors.red[600]!),
        ],
      ),
    );
  }

  Widget _buildSentimentButton(String text, Color color) {
    bool isSelected = _selectedSentiment == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSentiment = isSelected ? null : text;
        });
        widget.onSentimentChanged(_selectedSentiment);
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : null,
          borderRadius: BorderRadius.circular(18),
          border: isSelected ? Border.all(color: color, width: 1) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? color : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPost() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(16),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jonathan Farrelly → Commodities Traders Community:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fri at 1:26 PM',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'WTI crude oil futures rallying, surpassing \$76.6 per barrel, reaching the highest level since October, driven by a drop in US crude stockpiles.\n\n'
          'Cold weather in the US reduced inventory levels at Cushing, Oklahoma, to their lowest since 2014. The global oil market is tightening due to reduced supply from key exporters like Russia and Iran, as well as a surge in demand for heating fuels.',
        ),
        TextButton(
          onPressed: () {},
          child: const Text('more'),
        ),
      ],
    ),
  );
}
