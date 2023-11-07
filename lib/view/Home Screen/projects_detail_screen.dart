// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:seven_min_track/view/hive_database/recording_model.dart';
// import '../../utils/app_colors.dart';
// import '../hive_database/existing_data.dart';
//
// class ProjectDetail extends StatefulWidget {
//
//   final YourModel model;
//   ProjectDetail({required this.model});
//
//   @override
//   State<ProjectDetail> createState() => _ProjectDetailState();
// }
//
// class _ProjectDetailState extends State<ProjectDetail> {
//
//   bool _isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: AppColors.blue,
//           elevation: 1,
//           title: Text("title")
//
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [AppColors.blue, AppColors.lightgreen],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child:ListView.builder(
//           itemCount: 3, // Use the length of the model list
//           itemBuilder: (context, index) {
//             final modelItem = widget.model[index]; // Get the model item at the current index
//
//             return Container(
//               margin: const EdgeInsets.all(8.0),
//               child: Theme(
//                 data: Theme.of(context).copyWith(
//                   dividerColor: Colors.transparent, // Set divider color to transparent
//                 ),
//                 child: ExpansionTile(
//                   childrenPadding: EdgeInsets.symmetric(horizontal: 20),
//                   onExpansionChanged: (expanded) {
//                     setState(() {
//                       _isExpanded = !expanded;
//                     });
//                   },
//                   iconColor: Colors.white,
//                   trailing: Icon(
//                     _isExpanded ? Icons.expand_less : Icons.expand_more,
//                     color: Colors.white,
//                   ),
//                   title: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         '${DateFormat('d-MMM-yyyy').format(modelItem.bogglingTimeAndData)}',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   collapsedTextColor: Colors.white,
//                   children: [
//                     Column(
//                       children: [
//                         ListTile(
//                           title: Text(
//                             'Session ID: ${modelItem.sessionId}',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                           subtitle: Text(
//                             'Voice Text: ${modelItem.voiceText}',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../hive_database/recording_model.dart';
class ProjectDetail extends StatefulWidget {
  final YourModel model;

  ProjectDetail({required this.model});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Detail'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const[AppColors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            // ExpansionTile(
            //   title: Text('Session ID: ${widget.model.sessionId}'),
            //   children: <Widget>[
            //
            //   ],
            // ),
            // Text('${widget.model.bogglingTimeAndData}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 24),),
            // ExpansionTile(
            //   title: Text('Boggling Time: ${widget.model.bogglingTimeAndData}'),
            //   children: <Widget>[
            //
            //   ],
            // ),
            // ExpansionTile(
            //   title: Text('Voice Text: ${model.voiceText}'),
            //   children: <Widget>[
            //
            //   ],
            // ),
           Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent, // Set divider color to transparent
                ),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded = !expanded;
                    });
                  },
                  iconColor: Colors.white,
                  trailing: Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        'Voice Text',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  collapsedTextColor: Colors.white,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            '${widget.model.voiceText}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // Set divider color to transparent
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = !expanded;
                  });
                },
                iconColor: Colors.white,
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      'Summary',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                collapsedTextColor: Colors.white,
                children: [
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${widget.model.summary}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal:12 ),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(12)
            // ),
            //   child: ExpansionTile(
            //     backgroundColor: Colors.white,
            //     title: ListTile(
            //       tileColor: Colors.white,
            //       title: Text('Summary'),
            //     ),
            //     children: <Widget>[
            //
            //     ],
            //   ),
            // ),

            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // Set divider color to transparent
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = !expanded;
                  });
                },
                iconColor: Colors.white,
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      'Next Step',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                collapsedTextColor: Colors.white,
                children: [
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${widget.model.nextStep}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // Set divider color to transparent
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = !expanded;
                  });
                },
                iconColor: Colors.white,
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      'Recommandations',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                collapsedTextColor: Colors.white,
                children: [
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${widget.model.recommendations}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // Set divider color to transparent
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = !expanded;
                  });
                },
                iconColor: Colors.white,
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      'Suggestions',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                collapsedTextColor: Colors.white,
                children: [
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${widget.model.suggestions}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
