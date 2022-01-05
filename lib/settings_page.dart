import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radis_rounded_button/radis_rounded_button.dart';
import 'package:travel_dates/constants.dart';
import 'package:travel_dates/delete_account.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {



  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: new Text("Sign Out"),
          content: new Text("Do you want to sign out from Travel Dates?"),
          actions: <Widget>[

            new TextButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 45.0),
              // width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/images/settingimage.png", height: 100.0,),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/images/plan_icon.png")
                    ),
                  ),

                ],
              ),

            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      width:140.0,
                      height: 50.0,
                      alignment: Alignment.center,
                      child: RoundedButton(
                        widget: Text('Delete Account'),
                        backgroundColor: txtColor,
                        radius: 25.0,

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteAccount()));
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 140.0,
                      height: 50.0,
                      child: Center(
                        child: RoundedButton(
                          widget: Text('Sign out'),
                          backgroundColor: txtColor,
                          radius: 25.0,

                          onPressed: (){
                            _showDialog(context);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            )
          ],
        )
    );
  }
}
