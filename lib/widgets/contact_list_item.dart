import 'package:address_24/models/person.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem(
      {super.key,
      required this.person,
      required this.trailing,
      required this.onTap});

  final Person person;
  final Function() onTap;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(person.picture!.thumbnail!),
      ),
      title: Text(person.firstName!),
      subtitle: Text(person.cell!),
      trailing: trailing,
    );
  }
}
