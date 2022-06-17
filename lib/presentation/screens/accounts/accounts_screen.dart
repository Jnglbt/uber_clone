import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/presentation/screens/screens.dart';

import '../../../repositories/repositories.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                const Text('Name Surname')
              ],
            ),
          ),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          Column(
            children: const [
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
          ElevatedButton(
            onPressed: () {
              RepositoryProvider.of<AuthRepository>(context).signOut();
              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,
                  ModalRoute.withName('/login'));
            },
            child: const Center(
              child: Text('Sign out'),
            ),
          ),
        ],
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
