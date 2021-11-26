import 'package:flutter/material.dart';

class MyWatclist extends StatelessWidget {
  final String name;
  final List<Map<String, Object>> watchlistData;
  // ignore: use_key_in_widget_constructors
  const MyWatclist(this.watchlistData, this.name);

  get mainAxisAlignment => null;

  get padding => null;
  @override
  Widget build(BuildContext context) {
    //   return ListView.builder(
    //     itemCount: 5,
    //     key: PageStorageKey(key),
    //     padding: const EdgeInsets.all(8.0),
    //     itemBuilder: (_, i) => ListTile(title: Text('$name ')),
    //   );
    // }
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          //print(watchlistData[index]);

          return Card(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'TATA MOTORS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'BSE',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        '93.0',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        '56.0(90.0%)',
                        //style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  margin(EdgeInsets edgeInsets) {}
}
