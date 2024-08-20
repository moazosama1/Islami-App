import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HadethReadFile extends ChangeNotifier {
  List<String> titileHadeth = [];
  List<String> content = [];

  readFileName() async {
    List<String> title = [];
    for (int i = 0; i < 50; i++) {
      String data =
          await rootBundle.loadString("assets/hadeth-file/h${i + 1}.txt");
      List<String> header = data.split('\n');
      title.add(header[0]);
      header.removeAt(0);
    }
    titileHadeth = title;
    notifyListeners();
  }

  readFileHadethContent(int index) async {
    String data =
        await rootBundle.loadString("assets/hadeth-file/h${index + 1}.txt");
    List<String> hadethContent = data.trim().split("\n");
    hadethContent.removeAt(0);
    content = hadethContent;
    notifyListeners();
  }
}
