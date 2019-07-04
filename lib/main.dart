import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GlobalVariables.dart';
import 'ScreenVariables.dart';

Future<void> main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  new Future.delayed(new Duration(milliseconds: 1000), () async {
    main2();
  });
}

Future<void> main2() async {
  await sv.Init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable Show Debug
      title: '倍投计算器',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '倍投计算器'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ctlTextField1 = TextEditingController();
  final ctlTextField2 = TextEditingController();
  final ctlTextField3 = TextEditingController();
  final ctlTextField4 = TextEditingController();
  final ctlTextField5 = TextEditingController();
  final ctlTextField6 = TextEditingController();
  final ctlTextField7 = TextEditingController();
  final ctlTextField8 = TextEditingController();

  bool _bolCheckBox1 = false;
  bool _bolCheckBox2 = false;
  bool _bolCheckBox3 = false;
  bool _bolCheckBox4 = false;
  bool _bolCheckBox5 = false;

  String strType1 = gv.listType1[0];
  String strType2 = gv.listType2[0];

  void _CheckBoxChanged1(bool value) {
    if (value) {
      setState(() => _bolCheckBox1 = value);
    } else {
      _bolCheckBox1 = value;
      _bolCheckBox2 = false;
      _bolCheckBox3 = false;
      _bolCheckBox4 = false;
      _bolCheckBox5 = false;
      ctlTextField5.text = '';
      ctlTextField6.text = '';
      ctlTextField7.text = '';
      ctlTextField8.text = '';
      setState(() {

      });
    }
  }

  void _CheckBoxChanged2(bool value) {
    if (_bolCheckBox1) {
      if (value) {
        _bolCheckBox2 = value;
        _bolCheckBox3 = false;
        _bolCheckBox4 = false;
        _bolCheckBox5 = false;
        ctlTextField6.text = '';
        ctlTextField7.text = '';
        ctlTextField8.text = '';
        setState(() {

        });
      } else {
        _bolCheckBox2 = value;
        ctlTextField5.text = '';
        setState(() {

        });
      }
    }
  }
  void _CheckBoxChanged3(bool value) {
    if (_bolCheckBox1) {
      if (value) {
        _bolCheckBox2 = false;
        _bolCheckBox3 = value;
        _bolCheckBox4 = false;
        _bolCheckBox5 = false;
        ctlTextField5.text = '';
        ctlTextField7.text = '';
        ctlTextField8.text = '';
        setState(() {

        });
      } else {
        _bolCheckBox3 = value;
        ctlTextField3.text = '';
        setState(() {

        });
      }
    }
  }
  void _CheckBoxChanged4(bool value) {
    if (_bolCheckBox1) {
      if (value) {
        _bolCheckBox2 = false;
        _bolCheckBox3 = false;
        _bolCheckBox4 = value;
        _bolCheckBox5 = false;
        ctlTextField5.text = '';
        ctlTextField6.text = '';
        ctlTextField8.text = '';
        setState(() {

        });
      } else {
        _bolCheckBox4 = value;
        ctlTextField4.text = '';
        setState(() {

        });
      }
    }
  }
  void _CheckBoxChanged5(bool value) {
    if (_bolCheckBox1) {
      if (value) {
        _bolCheckBox2 = false;
        _bolCheckBox3 = false;
        _bolCheckBox4 = false;
        _bolCheckBox5 = value;
        ctlTextField6.text = '';
        ctlTextField7.text = '';
        ctlTextField8.text = '';
        setState(() {
        });
      } else {
        _bolCheckBox5 = value;
        ctlTextField5.text = '';
        setState(() {

        });
      }
    }
  }

  void funCalculate() {
    // 这里处理按了计算
  }

  Widget MainBody() {
    return Container(
      width: sv.dblScreenWidth,
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(height: sv.dblDefaultFontSize, child: Text(' ')),
          Body1(),
          SizedBox(height: sv.dblDefaultFontSize * 2, child: Text(' ')),
          Container(
              width: sv.dblScreenWidth,
              color: Color.fromRGBO(240, 240, 240, 1.0),
              child: Text('  期号设置',
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  textScaleFactor: 1.0)),
          SizedBox(height: sv.dblDefaultFontSize / 2, child: Text(' ')),
          Body2(),
          SizedBox(height: sv.dblDefaultFontSize * 2, child: Text(' ')),
          Container(
              width: sv.dblScreenWidth,
              color: Color.fromRGBO(240, 240, 240, 1.0),
              child: Text('  条件选项',
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  textScaleFactor: 1.0)),
          SizedBox(height: sv.dblDefaultFontSize, child: Text(' ')),
          Body3(),
          SizedBox(height: sv.dblDefaultFontSize * 3, child: Text(' ')),
          Row(children: <Widget>[
            Text(' '),
            Expanded(child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(
                      5.0)),
              textColor: Colors.white,
              color: Color.fromRGBO(68, 68, 93, 1.0),
              onPressed: () => funCalculate(),
              child: Text('计算',
                  style: TextStyle(
                      fontSize: sv.dblDefaultFontSize * 1)),
            ),),
            Text(' '),
          ],)
        ],
      )),
    );
  }

  Color getColor(index) {
    // 根据行数出不同背景颜色
    if (index == 0) {
      // 标题颜色
      return Color.fromRGBO(240, 240, 240, 1.0);
    } else if (index % 2 == 0) {
      // 双数行颜色
      return Color.fromRGBO(230, 230, 230, 1.0);
    } else {
      // 单数行颜色
      return Color.fromRGBO(240, 240, 240, 1.0);
    }
  }

  Widget getDivider(index) {
    if (index == 0) {
      return Container(
          width: sv.dblScreenWidth,
          color: Colors.white,
          child: SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')));
    } else {
      return Container();
    }
  }

  Widget Body1() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: gv.listBody1.length,
        itemBuilder: (context, index) {
          return Container(
              color: getColor(index),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col1'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col2'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col3'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col4'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col5'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col6'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                    SizedBox(
                        width: sv.dblScreenWidth / 7.1,
                        child: Center(
                            child: Text(gv.listBody1[index]['col7'],
                                style:
                                    TextStyle(fontSize: sv.dblDefaultFontSize),
                                textScaleFactor: 1.0))),
                  ]),
                  getDivider(index),
                ],
              ));
        });
  }

  Widget Body2() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                  width: sv.dblScreenWidth * 0.35,
                  child: Text('  彩票种类',
                      style: TextStyle(fontSize: sv.dblDefaultFontSize),
                      textScaleFactor: 1.0)),
              SizedBox(
                width: sv.dblScreenWidth * 0.64,
                height: sv.dblDefaultFontSize * 2,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: strType1,
                    items: gv.listType1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(fontSize: sv.dblDefaultFontSize),
                            textScaleFactor: 1.0),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        strType1 = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                  width: sv.dblScreenWidth * 0.35,
                  child: Text('  投注方式',
                      style: TextStyle(fontSize: sv.dblDefaultFontSize),
                      textScaleFactor: 1.0)),
              SizedBox(
                width: sv.dblScreenWidth * 0.64,
                height: sv.dblDefaultFontSize * 2,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: strType2,
                    items: gv.listType2.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(fontSize: sv.dblDefaultFontSize),
                            textScaleFactor: 1.0),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        strType2 = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                  width: sv.dblScreenWidth * 0.35,
                  child: Text('  投入注数',
                      style: TextStyle(fontSize: sv.dblDefaultFontSize),
                      textScaleFactor: 1.0)),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField1,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('注',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                  width: sv.dblScreenWidth * 0.35,
                  child: Text('  投注期数',
                      style: TextStyle(fontSize: sv.dblDefaultFontSize),
                      textScaleFactor: 1.0)),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField2,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('期',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                  width: sv.dblScreenWidth * 0.35,
                  child: Text('  起始倍数',
                      style: TextStyle(fontSize: sv.dblDefaultFontSize),
                      textScaleFactor: 1.0)),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField3,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('倍',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                  width: sv.dblScreenWidth * 0.35,
                  child: Text('  单注奖金',
                      style: TextStyle(fontSize: sv.dblDefaultFontSize),
                      textScaleFactor: 1.0)),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField4,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('元',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Body3() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                height: sv.dblDefaultFontSize * 1.6,
                child: Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: _bolCheckBox1,
                    onChanged: _CheckBoxChanged1,
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.01,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text(' '),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.24,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text('收益类条件',
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textScaleFactor: 1.0),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                height: sv.dblDefaultFontSize * 1.6,
                child: Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: _bolCheckBox2,
                    onChanged: _CheckBoxChanged2,
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.01,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text(' '),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.24,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text('全程收益',
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textScaleFactor: 1.0),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField5,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enabled: _bolCheckBox2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('%',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                height: sv.dblDefaultFontSize * 1.6,
                child: Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: _bolCheckBox3,
                    onChanged: _CheckBoxChanged3,
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.01,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text(' '),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.24,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text('前期收益',
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textScaleFactor: 1.0),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField6,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enabled: _bolCheckBox3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('%',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                height: sv.dblDefaultFontSize * 1.6,
                child: Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: _bolCheckBox4,
                    onChanged: _CheckBoxChanged4,
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.01,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text(' '),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.24,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text('后期收益',
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textScaleFactor: 1.0),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField7,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enabled: _bolCheckBox4,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('%',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
          SizedBox(height: sv.dblDefaultFontSize / 4, child: Text(' ')),
          Row(
            children: <Widget>[
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                height: sv.dblDefaultFontSize * 1.6,
                child: Transform.scale(
                  scale: 0.6,
                  child: Checkbox(
                    value: _bolCheckBox5,
                    onChanged: _CheckBoxChanged5,
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.01,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text(' '),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.24,
                height: sv.dblDefaultFontSize * 1.6,
                child: Text('累计收益不低于',
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textScaleFactor: 1.0),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.54,
                height: sv.dblDefaultFontSize * 2,
                child: TextField(
                  style: TextStyle(fontSize: sv.dblDefaultFontSize),
                  controller: ctlTextField8,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enabled: _bolCheckBox5,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                ),
              ),
              SizedBox(
                width: sv.dblScreenWidth * 0.1,
                child: Center(
                    child: Text('元',
                        style: TextStyle(fontSize: sv.dblDefaultFontSize),
                        textScaleFactor: 1.0)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 68, 93, 1.0),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)) ,
      ),
      body: MainBody(),
    );
  }
}
