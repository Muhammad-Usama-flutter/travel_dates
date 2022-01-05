import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_dates/constants.dart';
import 'package:travel_dates/trip_detail.dart';

class GridListClass extends StatefulWidget {
  const GridListClass({Key? key}) : super(key: key);

  @override
  _GridListClassState createState() => _GridListClassState();
}

class _GridListClassState extends State<GridListClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1.2 / 0.8,
                crossAxisSpacing: 6,
                mainAxisSpacing: 12),
            itemCount: 12,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TripDetails()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Loss Angeless to Paris",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 12.0,
                      ),),

                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text("Fri, 03 Dec 2021 - Tue, 04 Dec 2022",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.0,
                          ),),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: txtColor,
                      borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   image: AssetImage("assets/images/download.jpg"),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
