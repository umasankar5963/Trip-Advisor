import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/Widgets/seven_wonders.dart';
import 'package:newproject/models/seven_wonders_model.dart';
import 'package:newproject/util/const_utils.dart';

class VeticalPlaces extends StatefulWidget {
  const VeticalPlaces({super.key});

  @override
  State<VeticalPlaces> createState() => _VeticalPlacesState();
}

class _VeticalPlacesState extends State<VeticalPlaces> {
  List<SevenWonder> verticalplaces = [];
  bool isLoading = false;
  late SevenWondersModel wonders;

  Future<void> readJsondata() async {
    isLoading = true;
    setState(() {});
    final jsondata = await rootBundle.loadString('assets/sevenwonders.json');
    final jsonList = jsonDecode(jsondata);
    wonders = SevenWondersModel.fromJson(jsonList);
    verticalplaces = wonders.sevenWonders;
  }

  @override
  void initState() {
    readJsondata().then((value) => setState(() {
          isLoading = false;
        }));
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    final currentheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'Seven Wonders in world',
            style: Constants.categoeryheader,
          ),
        ),
        SizedBox(
          //height: currentheight < 800 ? 140 : 250,
          //height: 500,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: verticalplaces.length,
              itemBuilder: (context, int index) {
                final wondersimage = verticalplaces[index].assetImage;
                final workingdays = verticalplaces[index].workingDays;
                final timings = verticalplaces[index].timings;
                return Hero(
                  tag: wondersimage,
                  child: Card(
                    color: Constants.lightPrimary,
                    elevation: 3,
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Image.asset(
                          wondersimage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(verticalplaces[index].name,
                          style: Constants.listTileTitle),
                      subtitle: Row(
                        children: [
                           Icon(Icons.location_on_outlined,color: Constants.unratedclr,),
                          Text(verticalplaces[index].location,
                              style: TextStyle(
                                color: Colors.blueGrey[300],
                              )),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black54,
                        size: 15,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SevenWondersWidget(
                                    wondersdetails: SevenWonder(
                                        workingDays:
                                            verticalplaces[index].workingDays,
                                        timings: verticalplaces[index].timings,
                                        name: verticalplaces[index].name,
                                        location:
                                            verticalplaces[index].location,
                                        details: verticalplaces[index].details,
                                        budget: verticalplaces[index].budget,
                                        assetImage:
                                            verticalplaces[index].assetImage),
                                  )),
                        );
                      },
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

// Widget sevenWonders(int index){
//     switch (index) {
//     case 0:
//     return ;
//     case 1:
//     return ;
//     case 2:
//     return;
//     case 3:
//     return;
//     case 4:
//     return;
//     case 5:
//     return;
//     case 6:
//     return;
//   }
// }
