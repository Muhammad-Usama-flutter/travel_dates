import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radis_rounded_button/radis_rounded_button.dart';
import 'package:travel_dates/constants.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool _isObscure = true;
  TextEditingController _passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: txtColor,
          backwardsCompatibility: true,
          title: Text(
            'Delete Account',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 30.0, right: 18.0),
              child: Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 28.0,
                  color: txtColor,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 25.0, right: 18.0),
              child: Text(
                'Please Enter the Code received in your email',
                style: TextStyle(
                  fontSize: 18.0,
                  color: txtColor,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 30.0, right: 18.0),
              child: TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                    labelText: 'OTP',
                    labelStyle: TextStyle(
                      fontSize: 20.0
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8.0, right: 18.0),
              child: Text(
                'Didn\'n Received? RESEND',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.blue,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 40.0),
              child: Text(
                'Are you sure to Delete your account permanently?',
                style: TextStyle(
                  fontSize: 14.0,
                  color: txtColor,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 25.0, right: 18.0),
              child:  Row(

                //mainAxisAlignment: MainAxisAlignment.start,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 0.0),
                    color: Colors.grey,
                    height: 20.0,
                    width: 20.0,
                    child: Checkbox(
                        value: isDeleteCheck,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            isDeleteCheck = value!;
                          });
                        }),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("I understand that by deleting my account, all trip information, including my trip data, will be permanently deleted. this can not be undo and data cannot be recovered.",
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                        textScaleFactor: 0.9,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                        color: txtColor,
                        fontSize: 12.0,

                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                // width:140.0,
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                alignment: Alignment.center,
                child: RoundedButton(
                  widget: Text('Delete Account', style: TextStyle(fontSize: 18.0),),
                  backgroundColor: isDeleteCheck ? txtColor : Colors.grey,
                  radius: 5.0,

                  onPressed: (){
                    if(isDeleteCheck){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteAccount()));  
                    }else{
                      showMessage('Please check out the term and conditions ...!', context);
                    }
                    
                  },
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
