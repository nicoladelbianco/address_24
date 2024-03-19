import 'package:address_24/models/person.dart';
import 'package:address_24/services/people_service.dart';
import 'package:address_24/widgets/like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/contact_list_item.dart';
import 'widgets/contact_list_view.dart';
import 'widgets/contact_view_details.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: HomeListViewScreen(),
      ),
    ),
  );
}

class HomeListViewScreen extends StatefulWidget {
  HomeListViewScreen({super.key});

  @override
  State<HomeListViewScreen> createState() => _HomeListViewScreenState();
}

class _HomeListViewScreenState extends State<HomeListViewScreen> {
  final people = PeopleService()
      .getPeople(results: 100)
      .where((e) => e.id != null)
      .toList();

  final List<Person> _favorite = [];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    // Widget _buildListTile({required Person person}) {
    //   return ContactListItem(
    //     person: person,
    //     trailing: LikeButton(
    //       favorite: _favorite.contains(person),
    //       onPressed: () {
    //         setState(
    //           () {
    //             if (_favorite.contains(person)) {
    //               _favorite.remove(person);
    //             } else {
    //               _favorite.add(person);
    //             }
    //           },
    //         );
    //       },
    //     ),
    //   );
    // }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: "Favorite")
        ],
      ),
      body: _currentIndex == 0
          ? ContactListView(
              people: people,
              onTileTapped: (person) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ContactViewDetails(person: person);
                    },
                  ),
                );
              },
              onPressed: (person) {
                setState(() {
                  if (_favorite.contains(person)) {
                    _favorite.remove(person);
                  } else {
                    _favorite.add(person);
                  }
                });
              },
              isFavorite: ((person) {
                return _favorite.contains(person);
              }),
            )
          : ContactListView(
              people: _favorite,
              onTileTapped: (person) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ContactViewDetails(person: person);
                    },
                  ),
                );
              },
              onPressed: (person) {
                setState(() {
                  if (_favorite.contains(person)) {
                    _favorite.remove(person);
                  } else {
                    _favorite.add(person);
                  }
                });
              },
              isFavorite: ((person) {
                return _favorite.contains(person);
              }),
            ),
    );
  }
}
