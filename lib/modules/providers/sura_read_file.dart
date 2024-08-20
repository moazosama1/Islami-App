import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProviderReadFile extends ChangeNotifier {
  List<String> verses = [];

  readFileData(int fileIndex) async {
    String fileContent =
    await rootBundle.loadString("assets/sura-file/${fileIndex + 1}.txt");
    List<String> line = fileContent.trim().split('\n');
    verses = line;
    notifyListeners();
  }
}
