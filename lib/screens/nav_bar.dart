import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/screens/addItem.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Walid Barakat'),
            accountEmail: Text('leadermatrix2@yahoo.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/walid_barakat.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/images.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Add product'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddItem()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Follows'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {},
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                    child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
