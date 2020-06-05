import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final List<Map> listTripItems = [
  {
    "title": "Start the trip - Bankok",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-4961-Original-min.jpg?alt=media&token=f7e5394e-3d82-4615-b865-283d249164fb"
  },
  {
    "title": "Eating on the street",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-5395-Original-min.jpg?alt=media&token=6e351474-7edf-44c4-b400-4ad1e2f91e43"
  },
  {
    "title": "Rice and Bananas",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-5699-Original-min.jpg?alt=media&token=0ae728d9-bb68-4e1d-b2c2-e8dafc761a1e"
  },
  {
    "title": "Make a new friend",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-5923-Original-min.jpg?alt=media&token=97c7ddcd-96f3-4697-9f7d-8bdc158ce65f"
  },
  {
    "title": "White temple",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-6149-Original-min.jpg?alt=media&token=cf31f685-3a0a-40c1-ab20-24a9a1933e7f"
  },
  {
    "title": "Fixing..",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-6220-Original-min.jpg?alt=media&token=98b65b4a-8d48-49c6-addc-4ba97aef8652"
  },
];
final List<Map> listLikedPhotos = [
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-5031-Original-min.jpg?alt=media&token=54560418-f50a-41ef-b4c1-ee65168258f2"
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-5584-Original-min.jpg?alt=media&token=2ef0ef90-ab97-4915-af6d-c66c43363037"
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-5974-Original-min.jpg?alt=media&token=b8e44578-6083-4a8b-8d9a-098e4dd48c56"
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-0331-Original-min.JPG?alt=media&token=754e6db7-28ca-4885-826a-675c0137b45c"
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/shopapp-9a338.appspot.com/o/IMG-1248-Original.jpg?alt=media&token=498c83d3-9dbd-4c98-aeab-4ff4535b970e"
  },
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Center(child: Text('Profile challenge 02')),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo.shade300, Colors.indigo.shade500]),
              ),
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    if (index == 0) ProfileBox(),
                    if (index == 1) TripBox(),
                    if (index == 2) MostLikedComponent(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TripBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: TripComponent(),
    );
  }
}

class TripComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Asia Trip',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Create New',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 150.0,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listTripItems.length,
                itemBuilder: _tripItens),
          ),
        ],
      ),
    );
  }

  Widget _tripItens(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(listTripItems[index]['image']),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            listTripItems[index]['title'],
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

class ProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Leonardo Palmeiro",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Fullstack | Flutter Developer"),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "302",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Posts".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "10.3K",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Followers".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "120",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Following".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MostLikedComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Most liked posts',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 300,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: ListView.builder(
              itemCount: listLikedPhotos.length,
              itemBuilder: (context, index) => Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      listLikedPhotos[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
