import 'package:assignment/Builder/builder.dart';
import 'package:assignment/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      // appBar: AppBar(
      //   title: const Text("News"),
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<List<SoccerLeagues>>(
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

                    return GridViewWidget(
                        listOfSoccerLeagues: listOfSoccerLeagues);
                  }
                }),
            // child: GridViewWidget(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SUGGESTED",
                  style: GoogleFonts.aDLaMDisplay(
                    color: Colors.lightGreenAccent,
                  ),
                ),
                //  const GridPaper(child: Text(""),),

                Text(
                  "Don't Show again",
                  style: TextStyle(color: Colors.grey.shade200, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FutureBuilder<List<SoccerLeagues>>(
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
            ),
          ),
        ],
      ),
    );
  }
}