import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

List<String> praises = [
  "سبحان الله",
  "الحمد لله",
  "لا اله الا الله",
  "الله اكبر",
];
int index = 0;

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              width: double.infinity,
              height: 320,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width * 0.2)) /
                        2,
                    child: Image(
                      image:
                          const AssetImage("assets/images/head of seb7a.png"),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: turns,
                      child: Image(
                        image:
                            const AssetImage("assets/images/body of seb7a.png"),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "number_of_praises".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 70,
              height: 82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                  child: Text(
                "$count",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.inter().fontFamily),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 140,
              height: 53,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary),
                  onPressed: () {
                    setState(() {
                      if (count != 33) {
                        count++;
                      } else {
                        count = 0;
                        if (index == 3) {
                          index = 0;
                        }
                        index++;
                      }
                      turns += 0.033;
                    });
                  },
                  child: Text(
                    praises[index],
                    style: TextStyle(
                        fontSize: 23,
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
