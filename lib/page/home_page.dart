import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color main = Color(0xff47d9ba);
    double height = MediaQuery.of(context).size.height;
    bool isExpanded = true;

    Widget appBar = SliverAppBar(
      pinned: true,
      expandedHeight: height * 0.29,
      collapsedHeight: height * 0.075,
      backgroundColor: main,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double appBarHeight = constraints.biggest.height; //getting AppBar height
          isExpanded = appBarHeight > height * 0.2; //check if AppBar is expanded
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            title: SizedBox(
              height: height * 0.19,
              child: Column(
                mainAxisAlignment: isExpanded
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                children: <Widget>[
                  Visibility(
                    visible: isExpanded, child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: const Text("LIFE IS GAME", style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: "DNFBit", fontSize: 11, fontWeight: FontWeight.w300),),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            SizedBox(width: 35, height: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: (){},
                                icon: Icon(Icons.person_rounded, color: Color(0xFFFFFFFF), size: 18,),),),

                            SizedBox(width: 35, height: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: (){},
                                icon: Icon(Icons.settings_rounded, color: Color(0xFFFFFFFF), size: 18,),),)
                          ],
                        ),
                      )
                    ],)),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    padding:
                    isExpanded ? EdgeInsets.only(left: 5, right: 5) : EdgeInsets.all(20),
                    child: isExpanded
                        ? SizedBox(
                          height: height * 0.14,
                          width: double.infinity,
                          child: DashBoard())
                        : Row(
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: main,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBar,
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              List.generate(
                50,
                    (index) => ListTile(
                  title: Text('Index $index'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatView extends StatefulWidget{
  const StatView({super.key});

  @override
  State<StatefulWidget> createState() => StatState();

}

class StatState extends State<StatView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text("HP", style: TextStyle(color: Color(
                0xffe76969), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),),
            Container(
              child: LinearPercentIndicator(
                width: 80.0,
                padding: EdgeInsets.zero,
                lineHeight: 8.0,
                animation: true,
                animationDuration: 1000,
                barRadius: Radius.circular(7),
                percent: 0.5,
                progressColor: Color(0xffe76969),
                center: Text(
                    "10 / 20",
                    style: new TextStyle(fontSize: 6.0, color: Color(
                        0xffffffff), fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                )
              ),
              margin: EdgeInsets.only(left: 3, right: 3),
            ),
            Text("LV 3", style: TextStyle(color: Color(
                0xffe76969), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),)
          ],),
        Row(
          children: [
            Text("MP", style: TextStyle(color: Color(
                0xfff6aa3a), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),),
            Container(
              child: LinearPercentIndicator(
                width: 80.0,
                padding: EdgeInsets.zero,
                lineHeight: 8.0,
                barRadius: Radius.circular(7),
                percent: 0.5,
                animation: true,
                animationDuration: 1000,
                progressColor: Color(0xfff6aa3a),
                center: Text(
                    "10 / 20",
                    style: new TextStyle(fontSize: 6.0, color: Color(
                        0xffffffff), fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                )
              ),
              margin: EdgeInsets.only(left: 2.5, right: 2.5),
            ),
            Text("LV 3", style: TextStyle(color: Color(
                0xfff6aa3a), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),)
          ],),
        Row(
          children: [
            Text("RP", style: TextStyle(color: Color(
                0xff3fcb8c), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),),
            Container(
              child: LinearPercentIndicator(
                width: 80.0,
                padding: EdgeInsets.zero,
                lineHeight: 8.0,
                barRadius: Radius.circular(7),
                percent: 0.5,
                animation: true,
                animationDuration: 1000,
                progressColor: Color(0xff3fcb8c),
                center: Text(
                    "10 / 20",
                    style: new TextStyle(fontSize: 6.0, color: Color(
                        0xffffffff), fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                )
              ),
              margin: EdgeInsets.only(left: 3, right: 3),
            ),
            Text("LV 3", style: TextStyle(color: Color(
                0xff3fcb8c), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),)
          ],),
        Row(
          children: [
            Text("KP", style: TextStyle(color: Color(
                0xff48a9ee), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),),
            Container(
              child: LinearPercentIndicator(
                width: 80.0,
                padding: EdgeInsets.zero,
                lineHeight: 8.0,
                barRadius: Radius.circular(7),
                animation: true,
                animationDuration: 1000,
                percent: 0.5,
                progressColor: Color(0xff48a9ee),
                center: Text(
                    "10 / 20",
                    style: new TextStyle(fontSize: 6.0, color: Color(
                        0xffffffff), fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                )
              ),
              margin: EdgeInsets.only(left: 3, right: 3),
            ),
            Text("LV 3", style: TextStyle(color: Color(
                0xff48a9ee), fontFamily: "NanumRound", fontSize: 8, fontWeight: FontWeight.w800),)
          ],)
      ],
    );
  }
}

class DashBoard extends StatefulWidget{
  const DashBoard({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashState();
  }
}

class DashState extends State<DashBoard>{

  Color main = const Color(0xff47d9ba);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp14-witb-silver-202310?wid=1136&hei=784&fmt=p-jpg&qlt=95&.v=1698689812419"),
              ),
              Container(margin: const EdgeInsets.only(left: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(margin: EdgeInsets.only(bottom: 0.5), child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: main,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                                child: Text("초보 개발자", style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w600),),)),),
                          Icon(Icons.ac_unit, size: 10, color: main,)
                        ],
                      ),
                      Container(margin: EdgeInsets.only(left: 8), child: Text("김우진", style: TextStyle(color: Color(
                          0xff3f3f3f), fontFamily: "NanumRound", fontSize: 12, fontWeight: FontWeight.w800),),),
                    ],
                  )),
              Spacer(),
              StatView()
            ],),
            Container(
              margin: EdgeInsets.only(top: 10),
              child:
              Card(
                color: main,
                elevation: 0,
                shape: StadiumBorder(
                    side: BorderSide(
                      color: Color(0xffe7e7e7),
                      width: 1.0,
                    )),
                child: Container(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Container(margin: EdgeInsets.only(left: 5), child: Text("LV 15", style: TextStyle(color: Color(
                          0xffffffff), fontFamily: "NanumRound", fontSize: 10, fontWeight: FontWeight.w800),),),
                      Expanded(child: LinearPercentIndicator(
                        lineHeight: 11.0,
                        percent: 0.5,
                        animation: true,
                        animationDuration: 1000,
                        center: Text(
                          "50%",
                          style: new TextStyle(fontSize: 8.0, color: Color(
                              0xff19d3a4), fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                        ),
                        barRadius: Radius.circular(7),
                        progressColor: Colors.white,
                      ))
                    ],),),)
              ,),
          ],
        ),
      ),
    );
  }

}

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

