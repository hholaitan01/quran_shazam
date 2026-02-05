import 'dart:io';
import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:8000";

Future<Map<String, dynamic>> recognize(File audio) async {
  final request =
      http.MultipartRequest('POST', Uri.parse('$baseUrl/recognize'));

  request.files.add(await http.MultipartFile.fromPath('file', audio.path));
  final response = await request.send();
  final body = await response.stream.bytesToString();

  return body.isNotEmpty ? jsonDecode(body) : {};
}
