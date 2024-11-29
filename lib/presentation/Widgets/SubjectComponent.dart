import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/domain/model/Subject.dart';
import 'package:online_exam/presentation/Exams/Subjects/SubjectsViewModel.dart';
import 'package:online_exam/presentation/utils.dart';



/*
class SubjectComponent extends StatelessWidget {
  final String searchQuery;
  final List<Subject> subjects;
  const SubjectComponent({Key? key, required this.searchQuery, required this.subjects}) : super(key: key);


  List<Subject> get searchInSubjects {
    if (searchQuery.isEmpty) {
      return subjects;
    } else {
      return subjects.where((subject) {
        final title = subject.title.toLowerCase();
        return title.contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(

        separatorBuilder: (context, index) => SizedBox(height:16.h),
        itemCount: searchInSubjects.length,
        itemBuilder: (context, index) {
          final subject = searchInSubjects[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllExamsScreen(subject: subject),
                ),
              );
            },
            child: Container(
              height: 80.h,
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
                  leading: Image.network((subject.imageUrl), width: 50, height: 50),
                  title: Text(subject.title,style: TextStyle(color: Color(0xff000000),fontSize:16.sp,fontWeight: FontWeight.w400)),





  subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: subject.questions.map((question) {
                                  return Text(
                                      "${question.questionText} - ${question.examTime}");
                                }).toList(),
                              ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


*/










/*


class SubjectComponent extends StatelessWidget {
  final String searchQuery;
  final List<Subject> subjects;

  const SubjectComponent({Key? key, required this.searchQuery, required this.subjects}) : super(key: key);

  List<Subject> searchInSubjects(List<Subject> subjects) {
    if (searchQuery.isEmpty) {
      return subjects;
    } else {
      return subjects.where((subject) {
        final title = subject.name!.toLowerCase();
        return title.contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsViewModel, SubjectScreenState>(
      builder: (context, state) {
        List<Subject> subjects = [];

        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          subjects = searchInSubjects(state.subjects ?? []);
        } else if (state is ErrorState) {
          return Center(child: Text('Error: ${extractErrorMessage(state.exception)}'));
        }

        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return InkWell(
                onTap: () {
                */
/*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllExamsScreen(subject: subject),
                    ),
                  );*//*

                },
                child: Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff2A292940),
                        spreadRadius: 0,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Image.network(subject.icon, width: 50, height: 50),
                      title: Text(
                        subject.name,
                        style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
*/






class SubjectComponent extends StatelessWidget {
  final String searchQuery;

  const SubjectComponent({Key? key, required this.searchQuery}) : super(key: key);

  List<Subject> searchInSubjects(List<Subject> subjects) {
    if (searchQuery.isEmpty) {
      return subjects;
    } else {
      return subjects.where((subject) {
        final title = subject.name!.toLowerCase();
        return title.contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsViewModel, SubjectScreenState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ErrorState) {
          return Center(child: Text('Error: ${extractErrorMessage(state.exception)}'));
        } else if (state is SuccessState) {
          // Filter the subjects based on the search query
          final filteredSubjects = searchInSubjects(state.subjects ?? []);

          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: filteredSubjects.length,
              itemBuilder: (context, index) {
                final subject = filteredSubjects[index];
                return InkWell(
                  onTap: () {
                    // Implement navigation or action on tap if needed
                  },
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Color(0xffF9F9F9),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff2A292940),
                          spreadRadius: 0,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Image.network(subject?.icon??"", width: 50, height: 50),
                        title: Text(
                          subject?.name??"No Name",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox.shrink(); // Return empty widget if state is InitialState
      },
    );
  }
}









/*
class SubjectComponent extends StatelessWidget {
  final String searchQuery;
  final List<Subject> subjects;

  const SubjectComponent({
    Key? key,
    required this.searchQuery,
    required this.subjects,
  }) : super(key: key);

  List<Subject> searchInSubjects(List<Subject> subjectsList) {
    if (searchQuery.isEmpty) {
      return subjectsList;
    } else {
      return subjectsList.where((subject) {
        final title = subject.name!.toLowerCase();
        return title.contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsViewModel, SubjectScreenState>(
      builder: (context, state) {
        List<Subject> filteredSubjects = [];

        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          filteredSubjects = searchInSubjects(state.subjects ?? []);
        } else if (state is ErrorState) {
          return Center(child: Text('Error: ${state.exception?.toString()}'));
        }

        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: filteredSubjects.length,
          itemBuilder: (context, index) {
            final subject = filteredSubjects[index];
            return InkWell(
              *//* onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllExamsScreen(subject: subject),
                  ),
                );
              }, *//*
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff2A292940),
                      spreadRadius: 0,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: Image.network(subject.icon, width: 50, height: 50),
                    title: Text(
                      subject.name,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}*/

