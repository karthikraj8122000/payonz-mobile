
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payonz/Features/Home/data/models/offers_model.dart';
import 'package:payonz/Features/Home/presentation/providers/offers_provider.dart';
import 'package:payonz/Features/Home/presentation/screens/refer-friends.dart';
import 'package:payonz/Features/Home/presentation/screens/rewards.dart';
import 'package:provider/provider.dart';

class OffersAndRewards extends StatefulWidget {
  const OffersAndRewards({super.key});

  @override
  State<OffersAndRewards> createState() => _OffersAndRewardsState();
}

class _OffersAndRewardsState extends State<OffersAndRewards> {
  @override
  Widget build(BuildContext context) {
    final offersProvider = Provider.of<OffersProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'OFFERS & REWARDS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (context, constraints) {
          int crossAxisCount = (constraints.maxWidth ~/ 100).clamp(2, 4);
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: constraints.maxWidth / (crossAxisCount * 180),
              crossAxisSpacing: 15,
              mainAxisSpacing: 0,
            ),
            itemCount: offersProvider.offers.length,
            itemBuilder: (context, index) {
              return _buildOfferItem(offersProvider.offers[index]);
            },
          );
        }),
      ],
    );
  }

  Widget _buildOfferItem(OffersModel offer) {
    return GestureDetector(
      onTap: (){
        if(offer.name == "Rewards"){
          GoRouter.of(context).push(RewardScreen.routeName);
        }
        else if(offer.name == "Offers"){
          print("Offers");
        }
        else if(offer.name == "Referrals"){
          GoRouter.of(context).push(ReferFriends.routeName);
        }
        else if(offer.name == "Tez Shots"){
          print("Tez Shots");
        }
        },
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: (offer.src != null && offer.src!.isNotEmpty)
                ? NetworkImage(offer.src!)
                : null, // Show image if available
            child: (offer.src == null || offer.src!.isEmpty)
                ? Text(
              offer.name[0].toUpperCase(), // Show first letter
              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            )
                : null, // No child when image exists
          ),
          const SizedBox(height: 8),
          Text(
            offer.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
