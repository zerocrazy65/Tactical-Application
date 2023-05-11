import 'package:flutter/material.dart';
import '../components/modePage.dart';
import '../models/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePagePageState();
}

class HomePagePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Select Mode To Practice'),
      ),
      body: Stack(
        children: [
          Container(
              height: 250,
              width: double.infinity,
              color: ColorTheme.bgGreenColor),
          Opacity(
            opacity: 0.05,
            child: Container(
              height: 1000,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/bgApp1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: ColorTheme.whiteBgColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: ColorTheme.greyOpaColor,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        for (int i = 1; i <= 3; i++)
                          Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => i == 1
                                              ? const ModePage(
                                                  modeName:
                                                      'Shooting Practice Mode',
                                                  modeNum: 1,
                                                )
                                              : i == 2
                                                  ? const ModePage(
                                                      modeName:
                                                          'Fast Shot Mode',
                                                      modeNum: 2,
                                                    )
                                                  : i == 3
                                                      ? const ModePage(
                                                          modeName:
                                                              'Hostage Rescue Mode',
                                                          modeNum: 3,
                                                        )
                                                      : Container(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          i == 1
                                              ? const Icon(Icons.flash_on)
                                              : i == 2
                                                  ? const Icon(Icons.adjust)
                                                  : i == 3
                                                      ? const Icon(
                                                          Icons.people_outline)
                                                      : Container(),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          i == 1
                                              ? const Text(
                                                  'Shooting Practice Mode')
                                              : i == 2
                                                  ? const Text('Fast Shot Mode')
                                                  : i == 3
                                                      ? const Text(
                                                          'Hostage Rescue Mode')
                                                      : Container(),
                                        ],
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
