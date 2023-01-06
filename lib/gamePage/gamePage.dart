import 'package:flutter/material.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame>
    with SingleTickerProviderStateMixin {
  int tapPoint = 0;
  int tapPointMultiplier = 1;
  int tapCounter = 0;
  int tapMultiplierFromRebirth = 0;
  int rebirthCount = 0;
  int tapMultiplierFromUpgrades = 0;
  int upgradeLvl = 0;
  late int upgradeRequirement1;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  late TabController tabController;



  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    upgradeRequirement1 = tapPointMultiplier * 25;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 116, 179, 1),
      appBar: AppBar(
        title: const Text('Tapping Simulator'),
        backgroundColor: const Color.fromRGBO(10, 38, 71, 1),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Icon(Icons.gamepad),
            ),
            Tab(
              child: Icon(Icons.arrow_upward_rounded),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          gameTab(),
          upgradeTab(),
        ],
      ),
    );
  }

  Widget gameTab() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(100, 100),
                  topLeft: Radius.elliptical(100, 100)),
              color: Color.fromRGBO(10, 38, 71, 1),
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(100, 100),
                  topLeft: Radius.elliptical(100, 100)),
              color: Color.fromRGBO(32, 82, 149, 1),
            ),
          ),
        ),
        Positioned(
          top: deviceHeight(context) * 0.05,
          width: deviceWidth(context),
          height: 115,
          child: Container(
            margin: const EdgeInsets.only(left: 70, right: 70),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(40, 40),
                topRight: Radius.elliptical(40, 40),
              ),
              color: Color.fromRGBO(20, 66, 114, 1),
            ),
            child: Center(
              child: Text(
                '$tapPoint',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: deviceHeight(context) * 0.21,
          height: 50,
          width: deviceWidth(context),
          child: Container(
            margin: const EdgeInsets.only(left: 90, right: 90),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(40, 40),
                bottomRight: Radius.elliptical(40, 40),
              ),
              color: Color.fromRGBO(44, 116, 179, 1),
            ),
            child: const Center(
              child: Text(
                'Tap Points',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: deviceHeight(context) * 0.5,
          left: deviceWidth(context) * 0.3,
          height: 75,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(44, 116, 179, 1),
            ),
            onPressed: () {
              setState(() {
                tapPoint = tapPoint + tapPointMultiplier;
              });
            },
            child: const Text(
              'TAP for TAP POINTS!',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget upgradeTab() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin:
            const EdgeInsets.only(top: 25, bottom: 20, left: 25, right: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(10, 38, 71, 1),
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin:
            const EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(32, 82, 149, 1),
            ),
          ),
        ),
        Positioned(
          height: 85,
          width: 340,
          top: deviceHeight(context) * 0.05,
          left: deviceWidth(context) * 0.08,
          child: Card(
            color: const Color.fromRGBO(44, 116, 179, 1),
            child: ListTile(
              title: const Text('MORE TAAAAAP!'),
              subtitle: Text('Required:$upgradeRequirement1'),
              leading: const Icon(Icons.plus_one_rounded),
              trailing: const Icon(Icons.plus_one_rounded),
              onTap: () {
                if (tapPoint == upgradeRequirement1) {
                  setState(() async {
                    tapPointMultiplier++;
                    tapPoint - upgradeRequirement1;
                    tapPoint;
                    upgradeRequirement1 = tapPointMultiplier;
                    upgradeRequirement1;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
