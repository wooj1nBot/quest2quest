import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DashBoard.dart';

class AppBarWidget extends StatefulWidget{
  const AppBarWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppBarState();
  }
}

class AppBarState extends State<AppBarWidget>{

  @override
  Widget build(BuildContext context) {

    Color main = const Color(0xff47d9ba);
    double height = MediaQuery.of(context).size.height;
    bool isExpanded = true;

    // TODO: implement build
    return SliverAppBar(
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
                                icon: Icon(Icons.notifications_rounded, color: Color(0xFFFFFFFF), size: 18,),),),

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
                        ? const DashBoard()
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
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

}