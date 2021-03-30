import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_detail_view_model.dart';
import 'package:tutor_finder_app/ui/widget/evaluate.dart';
import 'package:tutor_finder_app/ui/widget/infor.dart';
import 'package:tutor_finder_app/ui/widget/schedule.dart';

class TutorsDetail extends StatefulWidget{
  final tutor;
  TutorsDetail({this.tutor});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutorDetail(tutor: tutor);
  }
}
class _TutorDetail extends State<TutorsDetail> with SingleTickerProviderStateMixin{
  final tutor;
  _TutorDetail({this.tutor});
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết gia sư"),
        backgroundColor: Color.fromARGB(255,49,243,208),
      ),
      body: ViewModelBuilder<TutorDetailViewModel>.reactive(
        builder:(context,model,child)=>_TutorDetailView,
        viewModelBuilder: ()=>TutorDetailViewModel(),
        // onModelReady: (model)=>
        //     model.getTutorById(
        //       id: idTutor,
        //       onLoading: (){
        //       },
        //       onSuccess: (){
        //         tutor=model.tutor;
        //     }),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget get _TutorDetailView=>
      Consumer<TutorDetailViewModel>(
          builder: (context,model,child){
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.29,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.06,
                              color: Color.fromARGB(255,49,243,208),
                            ),
                          ),
                          Positioned(
                            top:5,
                            left: MediaQuery.of(context).size.width*0.15,
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(6),
                                  width: MediaQuery.of(context).size.width*0.7,
                                  height: MediaQuery.of(context).size.height*0.25,
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                      boxShadow:[
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3), //color of shadow
                                          spreadRadius: 2, //spread radius
                                          blurRadius: 2, // blur radius
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 90,
                                        margin: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(tutor.avatarPath),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                      Text(tutor.name),
                                    ],
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                              top: 28+MediaQuery.of(context).size.height*0.12,
                              left: MediaQuery.of(context).size.width*0.455,
                              child: Container(
                                width: 34,
                                height: 20,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3), //color of shadow
                                      spreadRadius: 2, //spread radius
                                      blurRadius: 2, // blur radius
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                   ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Icon(Icons.star,color: Colors.yellow,size: 12,),
                                     Text('${tutor.rating}',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                            top:MediaQuery.of(context).size.height*0.25-10,
                            left: MediaQuery.of(context).size.width*0.3,
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(6),
                                      width: MediaQuery.of(context).size.width*0.2,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color:Color.fromARGB(255,49,243,208),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Center(child: Text("Đánh giá",style: TextStyle(fontSize: 15,color: Colors.white),))
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      padding: EdgeInsets.all(6),
                                      width: MediaQuery.of(context).size.width*0.2,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color:Color.fromARGB(255,49,243,208),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Center(child: Text("Mời dạy",style: TextStyle(fontSize: 15,color: Colors.white),))
                                  ),
                                ],
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      padding: EdgeInsets.only(left: 25,right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: (MediaQuery.of(context).size.width-60)/2,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255,209,212,221),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.menu_book,size: 15,),
                                    SizedBox(width: 8,),
                                    Text('${tutor.subjects.map((e) => e.subjectName).join(", ")}',maxLines: 1,overflow: TextOverflow.ellipsis,)
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: (MediaQuery.of(context).size.width-60)/2,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255,209,212,221),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.person,size: 15,),
                                    SizedBox(width: 8,),
                                    Text('${tutor.grades.map((e) => e.nameGrade).join(", ")}',maxLines: 1,overflow: TextOverflow.ellipsis,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: (MediaQuery.of(context).size.width-60)/2,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255,209,212,221),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.monetization_on,size: 15,),
                                    SizedBox(width: 8,),
                                    Text('50000đ/h',maxLines: 1,overflow: TextOverflow.ellipsis,)
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: (MediaQuery.of(context).size.width-60)/2,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255,209,212,221),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on,size: 15,),
                                    SizedBox(width: 8,),
                                    Flexible(child: Text('${tutor.location}',maxLines: 1,overflow: TextOverflow.ellipsis,))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              children:[
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 15),
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255,49,243,208),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                    ),
                                    child: Text('Thông tin',style: TextStyle(color: Colors.white,fontSize: 20),),
                                  ),
                                ),
                              ] 
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text('${tutor.description}',style: TextStyle(fontSize: 15),maxLines: 10,),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                children:[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255,49,243,208),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                      ),
                                      child: Text('Lịch dạy',style: TextStyle(color: Colors.white,fontSize: 20),),
                                    ),
                                  ),
                                ]
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Schedule(schedules: tutor.schedule,),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                children:[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255,49,243,208),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                      ),
                                      child: Text('Đánh giá',style: TextStyle(color: Colors.white,fontSize: 20),),
                                    ),
                                  ),
                                ]
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: EvaluateWidget(tutor: tutor,),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60,)
                  ],
                ),
              ),
            );
          }
      );

}