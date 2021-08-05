import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: InkWell(
          onTap: () {
            showSearch(context: context, delegate: SearchItems());
          },
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(35),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(35),
              ),
              padding: EdgeInsets.only(top: 6, right: 15, bottom: 6, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}

class SearchItems extends SearchDelegate<String> {
  SearchItems();
  bool list = true;
  List items = [
    'Paolo Maldini',
    'Ronaldinho',
    "Andres Iniesta",
    "Pelé",
    "Lionel Messi",
    "Cristiano Ronaldo",
    "Xavi",
    "Neymar",
    "Sergio Busquets",
    "Robert Lewandowski",
    "Romelu Lukaku",
    "Roberto Mancini",
    "Riyad Mahrez",
    "Raheem Sterling",
    "Robin van Persie",
    "Roberto Carlos",
    "Roberto Firmino",
    "Wayne Rooney",
    "Kevin De Bruyne",
    "Kylian Mbappe",
    "Karim Benzema",
    "Kalvin Phillips",
    "Kaka",
    "Keylor Navas",
  ];
  List recentlist = ["Ronaldinho", "Xavi", "Neymar"];
  List imageLinkK = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvVNrU0KHpPdFTp9MHnPd0XB6_ZgUp9V3Veg&usqp=CAU",
    "https://thumbs.dreamstime.com/b/kevin-de-bruyne-midfielder-manchester-city-pictured-uefa-champions-league-match-against-steaua-bucharest-manchester-76177136.jpg",
    "https://thumbs.dreamstime.com/b/belgium-national-football-team-midfielder-kevin-de-bruyne-saint-petersburg-russia-november-uefa-euro-qualification-214424555.jpg",
    "https://image.shutterstock.com/image-photo/united-kingdom-manchester-november-21th-600w-771386770.jpg",
    "https://i.pinimg.com/474x/57/2a/e8/572ae846cf213726fd70bf2f63fe7616.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXCJ96SOyvx0YT-yS-Dz89427eTXHaGWV1Kg&usqp=CAU",
  ];
  List imageLinkR = [
    'images/R1.jpg',
    'images/R2.jpg',
    'images/R3.jpg',
    'images/R4.jpg',
    'images/R5.jpg',
    'images/R6.jpg',
    'images/R7.jpg',
    'images/R8.jpg',
    'images/R9.jpg',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          list = !list;
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
          color: Colors.blue,
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withOpacity(.2),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(left: 17, right: 17, top: 20),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: imageLinkR.length,
        // itemCount: 10,
        physics: AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.height /
              MediaQuery.of(context).size.width *
              .42,
        ),
        itemBuilder: (context, int index) {
          return Container(
            height: 130,
            width: MediaQuery.of(context).size.width / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageLinkR[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty
        ? recentlist
        : items
            .where(
              (p) => p.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            tileColor: Colors.greenAccent[200],
            onTap: () async {
              showResults(context);
            },
            title: RichText(
              text: TextSpan(
                text: list[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: list[index].substring(query.length),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
