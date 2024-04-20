import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:newproject/util/const_utils.dart';

import '../models/seven_wonders_model.dart';

class SevenWondersWidget extends StatefulWidget {
  final SevenWonder wondersdetails;
  const SevenWondersWidget({super.key, required this.wondersdetails});

  @override
  State<SevenWondersWidget> createState() => _SevenWondersWidgetState();
}

class _SevenWondersWidgetState extends State<SevenWondersWidget> {
  bool isFavorite = false;
List<String>favPlaceList=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: widget.wondersdetails.assetImage,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.9,
                  width: double.infinity,
                  child: Image.asset(
                    widget.wondersdetails.assetImage,
                    fit: BoxFit.fill,
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    //const Text('China wall',style:Constants.categoeryheader,),
                    ListTile(
                        title: Text(widget.wondersdetails.name,
                            style: Constants.categoeryheader),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Constants.buttonscolor,
                            ),
                            Text(
                              widget.wondersdetails.location,
                              style: Constants.placedetails,
                            )
                          ],
                        ),
                        trailing: Text(
                          '${widget.wondersdetails.budget}/person',
                          style: Constants.categoeryheader,
                        )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: RatingBarIndicator(
                              itemCount: 5,
                              rating: 4.7,
                              itemSize: 20.0,
                              unratedColor: Constants.unratedclr,
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: Constants.rating)),
                        ),
                       const Text('4.7k reviews',style:Constants.subtitle),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      //height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Text(widget.wondersdetails.details,
                          style: Constants.placedetails),
                    ),
                     const SizedBox(height: 20),
                    Row(children: [
                      Icon(Icons.schedule_outlined,color:Constants.buttonscolor),
                       const SizedBox(width: 20),
                      Text(widget.wondersdetails.timings,style: Constants.timings),
                    ],),
                     const SizedBox(height: 20),
                     Row(children: [
                      Icon(Icons.calendar_month_outlined,color:Constants.buttonscolor),
                      const SizedBox(width: 20),
                      Text(widget.wondersdetails.workingDays,style: Constants.timings),
                    ],),


                  ],
                ),
              ),
            ),
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
                    child: Icon(
                      Icons.arrow_back,
                      color: Constants.darkBG,
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
                    onTap: () {
                      
                      favPlaceList.add(widget.wondersdetails.details);
                      isFavorite = !isFavorite;
                      setState(() {});
                    },
                    child: Icon(Icons.favorite,
                        color: isFavorite ? Colors.red : Colors.black12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}