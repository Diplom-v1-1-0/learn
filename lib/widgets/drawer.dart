import 'package:flutter/material.dart';
import 'package:learn/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(color: Theme.of(context).canvasColor),
              child: UserAccountsDrawerHeader(
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                accountName: Text(
                  "Сургалтын Апп",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  "Диплом",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dp.png"),
                ),
              ),
            ),
            _buildListTile(
              icon: Icons.home,
              title: "Эхлэл",
              onTap: () {
                Navigator.pushReplacementNamed(context, AllRoutes.homeRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.text_fields,
              title: "А - Я",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.atozRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.pest_control_rodent_outlined,
              title: "Амьтад",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.animalRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.egg,
              title: "Шувуу",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.birdsRoute);
              },
              context: context,
            ),
            _buildListTile(
              icon: Icons.question_mark_outlined,
              title: "Бидний тухай",
              onTap: () {
                Navigator.pushNamed(context, AllRoutes.aboutRoute);
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      onTap: onTap,
    );
  }
}
