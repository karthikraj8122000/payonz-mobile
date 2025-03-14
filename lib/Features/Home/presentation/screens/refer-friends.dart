import 'package:flutter/material.dart';

import '../../../../Core/Constants/app_colors.dart';

class ReferFriends extends StatefulWidget {
  static const String routeName = '/refer-friend';
  const ReferFriends({super.key});

  @override
  State<ReferFriends> createState() => _ReferFriendsState();
}

class _ReferFriendsState extends State<ReferFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 200.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
            background: _inviteSection(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[index % Colors.primaries.length],
                    child: Text('${index + 1}'),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: const Text('Tap to view details'),
                  onTap: () {
                  },
                );
              },
              childCount: 50, // Number of items
            ),
          ),
        ],
      ),
    );
  }

  Widget _inviteSection(){
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.1), // Adjust opacity
            BlendMode.srcATop,
          ),
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzWbrDXhxQ8plCarUH76Sb5k3pdbqhi3TP14F1UYmRTh9ipK55hUnkGX6AWvhfX-WbmXI&usqp=CAU",
            height: 300, // Adjust height as needed
            fit: BoxFit.cover,
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Refer a friends to get ₹201",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Invite",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Icon(Icons.share,color: AppColors.card1,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

