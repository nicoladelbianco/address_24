import 'package:address_24/models/person.dart';
import 'package:flutter/material.dart';

class ContactViewDetails extends StatelessWidget {
  const ContactViewDetails({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(person.picture!.thumbnail!),
              ),
              Text(
                "${person.firstName} ${person.lastName}",
                textScaler: const TextScaler.linear(2),
              ),
              Text(
                person.email!,
                textScaler: const TextScaler.linear(1.3),
              ),
              Text(
                person.cell!,
                textScaler: const TextScaler.linear(1.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
