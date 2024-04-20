import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favbutn.dart';

class MyItem {
  final String id;
  final String name;
  // Other properties of the item

  MyItem({required this.id, required this.name});
}

class MyItemList extends StatelessWidget {
  final List<MyItem> items = [
    MyItem(id: '1', name: 'Item 1'),
    MyItem(id: '2', name: 'Item 2'),
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        MyItem item = items[index];
        return ListTile(
          title: Text(item.name),
          trailing: FavoriteButton(itemId: item.id),
        );
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final String itemId;

  FavoriteButton({required this.itemId});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Check the initial favorite status from SharedPreferences
    loadFavoriteStatus();
  }

  void loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.itemId) ?? false;
    });
  }

  void toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      // Save the favorite status to SharedPreferences
      prefs.setBool(widget.itemId, isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: toggleFavorite,
    );
  }
}

class SearchPlaces extends StatefulWidget {
  const SearchPlaces({super.key});

  @override
  State<SearchPlaces> createState() => _SearchPlacesState();
}

class _SearchPlacesState extends State<SearchPlaces> {
  @override
  Widget build(BuildContext context) {
    List<String> favPlaceList = [];
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox(
        child: favPlaceList.isEmpty
            ? const Center(
                child: Text(
                  'There are no favorites yet!',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ListView.builder(
                itemCount: favPlaceList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              favPlaceList[index],
                              style: const TextStyle(fontSize: 19.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              favPlaceList.remove(favPlaceList[index]);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple,
                            ),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
