import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.blue[500]));
    return Scaffold(
//      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'Search Hotels',
            style: TextStyle(color: Colors.blue, letterSpacing: 1),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                showSearch(context: context, delegate: Delegate());
              },
            )
          ]),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 15, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Crave for food ?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: catergoryList.length,
              itemBuilder: (BuildContext context, int index) {
                final catelist = catergoryList[index];
                return Column(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: <Widget>[
                            Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: new InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {},
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                          child: Image.asset(
                                            catelist.image,
                                            fit: BoxFit.fill,
                                            height: 75,
                                            width: 75,
                                          )),
                                    ],
                                  ),
                                )),
                            Text(
                              catelist.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.4),
                            ),
                          ],
                        ))
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 18, 15, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Food from Exotic Hotels :',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class Delegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? resTempList
        : resList
            .where(
                (p) => p.resName.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 10, left: 15, bottom: 8),
            child: Row(children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.black54,
                size: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  (query.isEmpty) ? ' Recent Search :' : ' Search Result',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ])),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: suggestionList.length,
          itemBuilder: (BuildContext context, int index) {
            final _reslist = suggestionList[index];
            return Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 13, right: 13),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                child: Image.asset(
                                  _reslist.image2,
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 190,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(_reslist.resName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text(_reslist.resRating,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orange,
                                        )
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 10),
                                  child: Text(_reslist.resPrice,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            );
          },
        )
      ],
    );
  }
}

class CategoryName {
  String name;
  String image;

  CategoryName({this.name, this.image});
}

List<CategoryName> catergoryList = <CategoryName>[
  CategoryName(name: 'Burger', image: 'assets/images/burger.jpg'),
  CategoryName(name: 'Coffee', image: 'assets/images/coffee.jpg'),
  CategoryName(name: 'Burger', image: 'assets/images/burger.jpg'),
  CategoryName(name: 'Burger', image: 'assets/images/burger.jpg'),
  CategoryName(name: 'Sandwich', image: 'assets/images/sandwich.jpg'),
  CategoryName(name: 'Burger', image: 'assets/images/burger.jpg'),
];

class RestaurentName {
  String image2;
  String resName;
  String resRating;
  String resPrice;

  RestaurentName({this.image2, this.resName, this.resPrice, this.resRating});
}

List<RestaurentName> resTempList = <RestaurentName>[
  RestaurentName(
      image2: 'assets/images/res1.jpeg',
      resName: 'Sheesh Mahel',
      resRating: '4.2',
      resPrice: '1200 for two'),
  RestaurentName(
      image2: 'assets/images/res1.jpeg',
      resName: 'Lemon Tree',
      resRating: '4.2',
      resPrice: '1200 for two'),
];

List<RestaurentName> resList = <RestaurentName>[
  RestaurentName(
      image2: 'assets/images/res1.jpeg',
      resName: 'Delta Residency',
      resRating: '4.2',
      resPrice: '1200 for two'),
  RestaurentName(
      image2: 'assets/images/res2.jpeg',
      resName: 'Silver Sand Resort',
      resRating: '3.9',
      resPrice: '1800 for two'),
  RestaurentName(
      image2: 'assets/images/res3.jpeg',
      resName: 'Lords Revival',
      resRating: '4.9',
      resPrice: '2000 for two'),
  RestaurentName(
      image2: 'assets/images/res4.jpeg',
      resName: 'Sayaji Hotels',
      resRating: '4.9',
      resPrice: '2000 for two'),
  RestaurentName(
      image2: 'assets/images/res2.jpeg',
      resName: 'Hayat Group',
      resRating: '4.9',
      resPrice: '2000 for two'),
  RestaurentName(
      image2: 'assets/images/res2.jpeg',
      resName: 'Hayat Group',
      resRating: '4.9',
      resPrice: '2000 for two'),
];

class OfferAds {
  OfferAds({this.image, this.refer});
  String image;
  String refer;
}

List<OfferAds> _offerList = <OfferAds>[
  OfferAds(image: 'assets/images/res1.jpeg', refer: 'OFFER'),
  OfferAds(image: 'assets/images/res2.jpeg', refer: 'PLATINA'),
  OfferAds(image: 'assets/images/res3.jpeg', refer: 'OFFER'),
  OfferAds(image: 'assets/images/res4.jpeg', refer: 'EXCLUSIVE'),
  OfferAds(image: 'assets/images/res1.jpeg', refer: 'PLATINA'),
];
