import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
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
                    child: Column(
                      children: [
                        Image.asset("assets/images/travel_image.png",),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset("assets/images/docs_image.png",),
                        )
                      ],
                    ),
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
              child:  Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemBuilder:(BuildContext context, int index){
                      return Card(
                        elevation: 6,
                        /*shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150),
                        ),*/
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: Container(
                          height: 70.0,
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            /*leading: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Icon(
                                Icons.forward_to_inbox,
                                color: txtColor,
                                size: 38.0,
                              ),
                            ),*/
                            title:Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Document Something Name "+index.toString(),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,fontSize: 18),),
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                      );
                    }
                ),
              ),
            )
          ],
        )
    );
  }
}
