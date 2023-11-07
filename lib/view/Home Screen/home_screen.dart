import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:seven_min_track/utils/mysize.dart';
import 'package:seven_min_track/view/hive_database/recording_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';
import '../create_new_project/Add data.dart';
import 'edit_profile.dart';
import 'projects_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late Box<YourModel> box;

  Stream<List<YourModel>> _getProjectsStream() async* {
    final box = await Hive.openBox<YourModel>('record');
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    box = Hive.box<YourModel>('record');

  }
  Future<void> deleteAllItems() async {
    final box = await Hive.openBox<YourModel>('record'); // Open the Hive box
    await box.clear(); // Clears all items from the box
    setState(() {
    });
  }
  Future<void> deleteAllItemsDialogue() async {
    final box = await Hive.openBox<YourModel>('record'); // Open the Hive box

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete All Sessions'),
          content: Text('Do you want to delete all sessions?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete All'),
              onPressed: () async {
                await box.clear(); // Clears all items from the box
                Navigator.of(context).pop(); // Close the dialog
                setState(() {
                  // Perform any additional actions after clearing the box
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    final List<YourModel> projects = box.values.toList();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const[AppColors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:Column(
          children: [
            SizedBox(height: MySize.scaleFactorHeight*55,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      GestureDetector(
                        onTap: (){
                          // Get.to(()=>OnboardingScreen());
                        },
                        child: Row(
                          children: [
                            Text('Hello,',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 24.h),),
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                final nameBox = Hive.box<String>('nameBox'); // Access the Hive box
                                final retrievedName = nameBox.get('nameKey') ??  ""; // Use a default value if the retrieved name is null

                                return Center(
                                  child: Opacity(
                                    opacity: _animation.value,
                                    child: customTextRegular(
                                      title: retrievedName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.h,
                                      color: AppColors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MySize.size5,),

                    ],
                  ),

                  GestureDetector(
                    onTap: (){
                      Get.to(()=>EditProfile());
                    },
                    child: Icon(Icons.edit,color: Colors.white,size: 20,),
                  ),
                ],
              ),
            ),

            SizedBox(height: MySize.size12,),

        //
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     GestureDetector(
        //         onTap: ()async{
        //           deleteAllItemsDialogue();
        //       print('deleted');
        //         },
        //         child: Text("Delete All",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.red,decoration: TextDecoration.underline),)),
        //
        //     Icon(Icons.delete_forever,color: Colors.red,)
        //   ],
        // ),

            SizedBox(height: MySize.size20,),
        Expanded(
          child: GridView.builder(
            itemCount: projects.length,
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 124,
              crossAxisSpacing: 20,
              childAspectRatio: 6 / 4,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              final dateTime = project.bogglingTimeAndData; // Replace with your DateTime object

              final formattedTime = DateFormat.jm().format(dateTime); // 'jm' stands for time pattern


              return GestureDetector(
                onTap: () async {

                  Get.to(()=> ProjectDetail(model: projects[index],));

                },
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1, end: 1.05).animate(
                    CurvedAnimation(
                      parent: AlwaysStoppedAnimation(1),
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    width: MySize.scaleFactorWidth*178,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.50),
                      border: Border.all(color: Colors.black.withOpacity(0.25),width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: MySize.size30,
                              width: MySize.size140,
                              child: customTextRegular(
                                maxlines: 1,
                                latterSpacing: 1,
                                title:  project.title,
                                fontWeight: FontWeight.w600,
                                fontSize: MySize.size18,
                                color: Colors.black,

                              ),
                            ),
                            Spacer(),

                            SizedBox(width: MySize.size10),

                            GestureDetector(
                                onTap: ()async{
                                  await _showDeleteDialog(context, index);
                                },
                                child: Icon(Icons.delete,color: Colors.red,size: MySize.size20,))
                          ],
                        ),

                        SizedBox(
                          // color: Colors.red,
                          height: MySize.size60,
                          child: customTextRegular(
                            title: project.voiceText,
                            fontWeight: FontWeight.w300,
                            latterSpacing: 1.3,
                            fontSize: MySize.size14,
                            overflow: TextOverflow.ellipsis,
                            maxlines: 4,
                            color: Colors.black.withOpacity(0.70),
                            //letterSpacing: 0.4,
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // customTextRegular(
                            //   title: "Time spent",
                            //   fontWeight: FontWeight.w400,
                            //   fontSize: MySize.size14,
                            //   color: Colors.black,
                            //   //   letterSpacing: 0.4,
                            // ),
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:'${DateFormat('d-MMM-yyyy').format(project.bogglingTimeAndData)}',
//
                                        style: TextStyle(fontSize: MySize.size14,fontWeight: FontWeight.w500,color: AppColors.blackColor)
                                    ),
                                    WidgetSpan(child: SizedBox(width: 10,)),
                                    TextSpan(

                                        text: '${formattedTime}',
                                        style: TextStyle(fontSize: MySize.size14,fontWeight: FontWeight.w500,color: AppColors.blackColor)

                                    ),

                                  ]
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
          ],
        ),
      ),

      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.25),
                blurRadius: 8,
                spreadRadius: 0,
                offset: Offset(2,2),
              ),
            ]
        ),
        // padding: const EdgeInsets.only(bottom: 30,right: 4),
        child: GestureDetector(
          onTap: (){
            // Get.to(()=>CreateProjectScreen(typeid: projects.length+1,));
            Get.to(()=>CreateProjectScreen(typeid: projects.length == 0 ? projects.length : projects.length,));
          },
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: MySize.size30,
              child: Icon(Icons.add,color: Colors.blue,size: MySize.size30,)),
        ),
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                // Delete the item from Hive using the index
                final box = await Hive.openBox<YourModel>('record');
                box.deleteAt(index);

                Navigator.of(context).pop(); // Close the dialog
                setState(() {
                  // Update the UI to reflect the deleted item
                });
              },
            ),
          ],
        );
      },
    );
  }
}
