
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:lottie/lottie.dart';

import '../model/home_model.dart';
import '../repositories/home_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 37, 37),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 68, 68),
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 71, 68, 68),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                label: Text('search'),
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: FutureBuilder<List<HomeModel>>(
              future: HomeRepositories().getDataFromApi(),
              builder: (context, AsyncSnapshot<List<HomeModel>> snapshot) {
                final data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 400,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.height,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffEBF0FF)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Lottie.asset("animation/coffe.json"),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 400,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.height,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffEBF0FF)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffEBF0FF)),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          data[index].image,
                                          width: 200,
                                          height: 200,
                                        ),
                                      ),
                                      Text(
                                        data[index].title,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    data[index].description,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
