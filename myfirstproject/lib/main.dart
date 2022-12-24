import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: MyForm()));
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  late String test;
  @override
  void initState() {
    super.initState();
    test = "null";
    int len = test.length;
    print(len);
  }

  String str = "@gmail.com";

  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileNumber = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();
  var pin = TextEditingController();

  var myFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Registration Form"),
      ),
      body: Form(
        key: myFormKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  maxLength: 15,
                  controller: firstNameController,
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the First Name";
                      }
                      if (msg.length < 3) {
                        return "Name is less than 3 characters";
                      }
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "First Name",
                      hintText: "Enter your First Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  maxLength: 15,
                  controller: lastNameController,
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the Last Name";
                      }
                      if (msg.length < 3) {
                        return "Name is less than 3 characters";
                      }
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your Last Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  controller: mobileNumber,
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the Mobile Number";
                      }
                      if (msg.length != 10) {
                        return "Mobile Number is less than 10 characters";
                      }
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Mobile",
                      hintText: "Enter your Mobile Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the EmailAddress";
                      }
                      if (!msg.contains(str)) {
                        return "Please Enter Valid Email Address";
                      }
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your Email Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: address,
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the Address";
                      }
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter your Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  maxLength: 6,
                  controller: pin,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the Pincode";
                      }
                      if (msg.length != 6) {
                        return "Pincode Number is less than 10 characters";
                      }
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Pincode",
                      hintText: "Enter your Pincode",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  controller: password,
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != null) {
                      if (msg.isEmpty) {
                        return "Please Enter the Password";
                      }
                      if (msg.length < 8) {
                        return "Name is less than 8 characters";
                      }
                    }

                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  onChanged: (value) {
                    myFormKey.currentState?.validate();
                  },
                  controller: confirmPassword,
                  validator: (String? msg) {
                    //print(msg);
                    if (msg != password.value.text) {
                      return "Please enter the Same Password";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter your Same Password Again",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
            ),
            Align(
              child: SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (Colors.limeAccent),
                    foregroundColor: Colors.black,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    // minimumSize: Size(100, 40),
                  ),
                  onPressed: () async {
                    if (myFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Map<String, String> mp = {
                        "firstName": firstNameController.text,
                        "lastName": lastNameController.text,
                        "mob": mobileNumber.text,
                        "email": email.text,
                        "address": address.text,
                        "pincode": pin.text,
                        "password": password.text

                      };
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc()
                          .set(mp);
                      print("after storing data");
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data added to firestore')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
