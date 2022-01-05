import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_dates/trip_detail.dart';

import 'constants.dart';

class VerticalListClass extends StatefulWidget {
  const VerticalListClass({Key? key}) : super(key: key);

  @override
  _VerticalListClassState createState() => _VerticalListClassState();
}

class _VerticalListClassState extends State<VerticalListClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 25,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                height: 90.0,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: txtColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/images/colored_image.png", fit: BoxFit.fill, height: 90.0,))
                    ),
                    Expanded(
                      child: ListTile(
                          trailing: Text("15 Days",
                            style: TextStyle(
                                color: iconActiveClr,fontSize: 18, fontWeight: FontWeight.bold),),
                          title:Text("Loss Angeles to Paris",
                          maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        subtitle: Text('Fri, 03 Dec 2021 - Tue, 04 Dec 2022',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,fontSize: 14)),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TripDetails()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
