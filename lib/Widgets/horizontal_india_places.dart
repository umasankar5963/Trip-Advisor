
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/models/india_trousist_places_model.dart' ;
import '../Screens/india_places_Categories.dart';




class HorizontalPlaces extends StatefulWidget {
  const HorizontalPlaces({
    super.key,
  });

  @override
  State<HorizontalPlaces> createState() => _HorizontalPlacesState();
}

class _HorizontalPlacesState extends State<HorizontalPlaces> {
   bool isLoading=false;
    List<TouristPlace>  touristplace=[];
    
  late  TouristModel trousit;
  
  var index=0;
   Future<void> readJsondata() async {
    isLoading=true;
    setState(() {  });
    final jsondata = await rootBundle.loadString('assets/indiaTrouistPlaceslocal.json');
    final jsonList= json.decode(jsondata);
    trousit= TouristModel.fromJson(jsonList);
    touristplace=trousit.touristPlaces;
   
    
    
    // return list.map((e) => TrouistPlacesIndia.fromJson(e)).toList();
  }

    @override
  void initState() {
    readJsondata().then((value) => setState(() => isLoading=false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
      height: 260.0,
     width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                     itemCount:touristplace.length,
                    itemBuilder: (context,int index) {
                        String categoriethumb=touristplace[index].categorythumb;
                      String toursitCategory=touristplace[index].category;
                      // List<Place> toursitPlace=touristplace[index].places;
                      return Padding(
                      padding: const EdgeInsets.all(20),
                     child: InkWell(
          child: SizedBox(
            height: 260.0,
            width:150.0,
            child: Column(
              children: [
                Hero(
                  tag: categoriethumb,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                   categoriethumb,
                     height: 178.0,
                      width: 140.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 7.0,),
               FittedBox(
                  child: Text(
                   toursitCategory,
                   maxLines:2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.blueGrey[300],
                        overflow: TextOverflow.ellipsis
                      ),
                      softWrap: false,
                      textAlign: TextAlign.left,
                  ),
                ),
               
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_)=>ExploreCat(destinationCat:TouristPlace(category:touristplace[index].category, categorythumb: touristplace[index].categorythumb, places:touristplace[index].places ), 
              ),
            ));
          },
        ),
      );
      }),
    );
}}

// Widget indiaPlacesCat(int index){
//  switch(index){
//   case 0:
                   
//  return HistoricalandCultural(destinationCat:TouristPlace(category:, categorythumb: categorythumb, places: places),);
//   case 1:
//  return NaturalWonders();
//   case 2:
//  return BeachesAndCosts();
//   case 3:
//  return WildLifeAndNationalPark();
//    default:
//         return SizedBox();
// }
// }
