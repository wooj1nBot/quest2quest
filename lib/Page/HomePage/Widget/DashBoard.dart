import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'StatWidget.dart';

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
              Flexible(
                  fit: FlexFit.tight,
                  child: StatView())
            ],),
            Container(
              margin: EdgeInsets.only(top: 11),
              child:
              Card(
                color: main,
                elevation: 0,
                shape: StadiumBorder(
                    side: BorderSide(
                      color: Color(0xffffffff),
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