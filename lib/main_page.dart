import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_dates/GridListClass.dart';
import 'package:travel_dates/notifications_page.dart';
import 'package:travel_dates/profile_page.dart';
import 'package:travel_dates/settings_page.dart';
import 'package:travel_dates/verticalListClass.dart';
import 'MapClass.dart';
import 'constants.dart';
import 'documents_pages.dart';

BuildContext? ctx;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _fragments = <Widget>[
    NotificationsPage(),
    Settings(),
    LocationPage(),
    DocumentPage(),
    ProfilePage()
  ];




  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      body: SafeArea(
        child: Center(
           child: _fragments.elementAt(_selectedIndex), //New

        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(color: iconActiveClr, size: 30),
        selectedItemColor: iconActiveClr,
        unselectedIconTheme: IconThemeData(
          color: iconInActiveClr,
        ),
        unselectedItemColor: iconInActiveClr,
        showSelectedLabels: true,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/notification.png", color: _selectedIndex == 0 ? iconActiveClr : Colors.white, height: 25.0,),
            label: "Notifications",
            backgroundColor: txtColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/setting.png", color: _selectedIndex == 1 ? iconActiveClr : Colors.white,height: 25.0,),
              label: "Setting",
            backgroundColor: txtColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/location.png", color: _selectedIndex == 2 ? iconActiveClr : Colors.white,height: 25.0,),
              label: "Tours",
            backgroundColor: txtColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/docs.png", color: _selectedIndex == 3 ? iconActiveClr : Colors.white,height: 25.0,),
              label: "Documents",
            backgroundColor: txtColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/person.png", color: _selectedIndex == 4 ? iconActiveClr : Colors.white,height: 25.0,),
              label: "Profile",
            backgroundColor: txtColor,
          ),
        ],
      ),
    );
  }

}

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int _selectedTabPage = 1;

  static List<Widget> _tabBarFragments = <Widget>[
    TabMapPage(),
    GridListClass(),
    VerticalListClass(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                  // width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/images/trip_image.png"),
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
                Container(
                  color: txtColor,
                  margin: EdgeInsets.only(top: 14.0),
                  height: 35.0,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15.0),
                                  height: 17.0,
                                  width: 17.0,
                                  color: iconActiveClr,
                                  child: Checkbox(
                                      value: isUpComing,
                                      checkColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          isUpComing = value!;
                                        });
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Upcoming", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15.0),
                                  color: Colors.grey,
                                  height: 17.0,
                                  width: 17.0,
                                  child: Checkbox(
                                      value: isPast,
                                      checkColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          isPast = value!;
                                        });
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Past", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedTabPage = 0;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.location_on_sharp,
                                  color: _selectedTabPage ==0 ? iconActiveClr : Colors.white,
                                  size: 24.0,
                           ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedTabPage = 1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.apps,
                                  color: _selectedTabPage ==1 ? iconActiveClr : Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedTabPage = 2;
                                });
                              },
                              child: Icon(Icons.format_list_bulleted,
                                color: _selectedTabPage ==2 ? iconActiveClr : Colors.white,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
                Expanded(
                    child: Center(
                      child: _tabBarFragments[_selectedTabPage],
                    )
                ),
              ],
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 15.0),
                child: GestureDetector(
                  onTap: (){
                    showMessage("trip added", ctx!);
                  },
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: txtColor,
                    child: Icon(CupertinoIcons.add, color: Colors.white, size: 32.0,),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}





