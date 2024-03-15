import 'package:address_24/models/person.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.p,
  });

  final Person p;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(p.picture!.thumbnail!),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(p.firstName!), Text(p.cell!)],
            ),
          ],
        ),
      ),
    );
  }
}
