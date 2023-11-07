import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import '../../boggler/View/home_page.dart';
import '../../utils/app_colors.dart';
import '../../utils/mysize.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../Home Screen/lets_start/lets_go.dart';
import '../hive_database/create_project.dart';


class CreateProjectScreen extends StatefulWidget {
 final  int ? typeid;
 CreateProjectScreen({required this.typeid});
  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {


  TextEditingController projectControler = TextEditingController();

  TextEditingController descriptionControler = TextEditingController();
   String projectBoxName = 'projects';
  late Box<Project> box; // Declare the box variable


  Future<void> openHiveBox() async {
    box = await Hive.openBox<Project>('projects');
  }

  @override
  void initState() {
    super.initState();
    box = Hive.box<Project>(projectBoxName); // Initialize the box variable
    openHiveBox();

  }
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('length of type id is ${widget.typeid}');
    MySize().init(context);
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'New Session',
          style: TextStyle(
            fontFamily: 'RobotoMono-Bold',
            fontSize: MySize.size20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, AppColors.lightgreen.withOpacity(0.50)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView( // Wrap the content with SingleChildScrollView
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MySize.size20),
                  Text(
                    'Session Title',
                    style: TextStyle(
                      fontFamily: 'RobotoMono-Bold',
                      fontSize: MySize.size18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: MySize.size20),
                  SizedBox(
                    // height: 50.h,
                    child: textField(
                      hintText: "Note Title",
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      isprefixImage: false,
                      controller: projectControler,
                      onChanged: (){},
                      borderRadius: MySize.size40,
                      bordercolor: AppColors.white,
                      filled: true,
                      enableborder: true,
                      isPrefixIcon: true,
                      prefixicon: Icons.mail,
                      fillcolor: Colors.white,
                      suffix: true,
                      validator: (String? input) {
                        if (input!.isEmpty) {
                          return 'Enter your Task';
                        }
                        if (input.length < 4) {
                          return 'Enter your name 4+ character long';
                        }
                        return null;
                      },
                      ontap: (){},
                    ),
                  ),


                  // SizedBox(height: MySize.size20),
                  // SizedBox(
                  //   // height: 50.h,
                  //   child: textField(
                  //     hintText: "Description",
                  //     fontSize: MySize.size14,
                  //     maxLines: 6,
                  //     fontWeight: FontWeight.w400,
                  //     isprefixImage: false,
                  //     controller: descriptionControler,
                  //     borderRadius: MySize.size20,
                  //     bordercolor: AppColors.white,
                  //     filled: true,
                  //     onChanged: (){},
                  //     enableborder: true,
                  //     isPrefixIcon: true,
                  //     prefixicon: Icons.mail,
                  //     fillcolor: Colors.white,
                  //     suffix: true,
                  //     validator: (String? input) {
                  //       if (input!.isEmpty) {
                  //         return 'Enter your Note';
                  //       }
                  //       if (input.length < 4) {
                  //         return 'Enter your name 4+ character long';
                  //       }
                  //       return null;
                  //     },
                  //     ontap: (){},
                  //   ),
                  // ),


                  SizedBox(height: MySize.size20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton:Padding(
        padding: EdgeInsets.only(right: 100,),
        child: customButton(text: "Add Session",fontColor: Colors.white,ontap: (){
    if (formkey.currentState!.validate()) {
      Get.to(() =>
      HomePage(title: projectControler.text,)
          // LetsGoScreen(projectControler.text, descriptionControler.text, true,
          //     widget.typeid!)
      );
        } }),
      ),

      // GestureDetector(
      //   onTap: () async {
      //     if (formkey.currentState!.validate()) {
      //       Get.to(() => LetsGoScreen(projectControler.text,descriptionControler.text,true,widget.typeid!));
      //     }
      //
      //     //   saveData();
      // //     final projectText = projectControler.text;
      // //     final titleText = titleControler.text;
      // //     final descriptionText = descriptionControler.text;
      // //
      // //     // Create a new Project object with the data
      // //     final newProject = Project(
      // //       projectName: projectText,
      // //       title: titleText,
      // //       description: descriptionText,
      // //      // totalSeconds: seconds,
      // //     );
      // //
      // //     // Save the project to the Hive database
      // //   ///  final key = await box.add(newProject);
      // //
      // //     // Clear the text fields after saving
      // //     projectControler.clear();
      // //     titleControler.clear();
      // //     descriptionControler.clear();
      // //    Global.projectKey = key.toString();
      // //
      // // //    Fetch the project from the box using the key
      // //    final savedProject = box.get(key);
      // //
      // //   //  Now you can access the data from the savedProject object
      // //     if (savedProject != null) {
      // //       print('data is ${savedProject.title}');
      // //     }
      // //     print("projec key is${ Global.projectKey}");
      // //   //  Get.to(() => AnotherScreen(projectKey:key ));
      // //
      //
      //   },
      //   child: Container(
      //     height: MySize.size50,
      //   width: MySize.size200,
      //   margin: EdgeInsets.only(right:80,bottom: 10 ),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(40.r),
      //       gradient: LinearGradient(
      //         colors: [
      //           Colors.blue,
      //           AppColors.lightgreen
      //         ],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //     child: Center(
      //       child: Text(
      //         'Add Task',
      //         style: TextStyle(
      //           fontFamily: 'RobotoMono-Bold',
      //           fontSize: MySize.size17,
      //           fontWeight: FontWeight.w500,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );

  }

}
