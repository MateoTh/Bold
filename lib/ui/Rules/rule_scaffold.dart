import 'package:bold/ui/Rules/step_1.dart';
import 'package:bold/ui/Rules/step_2.dart';
import 'package:bold/ui/Rules/step_3.dart';
import 'package:bold/ui/Rules/step_4.dart';
import 'package:bold/ui/Rules/step_5.dart';
import 'package:bold/ui/Rules/step_6.dart';
import 'package:bold/ui/Rules/step_7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class RuleScaffold extends StatefulWidget {
  const RuleScaffold({Key? key}) : super(key: key);

  @override
  RuleScaffoldState createState() => RuleScaffoldState();
}

class RuleScaffoldState extends State<RuleScaffold> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> steps = [
      const Step1(),
      const Step2(),
      const Step3(),
      const Step4(),
      const Step5(),
      const Step6(),
      const Step7(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate('headers.rules'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: steps.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: steps[index],
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: List.generate(
                steps.length,
                (int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget rulesText(BuildContext context, String textLocalizationKey) {
  var translatedText = translate(textLocalizationKey);
  final List<String> parts = translatedText.split('*');
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: parts.asMap().entries.map((entry) {
          final String part = entry.value;
          final bool isBold = entry.key.isEven;
          return TextSpan(
            text: part,
            style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),
          );
        }).toList(),
      ),
    ),
  );
}

Widget image(BuildContext context, String path, {double? size}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: size ?? MediaQuery.of(context).size.width * 0.5,
      height: size ?? MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(path),
        ),
      ),
    ),
  );
}
