import 'package:flutter/material.dart';
import 'package:quest2quest/page/home_page.dart';
import 'package:quest2quest/page/quest_page.dart';
import 'package:quest2quest/page/routine_page.dart';
import 'package:quest2quest/page/achieve_page.dart';
import 'package:quest2quest/page/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: false,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  bool clickedCentreFAB = false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex = 0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
      controller!.animateTo(selectedIndex);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [HomeApp(), QuestApp(), RoutineApp(), MenuApp()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Color(0xff47d9ba),
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: const Icon(Icons.add)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
                  onPressed: (){
                    updateTabSelection(0, "ㅇㅇㅇㅇ");
                  },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_rounded,
                      color: selectedIndex == 0
                      ? Colors.black87
                        : Colors.grey.shade400,
                      size: 25,
                    ),
                    Text(
                      '홈',
                      style: TextStyle(
                        color: selectedIndex == 0
                            ? Colors.black87
                            : Colors.grey.shade400,
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: selectedIndex == 0
                          ? FontWeight.w600 : FontWeight.w600
                      ),
                    ),
                  ],
                ),
                label: const Text(
                  '', //'Label',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: (){
                  updateTabSelection(1, "ㅇㅇㅇㅇ");
                },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rule_rounded,
                      color: selectedIndex == 1
                          ? Colors.black87
                          : Colors.grey.shade400,
                      size: 25,
                    ),
                    Text(
                      '퀘스트',
                      style: TextStyle(
                          color: selectedIndex == 1
                              ? Colors.black87
                              : Colors.grey.shade400,
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: selectedIndex == 1
                              ? FontWeight.w600 : FontWeight.w600
                      ),
                    ),
                  ],
                ),
                label: const Text(
                  '', //'Label',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              TextButton.icon(
                onPressed: (){
                  updateTabSelection(2, "ㅇㅇㅇㅇ");
                },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event_note_outlined,
                      color: selectedIndex == 2
                          ? Colors.black87
                          : Colors.grey.shade400,
                      size: 25,
                    ),
                    Text(
                      '루틴',
                      style: TextStyle(
                          color: selectedIndex == 2
                              ? Colors.black87
                              : Colors.grey.shade400,
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: selectedIndex == 2
                              ? FontWeight.w600 : FontWeight.w600
                      ),
                    ),
                  ],
                ),
                label: const Text(
                  '', //'Label',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: (){
                  updateTabSelection(3, "ㅇㅇㅇㅇ");
                },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_rounded,
                      color: selectedIndex == 3
                          ? Colors.black87
                          : Colors.grey.shade400,
                      size: 25,
                    ),
                    Text(
                      '전체',
                      style: TextStyle(
                          color: selectedIndex == 3
                              ? Colors.black87
                              : Colors.grey.shade400,
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: selectedIndex == 3
                              ? FontWeight.w600 : FontWeight.w600
                      ),
                    ),
                  ],
                ),
                label: const Text(
                  '', //'Label',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
