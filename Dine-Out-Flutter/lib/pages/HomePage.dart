import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 17),
                child: Container(
                    height: 20,
                    child: Text(
                      'Lets,Grab a',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ))),
            Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  height: 20,
                  child: Text(
                    ' Deal ',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w400),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  height: 20,
                  child: Text(
                    '!',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(children: <Widget>[
              Container(
                height: 160,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _offerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final offerlist = _offerList[index];
                    return Column(
                      children: <Widget>[
                        Container(
                            child: Card(
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    offerlist.image,
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: 250,
                                  )),
                              Positioned(
                                left: 10,
                                top: 10,
                                child: Material(
                                    elevation: 14,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                          color: Colors.deepOrange,
                                        )),
                                    child: Container(
                                      height: 15,
                                      color: Colors.deepOrange,
                                      width: 66,
                                      child: Center(
                                          child: Text(offerlist.refer,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12))),
                                    )),
                              ),
                            ],
                          ),
                        ))
                      ],
                    );
                  },
                ),
              )
            ])),
        Padding(
          padding: EdgeInsets.fromLTRB(17.0, 10, 10, 0),
          child: Row(
            children: <Widget>[
              Text(resList.length.toString() + ' RESTAURANTS',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 130,
              ),
              Icon(
                Icons.sort,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text('SORTED/FILTERED',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 10, 15, 0),
          child: Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height - 350,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: resList.length,
              itemBuilder: (BuildContext context, int index) {
                final _reslist = resList[index];
                return Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Card(
                          elevation: 2,
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
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
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
                        ))
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 10, right: 18, left: 18),
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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

class RestaurentName {
  String image2;
  String resName;
  String resRating;
  String resPrice;

  RestaurentName({this.image2, this.resName, this.resPrice, this.resRating});
}

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
