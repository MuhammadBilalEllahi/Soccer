import 'dart:convert';

import 'package:assignment/Model/model.dart';
import 'package:assignment/Pages/prof.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text("Soccer Team"),
      // ),
      body: FutureBuilder<List<SoccerLeagues>>(
          future: futuredata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            if (!snapshot.hasData) {
              print("No Data");
              return const Center(
                child: Text("No Data"),
              );
            } else {
              List<SoccerLeagues>? listOfSoccerLeagues = snapshot.data;

              return CardShow(listOfSoccerLeagues: listOfSoccerLeagues);
            }
          }),
          drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                child: const Text("Home")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                child: const Text("News")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
                },
                child: const Text("Profile")),
          ],
        ),
      ),
    );
    
  }
}



// ignore: must_be_immutable
class CardShow extends StatelessWidget {
  CardShow({
    super.key,
    required this.listOfSoccerLeagues,
  });

  final List<SoccerLeagues>? listOfSoccerLeagues;
  String url = 'https://fls.contentprotectforce.com/public/';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: listOfSoccerLeagues!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                shape: const BeveledRectangleBorder(
                    side: BorderSide(color: Colors.white)),
                shadowColor: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                    //   child: Text("${listOfSoccerLeagues?[index].id}"),
                    // ),

                    ListTile(
                      // leading: Image.network( "${snapshot.data?[index].image}"),
                      // title: Text("${snapshot.data?[index].price}")
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "$url${listOfSoccerLeagues?[index].icon}",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      title: Text("${listOfSoccerLeagues?[index].name}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID : ${listOfSoccerLeagues?[index].id}",
                            style: const TextStyle(color: Colors.orange),
                          ),
                          Text("Created At :${listOfSoccerLeagues?[index].createdAt}",
                              style: const TextStyle(color: Colors.orange)),
                          Text(
                              "Upadtaed at: ${listOfSoccerLeagues?[index].updatedAt}",
                              style: const TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Future<List<SoccerLeagues>> futuredata() async {
  final response = await http
      .get(Uri.parse("https://fls.contentprotectforce.com/public/api/leagues"));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> responseList = data['response'];

    return responseList.map((element) => SoccerLeagues.fromJson(element)).toList();
  } else {
    throw Exception("Data does not exist");
  }
}
