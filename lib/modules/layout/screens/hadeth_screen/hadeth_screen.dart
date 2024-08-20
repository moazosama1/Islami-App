import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/hadeth_screen/widgets/hadeth_details.dart';
import 'package:islami/modules/providers/hadeth_read_file.dart';
import 'package:provider/provider.dart';
import '../quran_screen/widgets/text_in_quran.dart';

class HadethScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethReadFile()..readFileName(),
      builder: (context, child) {
        var hadethProvider = Provider.of<HadethReadFile>(context);
        return Column(
          children: [
            Image.asset(
              "assets/images/hadith_header.png",
              width: 315,
              height: 227,
            ),
            Expanded(
              child: Column(
                children: [
                  const Divider(
                    thickness: 3,
                  ),
                  Row(
                    children: [
                      TextStyleInApp("HadethName".tr()),
                    ],
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 3,
                        endIndent: 40,
                        indent: 40,
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HadethDetails.routeName,
                              arguments: ContentHadeth(
                                  title: hadethProvider.titileHadeth[index],
                                  index: index));
                        },
                        child: Row(
                          children: [
                            TextStyleInApp(hadethProvider.titileHadeth[index]),
                          ],
                        ),
                      );
                    },
                    itemCount: hadethProvider.titileHadeth.length,
                  ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class ContentHadeth {
  int index;
  String title;

  ContentHadeth({required this.title, required this.index});
}
