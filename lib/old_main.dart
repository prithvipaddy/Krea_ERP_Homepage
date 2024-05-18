import 'package:flutter/material.dart';
import 'dart:io';

typedef IndexCallBack = void Function(int index);

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<L1Card> l1Cards = [];
  final kreaLogo = File('resources/kreaLogo.png');
  int currentCardSelection = 0;

  @override
  void initState() {
    super.initState();
    L2Card onboardingSub1 = const L2Card(
      cardIcon: Icon(
        Icons.abc_outlined,
        color: Colors.white,
      ),
      cardName: "Additional Data",
    );
    L1Card onboarding = L1Card(
      cardIcon: const Icon(
        Icons.waving_hand,
        color: Colors.white,
      ),
      cardName: "Onboarding",
      subCards: [onboardingSub1],
    );
    L1Card home = const L1Card(
      cardIcon: Icon(
        Icons.home,
        color: Colors.white,
      ),
      cardName: "Home",
      subCards: [],
    );

    setState(() {
      l1Cards = [home, onboarding];
    });
  }

  void onPressedSidebarButton(int index) {
    setState(() {
      currentCardSelection = index;
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 160,
            color: Colors.indigo,
            child: ListView(
              children: [
                Image.file(kreaLogo),
                for (int i = 0; i < l1Cards.length; i++)
                  SidebarCard(
                    l1Card: l1Cards[i],
                    index: i,
                    onPressedSidebarCard: onPressedSidebarButton,
                  )
                //Text(
                // i.cardName,
                // style: const TextStyle(color: Colors.white),
              ],
            ),
          ),
          Center(
            child: () {
              if (currentCardSelection != 0) {
                return Container(
                  width: 160,
                  color: Colors.indigo,
                  child: ListView(
                    children: [
                      for (L2Card l2 in l1Cards[currentCardSelection].subCards)
                        Text(l2.cardName)
                    ],
                  ),
                );
              }
            }(),
          ),
          const Expanded(
            child: Center(
              child: Text("Main area"),
            ),
          ),
        ],
      ),
    );
  }
}

class L1Card {
  final String cardName;
  final Icon cardIcon;
  final List<L2Card> subCards;

  const L1Card({
    required this.cardIcon,
    required this.cardName,
    required this.subCards,
  });
}

class L2Card {
  final String cardName;
  final Icon cardIcon;

  const L2Card({
    required this.cardIcon,
    required this.cardName,
  });
}

class SidebarCard extends StatelessWidget {
  const SidebarCard({
    super.key,
    required this.l1Card,
    required this.index,
    required this.onPressedSidebarCard,
  });
  final L1Card l1Card;
  final int index;
  final IndexCallBack onPressedSidebarCard;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
      ),
      onPressed: () => onPressedSidebarCard(index),
      child: Row(
        children: [
          l1Card.cardIcon,
          const SizedBox(
            width: 10,
          ),
          Text(
            l1Card.cardName,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
