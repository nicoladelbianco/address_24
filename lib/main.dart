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

class HomeListViewScreen extends StatelessWidget {
  HomeListViewScreen({super.key});

  final people = PeopleService().getPeople().toList();

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
      body: ListView(
        children: people.map((e) => _buildListTile(person: e)).toList(),
      ),
    );
  }
}
