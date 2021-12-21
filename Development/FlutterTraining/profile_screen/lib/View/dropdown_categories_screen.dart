import 'package:flutter/material.dart';

// class UploadDocument extends StatefulWidget {
//   const UploadDocument({Key? key}) : super(key: key);

//   @override
//   _UploadDocumentState createState() => _UploadDocumentState();
// }

// class _UploadDocumentState extends State<UploadDocument> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();

//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_screen/update_address_screen.dart';
import 'package:profile_screen/upload_document_screen.dart';

// ignore: must_be_immutable
class FrontAndRearImages extends StatelessWidget {
  FrontAndRearImages({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 16.0)),
        DocumentUpdate(options: options),
      ],
    );
  }
}

// ignore: must_be_immutable
class DocumentUpdate extends StatelessWidget {
  DocumentUpdate({
    Key? key,
    required this.options,
    this.onPressed,
  }) : super(key: key);
  int? defaultSelectedIndex;
  List<Map<String, dynamic>> options;
  final Function(dynamic)? onPressed;
  dynamic value;

  int getIndex() {
    for (var index = 0; index < options.length; index++) {
      if (options[index]['value'] == value) {
        return index;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    defaultSelectedIndex = getIndex();
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 42.0,
        // mainAxisSpacing: 100.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // childAspectRatio: (1 / .80),
        children: List.generate(2, (index) {
          return Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      if (onPressed != null) {
                        onPressed!(options[index]['value'] ?? '');
                      }
                      defaultSelectedIndex = index;
                      (context as Element).markNeedsBuild();
                    },
                    child: Ink.image(
                      image: const AssetImage('lib/asset/nature1.jpg'),
                      fit: BoxFit.cover,
                      child: InkWell(
                        splashColor: Colors.yellow,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Upload.route,
                            arguments:
                                ScreenArguments('Update your Aadthar', ''),
                          );
                          // Navigator.push(context, route)
                        },
                      ),
                    )
                    // Pass iconData and a boolean that specifies if the icon is selected or not
                    ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8.0)),
                  Text(imageSide[index]['title']),
                ],
              )
            ],
          );
        }));
  }
}

List<Map<String, dynamic>> imageSide = [
  {'title': 'front'},
  {
    'title': 'back',
  },
];
