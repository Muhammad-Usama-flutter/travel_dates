import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'constants.dart';

import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF55587F),
      ),
      home: MainPage(),
      //home: InitialPage(),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  TextEditingController _emailController = new TextEditingController();

  EmailAuth? emailAuth;

  @override
  void initState() {
    super.initState();
  }

  void _sendOtp(String mail)async{
    ///Accessing the EmailAuth class from the package
    EmailAuth.sessionName = "Travel Dates";
    ///a boolean value will be returned if the OTP is sent successfully
    var data = await EmailAuth.sendOtp(receiverMail: mail);
    if(!data){
      showMessage("Please try again", context);
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerification()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 25.0,top: 50.0, bottom: 0.0),
                  child: Image.asset('assets/images/logo.png')),
            ) ,

            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 55.0),
                      child: Image.asset('assets/images/google_login_btn.png',

                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                      child: Text(
                        '------------ OR ------------',
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 45,
                        margin: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.white, style: BorderStyle.solid)),
                        child: TextFormField(
                          controller: _emailController,
                         // validator: (val) => !isEmail(val!) ? "Invalid Email" : null,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              contentPadding: EdgeInsets.only(left: 8),
                              border: InputBorder.none),
                          onChanged: (value) {},
                        ),
                      ),
                      GestureDetector(
                          child: Image.asset("assets/images/conti_iv.png"),
                        onTap: (){
                            String email = _emailController.text.toString();
                            if(email.isEmpty || !email.contains('@') || !email.contains('.com')){
                              showMessage("Enter a Valid Email", context);
                            }else {
                              userEmail = email;
                              _sendOtp(email);
                            }
                        },
                      )
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {


  EmailAuth? emailAuth;

  @override
  void initState() {
    super.initState();

    // emailAuth!.config('remoteServerConfiguration');
  }

void _verify(String mail, String otp) {
  var resultOtp = EmailAuth.validate(receiverMail: mail, userOTP: otp);
  if(resultOtp){
    showMessage('verified', context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
  }else{
    showMessage('Failed try again !', context);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 25.0,top: 50.0, bottom: 0.0),
                    child: Image.asset('assets/images/logo.png')),
              ) ,

              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 15.0),
                      child: Text(
                        'Please enter the code received in your email',
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.only(left: 8.0),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         OTPTextField(
                           length: 6,
                           width: MediaQuery.of(context).size.width * 0.7,
                           textFieldAlignment: MainAxisAlignment.start,
                           fieldWidth: 35,
                           fieldStyle: FieldStyle.box,
                           outlineBorderRadius: 1,
                           otpFieldStyle: OtpFieldStyle(
                               borderColor: Colors.white,
                             disabledBorderColor: Colors.white,

                           ),
                           style: TextStyle(fontSize: 14),
                           onChanged: (pin) {
                             print("Changed: " + pin);
                           },
                           onCompleted: (pin) {
                             // print("Completed: " + pin);
                             _verify(userEmail, pin);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));

                           },
                         ),
                         SizedBox(
                           height: 90.0,
                           width: MediaQuery.of(context).size.width * 0.2,
                           child: GestureDetector(
                             child: Image.asset("assets/images/conti_iv.png"),
                             onTap: (){

                             },
                           ),
                         )
                       ],
                     ),
                   )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}


