import 'package:address_24/models/person.dart';
import 'package:address_24/services/people_service.dart';
import 'package:flutter/material.dart';

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
  final people = PeopleService().getPeople(results: 100).toList();

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    ListTile _buildListTile({required Person person}) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(person.picture!.thumbnail!),
        ),
        title: Text(person.firstName!),
        subtitle: Text(person.cell!),
        trailing: const Icon(Icons.favorite_border),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
          ? ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                return _buildListTile(person: people[index]);
              },
            )
          : const Center(
              child: Text("Hello World!"),
            ),
    );
  }
}
