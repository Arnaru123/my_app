import 'package:http/http.dart' as http;
import 'dart:convert';

Future getChars() async {
  final httpUrl = Uri.parse('https://rickandmortyapi.com/api/character');
  final httpRes = await http.read(httpUrl);
  final httpJson = json.decode(httpRes) as Map<String, dynamic>;
  return httpJson;
}
