import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radis_rounded_button/radis_rounded_button.dart';

import 'constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, ),
                child: Align(
                  alignment: Alignment.topCenter  ,
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: txtColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft  ,
                  child: Text(
                    'Name:',
                    style: TextStyle(
                        fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: txtColor
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft  ,
                  child: Text(
                    'John Smith',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft  ,
                  child: Text(
                    'Home, City:',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: txtColor
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft  ,
                  child: Text(
                    'Los Angeles, Caifornia',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft  ,
                  child: Text(
                    'Email:',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: txtColor
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft  ,
                  child: Text(
                    'abcd1234@gmail.com',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Container(
                  // width:140.0,
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 50.0),
                  alignment: Alignment.center,
                  child: RoundedButton(
                    widget: Text('Edit Profile', style: TextStyle(fontSize: 18.0),),
                    backgroundColor: txtColor ,
                    radius: 10.0,

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));

                    },
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, ),
                child: Align(
                  alignment: Alignment.topCenter  ,
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: txtColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 30.0, right: 18.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'First Name: *',
                    labelStyle: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0, right: 18.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Last Name: *',
                    labelStyle: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0, right: 18.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email: *',
                    labelStyle: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0, right: 18.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Home, City: *',
                    labelStyle: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0, right: 18.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Secondary Email: (optional)',
                    labelStyle: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0, right: 18.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Company Name:',
                    labelStyle: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Container(
                  // width:140.0,
                  height: 50.0,
                  margin: EdgeInsets.symmetric(horizontal: 70.0),
                  alignment: Alignment.center,
                  child: RoundedButton(
                    widget: Text('Save', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                    backgroundColor: txtColor ,
                    radius: 10.0,
                    onPressed: (){
                      Navigator.pop(context);

                    },
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

