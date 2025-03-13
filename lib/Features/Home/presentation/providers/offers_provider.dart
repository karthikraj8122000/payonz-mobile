import 'package:flutter/material.dart';
import 'package:payonz/Features/Home/data/models/offers_model.dart';

class OffersProvider extends ChangeNotifier {
  final List<OffersModel> _offers = [
    OffersModel(name: 'Rewards', src: 'https://static.vecteezy.com/system/resources/previews/021/666/206/non_2x/online-reward-3d-icon-3d-trophy-cup-on-the-mobile-phone-screen-esports-trophy-customer-promo-surprise-virtual-giveaway-award-online-reward-clipart-png.png'),
    OffersModel(name: 'Offers', src: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuIqmo2t-SCVaEEyC3XnvurmAyioSmvKuWuA&s'),
    OffersModel(name: 'Referrals', src: 'https://storage.googleapis.com/production-payrup-assets/post/48-1641198479-28-post.jpeg'),
    OffersModel(name: 'Tez Shots', src: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf7biq5jGTETCRT4iUVfxYvJ6y8_xKjLVLcw&s'),
  ];

  List<OffersModel> get offers => _offers;

  void addOffersModel(OffersModel offer) {
    _offers.add(offer);
    notifyListeners();
  }
}