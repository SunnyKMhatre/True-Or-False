import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:true_false/modal/basmodal.dart';
import 'package:http/http.dart' as http;

class Animals extends StatefulWidget {
  const Animals({super.key});

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  List<Questions>? data;
  List<bool> _isExpanded = [];
  question() async {
    try {
      var userque = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/true_false/post_list?category_id=1"));
      if (userque.statusCode == 200) {
        data = Questions.ofQuestions(jsonDecode(userque.body));
        setState(() {
          _isExpanded = List.filled(data!.length, false);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    question();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/content box.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Positioned(
            child: data == null
                ? Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator while fetching data
                : data!.isEmpty
                    ? Text("No Data")
                    : ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final question = data![index];
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                    // leading:
                                    //     Image.asset("assets/true false icon.png"),
                                    title: Text(
                                        "Q. ${question.question ?? 'No Title'}"),
                                    // subtitle: Text(question.id ?? 'No Description'),
                                    onTap: () {
                                      setState(() {
                                        _isExpanded[index] =
                                            !_isExpanded[index];
                                      });
                                    },
                                    subtitle: Image.asset(
                                      "assets/true false buttons.png",
                                      height: 50,
                                    )
                                    // Icon(
                                    //   _isExpanded[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                    // ),
                                    ),
                                if (_isExpanded[
                                    index]) // Show additional content if expanded
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Answer ${question.answer ?? 'N/A'}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                            "Detail: ${question.postDesc ?? 'N/A'}"),
                                        // Add more details as needed
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
        )
      ],
    ));
  }
}