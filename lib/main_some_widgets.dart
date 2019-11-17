import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Widgets')),
        body: simpleAlign,
      ),
    );
  }
}

get simpleCommon => Center(
      child: FlutterLogo(
        size: 300.0,
      ),
    );

get simpleContainer => Center(
      child: Container(
        padding: EdgeInsets.only(bottom: 100),
        color: Colors.grey[200],
        child: FlutterLogo(
          size: 300.0,
        ),
      ),
    );

get decoratedContainer => Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
          border: Border.all(
              color: Colors.green, width: 2.0, style: BorderStyle.solid),
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.cyan,
              Colors.grey,
              Colors.yellow,
            ],
          ),
        ),
        child: FlutterLogo(
          size: 300.0,
        ),
      ),
    );

get rowColumnStack => Container(
      color: Colors.amber,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                "One",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                "Two",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Three",
                style: TextStyle(fontSize: 33),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Expanded(
                child: Text(
                  "One",
                ),
              ),
              Expanded(
                child: Text(
                  "Two",
                ),
              ),
              Expanded(
                child: Text(
                  "Three",
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.stacked,
              ),
              FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.horizontal,
              ),
              FlutterLogo(
                size: 100,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                overflow: Overflow.visible,
                children: <Widget>[
                  FlutterLogo(
                    size: 100,
                  ),
                  Text(
                    "+  +   +",
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                  Container(
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );

get listTiles => ListView(
      padding: EdgeInsets.all(4),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        for (int _ in Iterable.generate(15)) ListItem(),
      ],
    );

get listOfWidget => Center(
      child: SizedBox(
        width: 300,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return Container(
                height: 300,
                child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              );
            } else if (index == 1) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.edit),
                    suffixIcon: Icon(Icons.settings),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: "Input smth",
                    helperText: 'Short description, dude.',
                    labelText: 'Input text...',
                    // FIXME errorText: "sdf"
                  ),
                ),
              );
            } else if (index == 2) {
              return MaterialButton(
                minWidth: 100,
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Subtract",
                ),
              );
            } else if (index == 3) {
              return RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(
                  "Subtract",
                ),
              );
            } else {
              return CupertinoButton(
                onPressed: () {},
                pressedOpacity: 0.13,
                color: Colors.red,
                child: Text(
                  "Subtract",
                ),
              );
            }
          },
        ),
      ),
    );

get simpleAlign => Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Color(0xFF336161),
        child: Align(
          alignment: FractionalOffset(0.1, 0.7),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      child: ListTile(
        onTap: () {},
        dense: true,
        contentPadding: EdgeInsets.all(2),
        leading: Icon(Icons.menu),
        trailing: Icon(Icons.arrow_forward),
        title: Text("Mega title  "),
        subtitle: Text("My subtitle"),
      ),
    );
  }
}

get textWrapping => Row(
      children: <Widget>[
        Expanded(
          child: Text(
            "One is testing one",
            softWrap: true,
          ),
        ),
        Expanded(
          child: Text(
            "Two is testing two",
          ),
        ),
        Expanded(
          child: Text(
            "Three is testing thee",
            softWrap: false,
          ),
        ),
        Expanded(
          child: Text(
            "Four isisis four",
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
        ),
        Expanded(
          child: Text(
            "Five is testing five",
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
        Expanded(
          child: Text(
            "Six is testing six",
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
