import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Widgets/favbutn.dart';
import '../models/india_trousist_places_model.dart';
import '../util/const_utils.dart';

class ExploreCat extends StatefulWidget {
  const ExploreCat({
    super.key,
    required this.destinationCat,
  });
  final TouristPlace destinationCat;

  @override
  State<ExploreCat> createState() => _ExploreCatState();
}

class _ExploreCatState extends State<ExploreCat> {
//   Text _buildRtingStars(int rating) {
//     String stars = '';
//     for (int i = 0; i < rating; i++) {
//       stars += '\u2B50';
//     }
//     stars.trim();
//     return Text(stars);
//   }

  bool isfavourte = false;
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Constants.lightPrimary,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.width,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            )
                          ]),
                      child: Hero(
                        tag: widget.destinationCat.categorythumb,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)),
                          child: Image.asset(
                            // color: Colors.transparent,
                            widget.destinationCat.categorythumb,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Card(
                      color: Constants.lightPrimary,
                      elevation: 8,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,
                              color: Constants.darkPrimary),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 60,
                    child: Card(
                      color: Constants.lightPrimary,
                      elevation: 8,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            color: Constants.darkPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Card(
                      color: Constants.lightPrimary,
                      elevation: 8,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.filter_list,
                            color: Constants.darkPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(widget.destinationCat.category,
                  style: Constants.categoeryheader),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.destinationCat.places.length,
                    itemBuilder: (BuildContext context, int index) {
                      Place places = widget.destinationCat.places[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      IndiaTouristPlaces(
                                        indiaplaceslist: widget.destinationCat,
                                        index: index,
                                      )));
                        },
                        child: Stack(children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                                20.0, 5.0, 20.0, 10.0),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10.0),
                            height: 170.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Constants.boxshadow,
                                  offset: const Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              color: Constants.whiteColorBg,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  100.0, 20.0, 20.0, 20.0),
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: 120.0,
                                              child: Text(
                                                // widget.destinationCat
                                                //     .places[index].name,
                                                places.name,
                                                style:
                                                    Constants.indiaplcesHeader,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                          Column(
                                            children: [
                                              Text(
                                                // widget
                                                //     .destinationCat
                                                //     .places[index]
                                                //     .accommodationCost,

                                                places.accommodationCost,
                                                style: Constants.budgetcost,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const Text('Per Night',
                                                  style: Constants.subtitle),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.black26,
                                          ),
                                          Text(
                                            // widget.destinationCat.places[index]
                                            //     .location,
                                            places.location,
                                            style: Constants.subtitle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    RatingBarIndicator(
                                        itemCount: 5,
                                        rating: 4.5,
                                        itemSize: 40.0,
                                        unratedColor: Constants.unratedclr,
                                        itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Constants.rating))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10.0,
                            left: 25.0,
                            bottom: 15.0,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: Hero(
                                tag: widget.destinationCat.places[index].image,
                                child: Image.asset(
                                    fit: BoxFit.fill, width: 110.0, places.image
                                    // widget.destinationCat.places[index].image
                                    ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            bottom: 20,
                            // child: InkWell(
                            //   onTap: () {
                            //     isfavourte = !isfavourte;
                            //     setState(() {});
                            //   },
                            //   child: Icon(Icons.favorite,
                            //       color: isfavourte
                            //           ? Colors.red
                            //           : Colors.black12),
                            // )
                            child: FavoriteButton(
                              itemId: widget.destinationCat.category,
                            ),
                          )
                        ]),
                      );
                    }),
              )
            ],
          )),
    );
  }
}

class IndiaTouristPlaces extends StatefulWidget {
  final int index;

  const IndiaTouristPlaces({
    super.key,
    required this.indiaplaceslist,
    required this.index,
  });
  final TouristPlace indiaplaceslist;
  @override
  State<IndiaTouristPlaces> createState() => _IndiaTouristPlacesState();
}

class _IndiaTouristPlacesState extends State<IndiaTouristPlaces> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.9,
              width: double.infinity,
              child: Hero(
                  tag: widget.indiaplaceslist.places[widget.index].image,
                  child: Image.asset(
                      widget.indiaplaceslist.places[widget.index].image,
                      fit: BoxFit.fill)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    color: Constants.lightPrimary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Constants.boxshadow,
                          blurRadius: 0.5,
                          spreadRadius: 0.2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.indiaplaceslist.places[widget.index].name,
                            style: Constants.categoeryheader,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              widget.indiaplaceslist.places[widget.index]
                                  .accommodationCost,
                              style: Constants.budgetcost,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Icon(
                          Icons.location_on,
                          color: Constants.boxshadow,
                        ),
                        Text(
                          widget.indiaplaceslist.places[widget.index].location,
                          style: Constants.subtitle,
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Famous:',
                        style: Constants.listTileTitle,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(widget
                              .indiaplaceslist.places[widget.index].famous)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Budget:',
                        style: Constants.listTileTitle,
                      ),
                      Text(widget.indiaplaceslist.places[widget.index].budget),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Details:',
                        style: Constants.listTileTitle,
                      ),
                      Text(widget.indiaplaceslist.places[widget.index].details),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Card(
                elevation: 8,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
