import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PictureProvider with ChangeNotifier {
  List<File> _pictures = [];

  List<File> get pictures => _pictures;

  Future<void> addPicture(File picture) async {
    final directory = await getApplicationDocumentsDirectory();
    final newPath = path.join(directory.path, 'hasil_picture');
    final newDirectory = Directory(newPath);

    if (!await newDirectory.exists()) {
      await newDirectory.create(recursive: true);
    }

    final newPicturePath = path.join(newDirectory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
    final newPicture = await picture.copy(newPicturePath);

    _pictures.add(newPicture);
    notifyListeners();
  }
}