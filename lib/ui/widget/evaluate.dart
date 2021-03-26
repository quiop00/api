import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';

class EvaluateWidget extends StatefulWidget{
  final Tutor tutor;
  EvaluateWidget({this.tutor});
  @override
  State<StatefulWidget> createState() {
    return _EvaluateWidget(tutor: tutor);
  }
}
class _EvaluateWidget extends State<EvaluateWidget>{
  final Tutor tutor;
  _EvaluateWidget({this.tutor});
  TextEditingController commentTextEditController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width-60,
                    child: TextField(
                      controller: commentTextEditController,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){
                        // code comment here
                      },
                    ),
                  )
                ],
              ),
          ),
          Expanded(
            child: Container(
              height: 400,
              child: ListView.builder(
                itemBuilder: (context,index)=>_comment(index),
                itemCount: tutor.comments.length,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _comment(int index)=>
      Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                  child: Row(
                    children: [
                      Icon(Icons.account_circle),
                      Text(tutor.comments[index].user)
                    ],
                  ),
                  alignment: Alignment.topLeft,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("12/3/2021"),
              ),
              Text(tutor.comments[index].content)
            ],
          ),
        ),
      );
}