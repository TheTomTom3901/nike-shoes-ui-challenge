import 'package:flutter/material.dart';
import 'package:nike_shoes_ui_challenge/palette.dart';
import 'package:nike_shoes_ui_challenge/shoes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(StarterApp());

class StarterApp extends StatelessWidget {
  const StarterApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: background,
        textTheme: TextTheme(
          subtitle: TextStyle(
            color: primary,
            fontSize: 24,
            fontFamily: 'BebasNeue',
          ),
          button: TextStyle(
            fontSize: 16,
            fontFamily: 'BebasNeue',
          ),
        ),
      ),
      home: const ShoesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoesPage extends StatelessWidget {
  const ShoesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 45,
            ),
            Image.asset('assets/logo.png'),
            SizedBox(
              height: 20,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: primary, width: 0.75),
                top: BorderSide(color: primary, width: 0.75),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GenderSelector(
                    title: 'MEN',
                    selected: true,
                  ),
                  GenderSelector(
                    title: 'WOMEN',
                    selected: false,
                  ),
                  GenderSelector(
                    title: 'KIDS',
                    selected: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'NEW ARRIVAL',
              style: Theme.of(context).textTheme.subtitle,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: PageController(viewportFraction: 0.95),
                itemBuilder: (context, index) {
                  return Card(
                    color: shoes[index]['info_background'],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    gradient: shoes[index]['background'],
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                              ),
                              Align(
                                alignment: Alignment(0, .6),
                                child: Opacity(
                                  opacity: 0.1,
                                  child: Container(
                                    height: 130,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primary,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(1, .1),
                                child: Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(color: shoes[index]['rect_colour']),
                                    left: BorderSide(color: shoes[index]['rect_colour']),
                                    bottom: BorderSide(color: shoes[index]['rect_colour']),
                                  )),
                                ),
                              ),
                              Image.asset(shoes[index]['asset']),
                              Align(
                                  alignment: Alignment(-.8, -.8),
                                  child: Text(
                                    shoes[index]['price'],
                                    style: TextStyle(
                                      color: shoes[index]['price_colour'],
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'BebasNeue',
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment(-.8, .85),
                                  child: Icon(
                                    MdiIcons.heart,
                                    color: primary,
                                  ))
                            ],
                          ),
                          flex: 7,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                shoes[index]['name'],
                                style: TextStyle(
                                  fontFamily: 'BebasNeue',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: shoes[index]['name_colour'],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizeSelector(
                                    size: 'US 7',
                                    shoe: shoes[index],
                                    selected: false,
                                  ),
                                  SizeSelector(
                                    size: 'US 8',
                                    shoe: shoes[index],
                                    selected: false,
                                  ),
                                  SizeSelector(
                                    size: 'US 9',
                                    shoe: shoes[index],
                                    selected: true,
                                  ),
                                  SizeSelector(
                                    size: 'US 10',
                                    shoe: shoes[index],
                                    selected: false,
                                  ),
                                  SizeSelector(
                                    size: 'US 11',
                                    shoe: shoes[index],
                                    selected: false,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FlatButton(
                                onPressed: () {},
                                color: shoes[index]['cart_button'],
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(color: primary, fontFamily: 'BebasNeue'),
                                ),
                              )
                            ],
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        color: primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Icon(MdiIcons.homeOutline),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: jordan_yellow,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'HOME',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 16, fontWeight: FontWeight.w500, height: 1.8),
                )
              ],
            ),
            Icon(MdiIcons.cartOutline),
            Icon(MdiIcons.heartOutline),
            Icon(MdiIcons.accountCircleOutline),
          ],
        ),
      ),
    );
  }
}

class GenderSelector extends StatelessWidget {
  final String title;
  final bool selected;

  const GenderSelector({
    Key key,
    this.title,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: selected ? 1 : 0.4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: selected
            ? BoxDecoration(
                color: primary,
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'BebasNeue', color: selected ? background : primary),
        ),
      ),
    );
  }
}

class SizeSelector extends StatelessWidget {
  final String size;
  final Map shoe;
  final bool selected;

  const SizeSelector({
    Key key,
    this.size,
    this.shoe,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: shoe['border'], style: BorderStyle.solid),
        color: selected ? shoe['size_colour'] : Colors.transparent,
      ),
      child: Text(
        size,
        style: Theme.of(context).textTheme.button.copyWith(color: shoe[selected ? 'size_selected' : 'size_unselected']),
      ),
    );
  }
}
