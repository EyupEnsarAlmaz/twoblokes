import 'package:http/http.dart' as http;
import 'dart:convert';

class TopicService {
  final String baseUrl;

  TopicService(this.baseUrl);

  Future<void> saveUserSelections(
      int userId, Set<String> selectedTopics) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/topics'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'user_id': userId,
        'selected_topics': selectedTopics.toList(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save selections.');
    }
  }
}
