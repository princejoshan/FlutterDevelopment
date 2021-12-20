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
import 'package:profile_screen/update_address.dart';

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
        SelectOptionCard(options: options, value: 'required')
      ],
    );
  }
}

class SelectOptionCard extends StatelessWidget {
  SelectOptionCard({
    Key? key,
    required this.options,
    required this.value,
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
        crossAxisSpacing: 21.0,
        mainAxisSpacing: 16.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: (1 / .80),
        children: List.generate(2, (index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: GestureDetector(
                onTap: () {
                  if (onPressed != null) {
                    onPressed!(options[index]['value'] ?? '');
                  }
                  defaultSelectedIndex = index;
                  (context as Element).markNeedsBuild();
                },
                child: const Image(
                  image: AssetImage('lib/asset/nature1.jpg'),
                ) // Pass iconData and a boolean that specifies if the icon is selected or not
                ),
          );
        }));
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.title,
    this.image,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);
  final String? title, image;
  final int selectedIndex, index;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: selectedIndex == index
            ? Theme.of(context).primaryColor
            : Theme.of(context).textTheme.headline5?.color,
        fontWeight: Theme.of(context).textTheme.headline5?.fontWeight,
        fontFamily: Theme.of(context).textTheme.headline5?.fontFamily,
        fontSize: Theme.of(context).textTheme.headline5?.fontSize);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.transparent,
        border: Border.all(
            width: selectedIndex == index ? 2 : 1,
            color: selectedIndex == index
                ? Theme.of(context).primaryColor
                : Theme.of(context)
                    .dividerColor //                   <--- border width here
            ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 22, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (image != null)
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: const [
                        // image!.contains('.png')
                        //     ? CustomImage(name: image!)
                        //     : SvgPicture.asset(
                        //         'assets/icons/$image',
                        //         color: selectedIndex == index
                        //             ? Theme.of(context).primaryColor
                        //             : Theme.of(context).dividerColor,
                        //       )
                      ],
                    ),
                  ),
                if (selectedIndex == index)
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).indicatorColor,
                            size: 16.0,
                          )
                        ],
                      ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 22),
                child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    text: TextSpan(text: title ?? '', style: textStyle))),
          )
        ],
      ),
    );
  }
}
