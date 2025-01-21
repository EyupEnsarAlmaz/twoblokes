import 'package:flutter/material.dart';
import 'package:twoblokes/feature/home/home_page.dart';
import '../signin/signin_page.dart';
import '../signup/signup_page.dart';
import '../../services/topic_service.dart';

class TopicSelectionPage extends StatefulWidget {
  const TopicSelectionPage({Key? key}) : super(key: key);

  @override
  _TopicSelectionPageState createState() => _TopicSelectionPageState();
}

class _TopicSelectionPageState extends State<TopicSelectionPage> {
  final Set<String> _selectedTopics = {};
  static const int maxSelections = 5;
  final TopicService _topicService = TopicService('http://localhost:8089');

  final Map<String, List<String>> categories = {
    'Crypto': ['Bitcoin', 'Ethereum', 'Xrp', 'Sol', 'Ada'],
    'Fx': ['Nvdia', 'TSLA', 'AAPL', 'AMZN', 'GOOGL'],
    'News': ['Fed', 'Inflation', 'Economy', 'Stocks', 'Bonds'],
    'Tech': ['AI', 'ML', 'AR', 'VR', 'IoT'],
    'Currency': ['USD', 'EUR', 'JPY', 'GBP', 'AUD'],
  };

  void _handleTopicSelection(String topic, bool selected) {
    setState(() {
      if (selected) {
        if (_selectedTopics.length < maxSelections) {
          _selectedTopics.add(topic);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Maximum 5 topics can be selected'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        _selectedTopics.remove(topic);
      }
    });
  }

  void _saveSelections() async {
    try {
      final userId = 7;
      await _topicService.saveUserSelections(userId, _selectedTopics);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selections saved successfully.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save selections.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What are you interested in?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select some topics you\'re interested in to help personalize your experience, starting with finding people to follow.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Selected: ${_selectedTopics.length}/$maxSelections',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for interests',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String categoryName = categories.keys.elementAt(index);
                List<String> topics = categories[categoryName]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        categoryName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: topics.map((topic) {
                          bool isSelected = _selectedTopics.contains(topic);
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Text(topic),
                              selected: isSelected,
                              onSelected:
                                  (_selectedTopics.length < maxSelections ||
                                          isSelected)
                                      ? (selected) =>
                                          _handleTopicSelection(topic, selected)
                                      : null,
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue[100],
                              checkmarkColor: Colors.blue,
                              side: BorderSide(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey[300]!,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      _selectedTopics.isNotEmpty ? _saveSelections : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
