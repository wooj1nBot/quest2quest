import 'package:flutter/material.dart';

class MakeQuestScreen extends StatelessWidget {
  const MakeQuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black12.withOpacity(0.65),
        body: GestureDetector(
          onTap: (){

          },
          child: Hero(
            tag: "1232d",
            child: QuestForm(),
          ),
        ))
    );
  }
}



class QuestForm extends StatelessWidget{
  const QuestForm({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        height: 450,
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Container(

          ),
        ),
      ),
    );
  }

}


