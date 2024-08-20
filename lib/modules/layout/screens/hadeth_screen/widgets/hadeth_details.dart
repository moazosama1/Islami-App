import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/providers/hadeth_read_file.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/bg_widget.dart';
import '../hadeth_screen.dart';
import 'dart:ui' as ui;

class HadethDetails extends StatefulWidget {
  static const String routeName = "Hadeth";

  @override
  State<HadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as ContentHadeth;
    return ChangeNotifierProvider(
      create: (context) =>
          HadethReadFile()..readFileHadethContent(argument.index),
      builder: (context, child) {
        var hadethProvider = Provider.of<HadethReadFile>(context);
        return BgWidget(
            child: Scaffold(
          appBar: AppBar(
            title: Text("hadeth_tab".tr()),
            iconTheme: Theme.of(context).iconTheme,
          ),
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
                  Text(
                    argument.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    endIndent: 30,
                    indent: 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          hadethProvider.content[index],
                          textDirection: ui.TextDirection.rtl,
                          style: Theme.of(context).textTheme.bodySmall,
                        );
                      },
                      itemCount: hadethProvider.content.length,
                    ),
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
