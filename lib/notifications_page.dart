import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radis_rounded_button/radis_rounded_button.dart';

import 'constants.dart';
import 'delete_account.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/images/alert_image.png", height: 80.0,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/images/plan_icon.png", height: 80.0,)
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child:  ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemBuilder:(BuildContext context, int index){
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: Container(
                        height: 90.0,
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.forward_to_inbox,
                              color: txtColor,
                              size: 38.0,
                            ),
                          ),
                          title:Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: Text("Lorem Ipsum is simply dummy text of the printing and type setting industry.",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                        color: Colors.black,fontSize: 14),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:4.0, right: 20.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("12:00 PM",
                                    style: TextStyle(
                                        color: Colors.black54,fontSize: 12),),
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        )
    );
  }
}
