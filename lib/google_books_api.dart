import 'dart:convert';
import 'package:http/http.dart' as http;
import 'book.dart';

class GoogleBooksApi {
  static const _baseUrl = 'www.googleapis.com';
  static const _apiKey = 'AIzaSyCvP8UF-CE64MgHS9pJdhPXEbwvUwAUO84';

  static Future<List<Book>> searchBooks(String query, {int startIndex = 0, int maxResults = 10, String? orderBy,}) async {
    final uri = Uri.https(
      _baseUrl,
      '/books/v1/volumes',
      {
        'q': query,
        'startIndex': startIndex.toString(),
        'maxResults': maxResults.toString(),
        'key': _apiKey,
      },
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List<dynamic>?;

        if (items == null) return [];

        return items.map((item) => Book.fromMap(item)).toList();
      } else {
        throw Exception('Failed to fetch books. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }
}