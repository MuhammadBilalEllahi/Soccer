import 'dart:convert';
import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:assignment/Model/model.dart';
import 'package:assignment/Pages/home.dart';
import 'package:assignment/Pages/news.dart';
import 'package:assignment/Pages/prof.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

String url = 'https://fls.contentprotectforce.com/public/';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
    int value = 1;//put it outside. otherwise it will rebuild.
    int selectedIndex = 0;

    final List<Widget> pages = [
      const HomePage(),
      const NewsPage(),
      const ProfilePage()
    ];

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {


   

    

    void _onToggle(int selectedValue) {
      setState(() {
        value = selectedValue;
        print("Valye$value--");
        print("Index$selectedValue--");
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30)
        )),
        // automaticallyImplyLeading: false,
        bottom: PreferredSize(
            preferredSize: const Size(200, 130),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: Text(
                    "Following",
                    style: GoogleFonts.aBeeZee(fontSize: 32),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 20),
                  child: AnimatedToggleSwitch<int>.size(
                    textDirection: TextDirection.rtl,
                    current: value,
                    values: const [0, 1],
                    iconOpacity: 0.2,
                    indicatorSize: const Size(160, 40),
                    iconBuilder: (value) => (value.isOdd)
                        ? const Text("Teams")
                        : const Text("Players"),
                    borderWidth: 5.0,
                    iconAnimationType: AnimationType.onHover,
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                    onTap: (props) {
                      print('');
                    },
                    styleBuilder: (i) =>
                        ToggleStyle(indicatorColor: colorBuilder(i)),
                    onChanged: _onToggle,
                  ),
                ),
              ],
            )),

        title: const Text("Soccers"),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const ViewData()));
                  },
                  child: const Text("Home",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NewsPage()));
                },
                child: const Text(
                  "News",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  },
                  child: const Text("Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ],
          ),
        ),
      ),

      body: pages[selectedIndex],

      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Expanded(
      //       child: FutureBuilder<List<SoccerLeagues>>(
      //           future: futuredata(),
      //           builder: (context, snapshot) {
      //             if (snapshot.connectionState == ConnectionState.waiting) {
      //               return const Center(
      //                 child: CircularProgressIndicator(),
      //               );
      //             } else if (snapshot.hasError) {
      //               print(snapshot.error);
      //               return Center(
      //                 child: Text("${snapshot.error}"),
      //               );
      //             }
      //             if (!snapshot.hasData) {
      //               print("No Data");
      //               return const Center(
      //                 child: Text("No Data"),
      //               );
      //             } else {
      //               List<SoccerLeagues>? listOfSoccerLeagues = snapshot.data;

      //               return GridViewWidget(
      //                   listOfSoccerLeagues: listOfSoccerLeagues);
      //             }
      //           }),
      //       // child: GridViewWidget(),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "SUGGESTED",
      //             style: GoogleFonts.aDLaMDisplay(
      //               color: Colors.lightGreenAccent,
      //             ),
      //           ),
      //           //  const GridPaper(child: Text(""),),

      //           Text(
      //             "Don't Show again",
      //             style: TextStyle(color: Colors.grey.shade200, fontSize: 14),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 10),
      //         child: FutureBuilder<List<SoccerLeagues>>(
      //             future: futuredata(),
      //             builder: (context, snapshot) {
      //               if (snapshot.connectionState == ConnectionState.waiting) {
      //                 return const Center(
      //                   child: CircularProgressIndicator(),
      //                 );
      //               } else if (snapshot.hasError) {
      //                 print(snapshot.error);
      //                 return Center(
      //                   child: Text("${snapshot.error}"),
      //                 );
      //               }
      //               if (!snapshot.hasData) {
      //                 print("No Data");
      //                 return const Center(
      //                   child: Text("No Data"),
      //                 );
      //               } else {
      //                 List<SoccerLeagues>? listOfSoccerLeagues = snapshot.data;

      //                 return CardShow(listOfSoccerLeagues: listOfSoccerLeagues);
      //               }
      //             }),
      //       ),
      //     ),
      //   ],
      // ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_football,
                // color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              ),
              label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Prof"),
        ],
        currentIndex: selectedIndex,
        // selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        selectedFontSize: 14,
        unselectedFontSize: 14,
      ),
    );
  }
}

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({
    super.key,
    required this.listOfSoccerLeagues,
  });
  final List<SoccerLeagues>? listOfSoccerLeagues;
  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listOfSoccerLeagues!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              childAspectRatio: 1.12),
          itemBuilder: (BuildContext context, index) {
            int colorCode = Random().nextInt(60);
            debugPrint(
                "Debug > Item $index width: ${MediaQuery.of(context).size.width}");
            Color randomColor = Color.fromRGBO(
              // Random().nextInt(60),
              // Random().nextInt(60),
              // Random().nextInt(60),
              colorCode,
              colorCode,
              colorCode,
              1.0,
            );
            return Container(
              width: 100,
              decoration: BoxDecoration(
                  // color: Theme.of(context).cardTheme.color,
                  color: randomColor,
                  borderRadius: BorderRadius.circular(30)),

              // color: Theme.of(context).cardTheme.color,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          // processedImageUrls[index],
                          "$url${widget.listOfSoccerLeagues?[index].icon}",
                          width: 70,
                          height: 70,
                          fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 15, 8),
                      child: Text(
                        "${widget.listOfSoccerLeagues?[index].name}",
                        softWrap: true,
                        style: GoogleFonts.aBeeZee(fontSize: 18),
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
//leagues
//teams
//game

// ignore: must_be_immutable
class CardShow extends StatefulWidget {
  const CardShow({
    super.key,
    required this.listOfSoccerLeagues,
  });

  final List<SoccerLeagues>? listOfSoccerLeagues;

  @override
  State<CardShow> createState() => _CardShowState();
}

class _CardShowState extends State<CardShow> {
  @override
  void initState() {
    super.initState();
    // fetchImageUrls();
  }
  //   Future<void> fetchImageUrls() async {
  //   List<String> urls = [];
  //   for (var soccerLeague in widget.listOfSoccerLeagues!) {
  //     String processedImageUrl = await ApiClient().removeBgApi("$url${soccerLeague.icon}");
  //     urls.add(processedImageUrl);
  //   }
  //   setState(() {
  //     processedImageUrls = urls;
  //   });
  // }     late List<String> processedImageUrls ;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: widget.listOfSoccerLeagues!.length,
          itemBuilder: (context, index) {
            // ApiClient().removeBgApi("$url${widget.listOfSoccerLeagues?[index].icon}");
            // String processedImageUrl = await ApiClient().removeBgApi("$url${widget.listOfSoccerLeagues?[index].icon}");

            return Card(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        style: BorderStyle.none, color: Colors.transparent)),
                shadowColor: Colors.black54,
                child: SizedBox(
                  height: 80,
                  child: Align(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber,
                          child: ClipOval(
                            child: Image.network(
                                // processedImageUrls[index],
                                "$url${widget.listOfSoccerLeagues?[index].icon}",
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.listOfSoccerLeagues?[index].name}",
                          style: GoogleFonts.aDLaMDisplay(fontSize: 14),
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(130, 134, 134, 134)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),

                              // side: const BorderSide(color: Colors.red)
                            ))),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            "Follow",
                            style: TextStyle(
                                color: Color.fromARGB(255, 98, 255, 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )

                // SizedBox(
                //   height: 80,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [

                //      Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: CircleAvatar(

                //               radius: 30,
                //               child: Image.network(
                //                 // processedImageUrls[index],
                //                   "$url${widget.listOfSoccerLeagues?[index].icon}",
                //                   width: 80,
                //                   height: 80,
                //                   fit: BoxFit.fill),
                //             ),
                //           ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text("${widget.listOfSoccerLeagues?[index].name}", style: GoogleFonts.aDLaMDisplay(fontSize: 14),),
                // ),
                // TextButton(onPressed: (){}, child: const Text("Follow"))

                //   ],),
                // )

                //  Column(
                //   // mainAxisAlignment: MainAxisAlignment.start,
                //   // crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [

                //     SizedBox(
                //                       height: 80,

                //       child: ListTile(
                //         leading: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: CircleAvatar(

                //             radius: 30,
                //             child: Image.network(
                //               // processedImageUrls[index],
                //                 "$url${widget.listOfSoccerLeagues?[index].icon}",
                //                 width: 100,
                //                 height: 100,
                //                 fit: BoxFit.fill),
                //           ),
                //         ),
                //         title: Text("${widget.listOfSoccerLeagues?[index].name}"),
                //         // subtitle: Column(
                //         //   crossAxisAlignment: CrossAxisAlignment.start,
                //         //   children: [
                //         //     Text(
                //         //       "ID : ${listOfSoccerLeagues?[index].id}",
                //         //       style: const TextStyle(color: Colors.orange),
                //         //     ),
                //         //     Text(
                //         //         "Created At :${listOfSoccerLeagues?[index].createdAt}",
                //         //         style: const TextStyle(color: Colors.orange)),
                //         //     Text(
                //         //         "Upadtaed at: ${listOfSoccerLeagues?[index].updatedAt}",
                //         //         style: const TextStyle(color: Colors.red)),
                //         //   ],
                //         // ),
                //       ),
                //     ),
                //   ],
                // ),
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

    return responseList
        .map((element) => SoccerLeagues.fromJson(element))
        .toList();
  } else {
    throw Exception("Data does not exist");
  }
}

Color colorBuilder(int index) {
  switch (index) {
    case 0:
      return Colors.grey.shade700;
    case 1:
      return Colors.grey.shade700;

    default:
      return Colors.red;
  }
}

// class ApiClient {
//   Future<Uint8List> removeBgApi(String imagePath) async {
//     var request = http.MultipartRequest("POST", Uri.parse("https://api.remove.bg/v1.0/removebg"));
//     request.files.add(await http.MultipartFile.fromPath("image_url", imagePath));
//     request.headers.addAll({"X-API-Key": "fWHM4voEm8DYUpHmRLg84cVu"});
//     final response = await request.send();
//     if (response.statusCode == 200) {
//       http.Response imgRes = await http.Response.fromStream(response);
//       return imgRes.bodyBytes;
//     } else {
//       throw Exception("Error occurred with response ${response.statusCode}");
//     }
//   }
// }

class ApiClient {
  Future<String> removeBgApi(String imageUrl) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://api.remove.bg/v1.0/removebg"));
    request.files.add(await http.MultipartFile.fromPath("image_url", imageUrl));
    request.headers.addAll({"X-API-Key": "fWHM4voEm8DYUpHmRLg84cVu"});
    final response = await request.send();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(await response.stream.bytesToString());
      return data['data']['result_url'];
    } else {
      throw Exception("Error occurred with response ${response.statusCode}");
    }
  }
}
