import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Upload extends StatelessWidget {
  static const String route = '/second';
  // final String title;
  // ignore: use_key_in_widget_constructors
  //  const Upload(this.title);

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(244, 246, 250, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Update Address',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
