import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white10,

//       ),
// drawer: Drawer(
  
// ),
    body: SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top:20,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                 IconButton(onPressed: (){}, icon:const Icon(Icons.sort,size: 40,)),
                
              
            Material(
        shape: const CircleBorder(side: BorderSide.none),
        elevation: 15,
        child: CircleAvatar(
         radius:20,
             child: ClipOval(
               child: Image.network(
                  'https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  fit: BoxFit.fill,
                   height: 100,
                ),
             ),
        ),
      ),
                ],
              ),
      
            ),
        Material(
                borderRadius: const BorderRadius.all(Radius.circular(10)),elevation: 9,
           child:  TextField(
                     
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          ),
                          hintText: 'Discover a city',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18
                          ),
                          prefixIcon: const Icon(Icons.search),
                          
                        suffixIcon: IconButton(onPressed: (){
                          
                        }, icon: const Icon(Icons.filter_list,color: Colors.black,))
                      ),
      ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        const Text("Explore cities ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
        
        ExploreCitiesCategories(),
          ],
        ),
      ),

    ),
    );
  }
}

class ExploreCitiesCategories extends StatefulWidget {
  const ExploreCitiesCategories({super.key});

  @override
  State<ExploreCitiesCategories> createState() => _ExploreCitiesCategoriesState();
}

class _ExploreCitiesCategoriesState extends State<ExploreCitiesCategories> with TickerProviderStateMixin{
  late TabController _tabcontroller ;


  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Most popular'),
    
    Tab(text: 'Top rated'),
    Tab(text: 'Recommended'),    

   
  ];

@override
void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller=TabController(length: myTabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return 
     Column(
        children: [
          SizedBox(
            height: 30,
            child: TabBar(
              isScrollable:true ,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              controller: _tabcontroller,
              
              tabs:myTabs,
            ),
          ),
          Container(
            height: 300,
           color:Colors.amber,
            child: TabBarView(
              controller: _tabcontroller,
              
              children: [
             AllExploreCategoris(),
              Image.network("https://cdn.pixabay.com/photo/2022/11/14/11/54/quince-7591433__340.jpg",fit: BoxFit.cover,),
              Text("sfd"),
              Text("sfd"),
            ]),
          )
        ],
      
    );
  
  }
}

class AllExploreCategoris extends StatefulWidget {
  const AllExploreCategoris({super.key});

  @override
  State<AllExploreCategoris> createState() => _AllExploreCategorisState();
}

class _AllExploreCategorisState extends State<AllExploreCategoris> {
  int _index=0;
List Images=[
  "https://cdn.pixabay.com/photo/2022/11/14/11/54/quince-7591433__340.jpg"
];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 200, // card height
          child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Image.network("https://cdn.pixabay.com/photo/2022/11/14/11/54/quince-7591433__340.jpg",fit: BoxFit.fill,height: MediaQuery.of(context).size.height,),
                  ),
                ),
              );
            },
          ),
        ),
      );
  
  }
}