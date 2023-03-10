import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background.jpeg"),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "GOOD Coffee \n GOOD Morning",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(children: [
                      Container(
                        width: 350,
                        height: 80,
                        child: TextFormField(
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "The Email word is wrong";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email",
                                fillColor: Color.fromARGB(255, 153, 132, 28),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Colors.brown, width: 1),
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              height: 80,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 5 && value.isEmpty) {
                                    return "The Password word is wrong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Password",
                                    fillColor:
                                        Color.fromARGB(255, 153, 132, 28),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          color: Colors.brown, width: 1),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacementNamed(
                                          context, "/home_page");
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange)),
                                  child: SizedBox(
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        "Login",
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don’t have a account?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/reg");
                                    },
                                    style: TextButton.styleFrom(
                                      primary: Colors.orange,
                                    ),
                                    child: Text("Register",
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
