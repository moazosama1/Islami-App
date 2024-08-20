import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/widgets/detailes/sura_list.dart';
import 'package:islami/modules/layout/screens/quran_screen/widgets/sura_details.dart';
import 'package:islami/modules/layout/screens/quran_screen/widgets/text_in_quran.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_provider.dart';

class QuranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerLoc = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Image.asset(
          "assets/images/quran_header_icn.png",
          width: 205,
          height: 227,
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const Divider(
                    thickness: 3,
                  ),
                  Row(
                    children: [
                      TextStyleInApp("suraName".tr()),
                      TextStyleInApp("verses".tr()),
                    ],
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SuraDetails.routeName,
                              arguments: SuraArgument(
                                  suraName: providerLoc.locale == 'ar'
                                      ? QuranDetails.arabicAuranSuras[index]
                                      : QuranDetails.englishQuranSurahs[index],
                                  index: index));
                        },
                        child: Row(
                          children: [
                            TextStyleInApp(providerLoc.locale == 'ar'
                                ? QuranDetails.arabicAuranSuras[index]
                                : QuranDetails.englishQuranSurahs[index]),
                            TextStyleInApp(QuranDetails.ayaNumber[index]),
                          ],
                        ),
                      );
                    },
                    itemCount: providerLoc.locale == 'ar'
                        ? QuranDetails.arabicAuranSuras.length
                        : QuranDetails.englishQuranSurahs.length,
                  ))
                ],
              ),
              const VerticalDivider(
                thickness: 3,
                indent: 9,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SuraArgument {
  String suraName;
  int index;

  SuraArgument({required this.suraName, required this.index});
}
