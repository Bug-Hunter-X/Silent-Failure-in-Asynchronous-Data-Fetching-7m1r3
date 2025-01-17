```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
    rethrow; // Rethrow for handling higher up
  } catch (e) {
    print('Error fetching data: $e');
    rethrow; // Rethrow for handling higher up
  }
}

void main() async {
  try {
    final data = await fetchData();
    if (data != null) {
      print('Data fetched successfully: $data');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
```