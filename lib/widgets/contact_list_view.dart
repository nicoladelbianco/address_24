import 'package:address_24/models/person.dart';
import 'package:address_24/widgets/contact_list_item.dart';
import 'package:address_24/widgets/like_button.dart';
import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({
    super.key,
    required this.people,
    required this.onPressed,
    required this.isFavorite,
    required this.onTileTapped,
  });

  final bool Function(Person? person) isFavorite;
  final List<Person> people;
  final void Function(Person person) onPressed;
  final void Function(Person person) onTileTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return ContactListItem(
            person: people[index],
            onTap: () => onTileTapped(people[index]),
            trailing: LikeButton(
                favorite: isFavorite(people[index]),
                onPressed: () => onPressed(people[index])));
      },
    );
  }
}
