import 'package:flutter/material.dart';

import 'demo.dart';

class ContentListBuilder extends StatelessWidget {
  final bool _isButtonClicked;

  ContentListBuilder(this._isButtonClicked);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<Demo>(
        ///If future is null then API will not be called as soon as the screen
        ///loads. This can be used to make this Future Builder dependent
        ///on a button click.
        stream: _isButtonClicked ? getMockDataList() : null,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {

            ///when the future is null
            case ConnectionState.none:
              return Text(
                'Press the button to fetch data',
                textAlign: TextAlign.center,
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.done:
            default:
              if (snapshot.hasError)
                return Text(
                  'Error:\n\n${snapshot.error}',
                  textAlign: TextAlign.center,
                );

              if (snapshot.hasData)
                return Text(
                  'Fetched Data:\n\n${snapshot.data.title}',
                  textAlign: TextAlign.center,
                );
              else {
                return Text(
                  'Starting',
                  textAlign: TextAlign.center,
                );
              }
          }
        },
      ),
    );
  }
}
