import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../Core/Constants/app_colors.dart';
import '../../../../Shared/widgets/apptext.dart';

class ReferFriends extends StatefulWidget {
  static const String routeName = '/refer-friend';
  const ReferFriends({super.key});

  @override
  State<ReferFriends> createState() => _ReferFriendsState();
}

class _ReferFriendsState extends State<ReferFriends> {
  List referSteps = [
    {
      "src":
      "https://cdn3d.iconscout.com/3d/free/thumb/free-add-friend-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--user-account-empty-state-pack-seo-web-illustrations-2969400.png?f=webp",
      "description":
      "Invite your friends to payonz with your unique refferal code."
    },
    {
      "src":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdUNneAmbG8YwikoCZj7BvVAFkzYjx56hMUg&s",
      "description":
      "Earn ₹101 cashback when your friend makes their first payment within 28 days"
    },
    {
      "src":
      "https://img.freepik.com/premium-vector/flat-illustration-cashback-bonus-from-online-payments-white-background_1278800-19579.jpg",
      "description":
      "Bonus quests: Earn ₹100 cashback when your friend makes 4 weekly payments"
    }
  ];

  List friendsList = [
    {"src":"","name":"Bala","phone":"8293823383"},
    {"src":"","name":"Karthik","phone":"8293823383"},
    {"src":"","name":"Ram","phone":"8293823383"},
    {"src":"","name":"Padmini","phone":"8293823383"}
  ];

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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: AppText(
                  text: "How to earn ₹201 cashback",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final step = referSteps[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 78.0,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 78.0,
                                height: 100.0,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 40.0,
                                      top: 0.0,
                                      bottom: 0.0,
                                      width: 2.0,
                                      child: verticalLine(),
                                    ),
                                    Positioned(
                                      left: 12.0,
                                      top: 25.0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: ClipOval(
                                          child: Image.network(
                                            step['src'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            // color: AppColors.lightBlack,
                            elevation: 0,
                            margin: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  step['description'],
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
              childCount: referSteps.length, // Number of items
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: AppText(
                  text: "Refer friends",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                final friends = friendsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: randomColor, // Random background color
                            // Show image if available
                            child: Text(
                              friends['name'][0].toUpperCase(), // Show first letter
                              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            ), // No child when image exists
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  friends['name'],
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Text(friends['phone']),
                                trailing: TextButton(onPressed: (){}, child: Text("Invite",style: TextStyle(color: AppColors.card1),)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: friendsList.length, // Number of items
            ),
          ),
        ],
      ),
    );
  }

  Widget _inviteSection() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.1), // Adjust opacity
            BlendMode.srcATop,
          ),
          child: Image.asset(
            "assets/images/referfriend.jpg",
            height: 300, // Adjust height as needed
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 70,
            right: 50,
            child: SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: AppColors.card1,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  "Invite",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ))
      ],
    );
  }
}

verticalLine() {
  return Column(
    children: [
      for (int i = 0; i < 10; i++)
        Container(
          height: 6,
          margin: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: AppColors.card1))),
        )
    ],
  );
}