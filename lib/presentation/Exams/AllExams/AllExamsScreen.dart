import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/presentation/dummy.dart';


class AllExamsScreen extends StatelessWidget {
  final Subject subject;

  const AllExamsScreen({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios,color: primaryColor,)),
        elevation: 0,
        title: Text(subject.title,style: TextStyle(fontWeight:FontWeight.w500,color:primaryColor,fontSize: 20.sp),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height:16.h),
                itemCount: subject.questions.length,
                itemBuilder: (context, index) {
                  final question = subject.questions[index];
                  return Container(
                    height: 103.h,
                    decoration: BoxDecoration(

                      color: Color(0xffF9F9F9),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)), //border corner radius
                      boxShadow:[
                        BoxShadow(
                          color: Color(0xff2A292940), //color of shadow

                          spreadRadius:0, //spread radius
                          blurRadius:8, // blur radius

                        ),

                      ],
                    ),
                    child: Center(
                      child: ListTile(

                        leading: Image.network((subject.imageUrl)),
                        title: Padding(
                          padding: EdgeInsets.only(top:10.h),
                          child: Row(
                            children: [
                              Text(question.questionText),
                              Spacer(),
                              Text("${question.examTime}",style:TextStyle(color:primaryColor,fontWeight:FontWeight.w400,fontSize: 13.sp),),
                            ],

                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.h,),
                            Text('20 Question',style:TextStyle(color:Color(0xff535353),fontWeight:FontWeight.w400,fontSize: 13.sp),),
                            SizedBox(height: 15.h,),
                            Row(children: [
                              Text.rich(TextSpan(children: [
                                TextSpan( text: 'From:',style:TextStyle(color:Color(0xff535353),fontWeight:FontWeight.w400,fontSize: 13.sp),),
                                TextSpan( text: '6.00',style:TextStyle(color:Color(0xff535353),fontWeight:FontWeight.w500,fontSize: 13.sp),)

                              ],
                              )

                                ),
                              SizedBox(width: 5.w,),
                              Text.rich(TextSpan(children: [
                                TextSpan( text: 'To:',style:TextStyle(color:Color(0xff535353),fontWeight:FontWeight.w400,fontSize: 13.sp),),
                                TextSpan( text: '8.00',style:TextStyle(color:Color(0xff535353),fontWeight:FontWeight.w500,fontSize: 13.sp),)

                              ],
                              )

                              ),

                            ],)
                          ],
                        ),

                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
