import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/weather.dart';

import '../widgets/item.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadeddata = Provider.of<Weather>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather State'),
        ),
        body: FutureBuilder(
          future: loadeddata.getData(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Item(index);
                      },
                      itemCount: 6),
        ));
  }
}
