import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        title: Text(
          title,
          style: kHeading6.copyWith(color: blackLight),
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("legal/$content"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SingleChildScrollView(
                child: MarkdownBody(
                  data: snapshot.data ?? '-',
                  styleSheet: MarkdownStyleSheet.fromTheme(
                    ThemeData(
                      textTheme: TextTheme(
                        bodyText2: kBody2.copyWith(
                          color: blackLightest,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularLoading(),
            );
          }
        },
      ),
    );
  }
}
