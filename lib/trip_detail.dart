import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({Key? key}) : super(key: key);

  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                      child: Image.asset("assets/colored_image.png", height: 80.0,),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child:  ListView(
                  physics: ClampingScrollPhysics(),
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20.0, ),
                      child: Text(
                        'Loss Angeles to Paris',
                          style: TextStyle(
                              color: txtColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, ),
                      child: Text(
                          'FRI, 03 Dec 2021- TUE,04 DEC 2021',
                          style: TextStyle(
                              color: iconActiveClr,
                              fontSize: 14,
                              )
                      ),
                    )
                  ],
              ),
            )
          ],
        )
    );
  }
}
