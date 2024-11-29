import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/domain/model/Subject.dart';
import 'package:online_exam/presentation/Exams/Subjects/SubjectsViewModel.dart';

import 'package:online_exam/presentation/Widgets/SubjectComponent.dart';
import 'package:online_exam/presentation/utils.dart';


/*
class SubjectSearchView extends StatefulWidget {
  @override
  _SubjectSearchViewState createState() => _SubjectSearchViewState();
}

class _SubjectSearchViewState extends State<SubjectSearchView> {
  SubjectsViewModel viewModel = getIt.get<SubjectsViewModel>();
  List<Subject> subjectsView = [];
  String searchQueryView = "";
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>viewModel
    ,child: Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    titleSpacing:25,
    elevation: 0,
    title: Padding(
    padding:  EdgeInsets.only(top:25.h),
    child: Text('Survey',style: TextStyle(fontWeight:FontWeight.w500,color:primaryColor,fontSize: 20.sp),),
    )),
    body: BlocListener<SubjectsViewModel,SubjectScreenState>(
      listenWhen: (previous, current) {
        return current is LoadingState || current is ErrorState || current is SuccessState;
      },
      listener: (context, state) {
        if (state is LoadingState) {

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 16),
                    Text("Loading...")
                  ],
                ),
              );
            },
          );
        }
        if (state is ErrorState) {
          Navigator.pop(context);
          var message = extractErrorMessage(state.exception);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    Expanded(child: Text(message)),
                  ],
                ),
              );
            },
          );
        }

        if (state is SuccessState) {
          Navigator.pop(context);
          *//*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(user: state.user)),
          );*//*
        }
      },
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
      padding:  EdgeInsets.only(bottom:20.h, ),
      child: TextField(

      controller: searchController,
      decoration: InputDecoration(

      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Color(0xff535353),width: 1.w, ),borderRadius: BorderRadius.circular(20.r)),
      hintText: 'Search',
      hintStyle: TextStyle(color:Color(0xff878787),fontWeight:FontWeight.w500,fontSize: 16.sp),
      prefixIcon: Icon(Icons.search,size:27,color: Color(0xff878787)),

      ),

      onChanged: (value) {
      setState(() {
      searchQueryView = value;
      });
      },
      ),
      ),
      Text("Browse by subject",style: TextStyle(color: Color(0xff0F0F0F),fontSize:18.sp,fontWeight: FontWeight.w500)),
      SizedBox(height: 15.h,),
      SubjectComponent(searchQuery:searchQueryView,subjects:subjectsView),
      ],
      ),
      ),
      ),
    ),
    )

    );

  }

}*/







class SubjectSearchView extends StatefulWidget {
  @override
  State<SubjectSearchView> createState() => _SubjectSearchViewState();
}

class _SubjectSearchViewState extends State<SubjectSearchView> {
  SubjectsViewModel viewModel = getIt<SubjectsViewModel>();
 /* SubjectsViewModel viewModel = getIt.get<SubjectsViewModel>();*/
  String searchQueryView = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger fetching subjects
    viewModel.doIntent(FetchSubjectsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 25,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Text(
              'Survey',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: primaryColor,
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff535353),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color(0xff878787),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  prefixIcon: Icon(Icons.search, size: 27, color: Color(0xff878787)),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQueryView = value;
                  });
                },
              ),
              SizedBox(height: 15.h),
              SubjectComponent(searchQuery: searchQueryView),
            ],
          ),
        ),
      ),
    );
  }
}









/*
class SubjectSearchView extends StatefulWidget {
  @override
  _SubjectSearchViewState createState() => _SubjectSearchViewState();
}

class _SubjectSearchViewState extends State<SubjectSearchView> {
  SubjectsViewModel viewModel = getIt.get<SubjectsViewModel>();
  List<Subject> subjectsView = [];
  String searchQueryView = "";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<SubjectsViewModel, SubjectScreenState>(
        builder: (context, state) {
          if (state is SuccessState) {
            subjectsView = state.subjects ?? []; // Update subjectsView when state is successful
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              titleSpacing: 25,
              elevation: 0,
              title: Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Text(
                  'Survey',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff535353),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Color(0xff878787),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 27,
                          color: Color(0xff878787),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQueryView = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Browse by subject",
                    style: TextStyle(
                      color: Color(0xff0F0F0F),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Expanded(
                    child: SubjectComponent(
                      searchQuery: searchQueryView,
                      subjects: subjectsView,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}*/

