import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PdfProvider with ChangeNotifier {
 Future<void> downloadAndSaveFile(String url, String fileName) async {
 try {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Directory? directory = await getExternalStorageDirectory();
      if (directory == null) {
        print('Could not access the external storage directory.');
        return;
      }
      String downloadPath = path.join(directory.path, 'Download');
      await Directory(downloadPath).create(recursive: true);
      String filePath = path.join(downloadPath, fileName);
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('File saved to: $filePath');
    } else {
      print('Failed to download file: ${response.statusCode}');
    }
  } catch (e) {
    print('Error downloading file: $e');
  }
}
}
