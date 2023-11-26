import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatView extends StatefulWidget{
  const StatView({super.key});

  @override
  State<StatefulWidget> createState() => StatState();

}

class StatState extends State<StatView>{

  List<Color> colors = [Color(0xffe87878), Color(0xffe8a94d), Color(0xff64d7a3), Color(
      0xff5aaeea)];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 6),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text("HP", style: TextStyle(color: colors[0], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),),
              Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    child: Flexible(
                        fit: FlexFit.tight,
                        child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            lineHeight: 8.0,
                            barRadius: Radius.circular(7),
                            percent: 0.5,
                            animation: true,
                            animationDuration: 1000,
                            progressColor: colors[0],
                            center: Text(
                              "10 / 20",
                              style: new TextStyle(fontSize: 6.0, color: Colors.white, fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                            )
                        )),
                  )
              ),
              Text("LV 3", style: TextStyle(color: colors[0], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),)
            ],),
          const SizedBox(height: 1),
          Row(
            children: [
              Text("MP", style: TextStyle(color: colors[1], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),),
              Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    child: Flexible(
                        fit: FlexFit.tight,
                        child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            lineHeight: 8.0,
                            barRadius: Radius.circular(7),
                            percent: 0.5,
                            animation: true,
                            animationDuration: 1000,
                            progressColor: colors[1],
                            center: Text(
                              "10 / 20",
                              style: new TextStyle(fontSize: 6.0, color: Colors.white, fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                            )
                        )),
                  )
              ),
              Text("LV 3", style: TextStyle(color: colors[1], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),)
            ],),
          const SizedBox(height: 1),
          Row(
            children: [
              Text("RP", style: TextStyle(color: colors[2], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),),
              Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    child: Flexible(
                        fit: FlexFit.tight,
                        child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            lineHeight: 8.0,
                            barRadius: Radius.circular(7),
                            percent: 0.5,
                            animation: true,
                            animationDuration: 1000,
                            progressColor: colors[2],
                            center: Text(
                              "10 / 20",
                              style: new TextStyle(fontSize: 6.0, color: Colors.white, fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                            )
                        )),
                  )
              ),
              Text("LV 3", style: TextStyle(color: colors[2], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),)
            ],),
          const SizedBox(height: 1),
          Row(
            children: [
              Text("KP", style: TextStyle(color: colors[3], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),),
              Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    child: Flexible(
                        fit: FlexFit.tight,
                        child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            lineHeight: 8.0,
                            barRadius: Radius.circular(7),
                            percent: 0.5,
                            animation: true,
                            animationDuration: 1000,
                            progressColor: colors[3],
                            center: Text(
                              "10 / 20",
                              style: new TextStyle(fontSize: 6.0, color: Colors.white, fontFamily: "NanumRound", fontWeight: FontWeight.w800),
                            )
                        )),
                  )
              ),
              Text("LV 3", style: TextStyle(color: colors[3], fontFamily: "NanumRound", fontSize: 7, fontWeight: FontWeight.w800),)
            ],),
        ],
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