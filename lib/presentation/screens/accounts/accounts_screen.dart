import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[400],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Name Surname')
                ],
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
            ),
            Column(
              children: [
                AccountField(
                  icon: Icons.bookmark,
                  text: 'Orders',
                ),
                AccountField(
                  icon: Icons.favorite,
                  text: 'Your Favourites',
                ),
                AccountField(
                  icon: Icons.credit_card,
                  text: 'Wallet',
                ),
                AccountField(
                  icon: Icons.label,
                  text: 'Promotions',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountField extends StatelessWidget {
  final IconData icon;
  final String text;

  const AccountField({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
