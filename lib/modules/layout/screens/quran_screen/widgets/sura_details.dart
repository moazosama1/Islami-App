import 'package:flutter/material.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/modules/layout/screens/quran_screen/quran_screen.dart';
import 'package:islami/modules/providers/sura_read_file.dart';
import 'package:provider/provider.dart';

import 'verses-style.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "SuraDetails";

  @override
  Widget build(BuildContext context) {
    var argument = (ModalRoute.of(context)!.settings.arguments as SuraArgument);
    return ChangeNotifierProvider(
      create: (context) => ProviderReadFile()..readFileData(argument.index),
      builder: (context, child) {
        var myProvider = Provider.of<ProviderReadFile>(context);
        return BgWidget(
            child: Scaffold(
          appBar: AppBar(
              title: Text(argument.suraName),
              iconTheme: Theme.of(context).iconTheme),
          body: Card(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(argument.suraName,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        width: 10,
                      ),
                      ImageIcon(
                          const AssetImage("assets/icons/play-circle.png"),
                          size: 28,
                          color: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    endIndent: 30,
                    indent: 30,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return VersesStyle(
                            content: myProvider.verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 7),
                          );
                        },
                        itemCount: myProvider.verses.length),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
