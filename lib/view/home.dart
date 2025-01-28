import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:true_false/modal/basmodal.dart';
import 'package:true_false/view/animals.dart';
import 'package:true_false/view/geography.dart';
import 'package:true_false/view/person.dart';
import 'package:true_false/view/plants.dart';

class True_False extends StatefulWidget {
  const True_False({super.key});

  @override
  State<True_False> createState() => _True_FalseState();
}

class _True_FalseState extends State<True_False> {
  List<Imageass>? details;
  data() async {
    try {
      var user = await http.get(
        Uri.parse("https://mapi.trycatchtech.com/v3/true_false/category_list"),
      );

      if (user.statusCode == 200) {
        details = Imageass.ofimageass(jsonDecode(user.body));
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString("auth", jsonDecode(questions.body));

        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    data();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/settings button@3x.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset("assets/text-names.png"),
              )
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: Text(
            "True or False",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/share icon.png"),
            )
          ],
        ),
        body: Center(
          child: Stack(
            children: [
              details == null
                  ? Center(child: CircularProgressIndicator())
                  : Image.asset(
                      "assets/bg.png",
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
              Positioned(
                  left: 120,
                  top: 90,
                  child: Image.asset("assets/true false icon.png")),
              Positioned(
                  left: MediaQuery.of(context).size.width *
                      0.1, 
                  right: MediaQuery.of(context).size.width *
                      0.1, 
                  top: 280, 
                  bottom: MediaQuery.of(context).size.height *
                      0.2, 
                  child: Center(
                    child: details == null
                        ? Center(child: CircularProgressIndicator())
                        : GridView(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            children: [
                              for (int i = 0; i < details!.length; i++) ...[
                                // Image.network(details?[i].question ?? "NA")
                                details!.isEmpty
                                    ? Text("No Data")
                                    : GestureDetector(
                                        onTap: () {
                                          if (i == 0) {
                                            // Navigator.push(MaterialPageRoute)
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Person()));
                                          } else if (i == 1) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Geography()));
                                          } else if (i == 2) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Animals()));
                                          } else if (i == 3) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Plants()));
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                  details?[i].catImage ?? "NA"),
                                            )
                                          ],
                                        ),
                                      )
                              ]
                            ],
                          ),
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width *
                      0.1, // 10% from the left
                  right: MediaQuery.of(context).size.width *
                      0.1, // 10% from the right
                  // top: MediaQuery.of(context).size.height *
                  //     0.2, // 20% from the top
                  bottom: MediaQuery.of(context).size.height *
                      0, // 20% from the bottom
                  child: Image.asset(
                    "assets/footer.png",
                    // fit: BoxFit.fill,
                    // height: double.infinity,
                    // width: double.infinity,
                  ))
            ],
          ),
        ));
  }
}
