import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../utils/colors.dart';

class SecondScreen extends StatefulWidget {
  String dateTime;
  String voiceMessage;

  SecondScreen({super.key, required this.dateTime, required this.voiceMessage});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int isSelected = 0;

  List data = ["Notes", "Next steps", "Recape email", "Transcript", "summery",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
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
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[300],
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.arrow_back_ios),
                        GestureDetector(
                            onTap: (){

                            },
                            child: Text("Back"))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 370,
                  margin: const EdgeInsets.only(bottom: 200),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(widget.dateTime ?? ""),
                            const Spacer(),
                            const Text(
                              "TRAIN",
                              style: TextStyle(color: headColor1),
                            ),
                            const Icon(
                              Icons.lightbulb_outline,
                              color: headColor1,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text(widget.voiceMessage)),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => seeInBottom());
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "SHARE",
                                    style: TextStyle(color: headColor1),
                                  ),
                                  Icon(
                                    Icons.ios_share_outlined,
                                    color: headColor1,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Text(data[index]),
                                  ),
                                ),
                              );
                            }),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: summeryColor,
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "SUMMERY",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Spacer(),
                              Icon(
                                Icons.thumb_up_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Good",
                                style: TextStyle(color: Colors.white, fontSize: 11),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.thumb_down_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text("Bad",
                                  style: TextStyle(color: Colors.white, fontSize: 11)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "dhasjfhjkasdhfjkhjkasdhfjkhsjkadhfjk sdjkfhjksd hjkf hajksd hfjkhsd jkfh jksdh fkjsdh jkf hjksdh jkfh sdjkfh jkasdh fjkhs djkfh sjkd h"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget seeInBottom() => StatefulBuilder(builder: (BuildContext context,
      StateSetter setState){
    return AlertDialog(
      title: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = index;
                  });
                },
                child: Text(
                  data[index],
                  style: TextStyle(
                      color:
                      isSelected == index ? headColor1 : Colors.black),
                ));
          }),
      actions: [
        TextButton(
            onPressed: () {
              Share.share(data[isSelected]);
            },
            child: const Text("Share"))
      ],
    );
  });
}