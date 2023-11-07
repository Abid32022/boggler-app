import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seven_min_track/boggler/View/second_screen.dart';
import '../Provider/home_provider.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  String title;

   HomePage({required this.title});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // String finalText = '';
  // double threshold = 1000.0;

  // List<String> recognition = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return GestureDetector(
            onTap: () {
              if (homeProvider.timer == null) {
                homeProvider.openBottomSheet(context: context);
              } else {
                if(homeProvider.timer!.isActive){
                  homeProvider.openBottomSheet(context: context);
                  // homeProvider.stopSpeech();
                }else{
                  homeProvider.openBottomSheet(context: context);
                  // homeProvider.startTimer(context: context);
                }
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.4,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue),
              child:
              Center(child: homeProvider.timer != null ?
              homeProvider.timer!.isActive ?
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.stop_circle,color: Colors.red,),SizedBox(width: 10,),Text( "Stop Record" )],) :
              const Row(children: [Icon(Icons.play_circle,color: Colors.red,),SizedBox(width: 10,),Text( "Start Record" )],):
              const Row(children: [Icon(Icons.play_circle,color: Colors.red,),SizedBox(width: 10,),Text( "Start Record" )],)),
            ));
      },),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Center(
                  child: Text.rich(TextSpan(
                      text: "boggler",
                      style: TextStyle(
                          color: headColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                      children: [
                        TextSpan(
                            text: " assist",
                            style: TextStyle(color: headColor1)),
                      ])),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 20, left: 20, right: 5),
                  width: MediaQuery.of(context).size.width,
                  color: headColor1,
                  child: Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/scientist.png",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        horizontalTitleGap: 10,
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          "Sam Stanton",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.folder,
                              color: Colors.blue, size: 34),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            "Assists",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "...ask boggler",
                              style: TextStyle(color: paraColor, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                        height: 430,
                        child: SingleChildScrollView(
                          child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
                            return ListView.builder(
                                shrinkWrap: true,
                                controller: homeProvider.scrollController,
                                // Attach the ScrollController here
                                physics: const BouncingScrollPhysics(),
                                itemCount: homeProvider.speechModel.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return
                                          SecondScreen(dateTime:homeProvider.speechModel[index].timeDuration
                                              .toString() ,
                                            voiceMessage: homeProvider.speechModel[index].heading,);
                                      }));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 1,
                                      // decoration: ,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(homeProvider.speechModel[index].heading),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(getHumanReadableDateTime(
                                                  now: homeProvider.speechModel[index].date)),
                                              Text(homeProvider.speechModel[index].timeDuration
                                                  .toString()),
                                            ],
                                          ),
                                          Container(
                                            height: 2,
                                            width: double.infinity,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getHumanReadableDateTime({required var now}) {
    String formattedDateTime = DateFormat('MMMM d,  hh:mm ').format(now);
    return formattedDateTime;
  }

}
