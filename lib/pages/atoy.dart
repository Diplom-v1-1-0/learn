import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:just_audio/just_audio.dart';

class ItemTile extends StatelessWidget {
  final int index;
  final List<ItemData> items;
  final bool isTimerEnabled;
  final AudioPlayer audioPlayer;
  const ItemTile({
    super.key,
    required this.index,
    required this.items,
    required this.isTimerEnabled,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    final item = items[index];
    return Card(
      color: item.backgroundColor,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return _PopupContent(
                items: items,
                currentIndex: index,
                isAutoNextEnabled: isTimerEnabled,
                audioPlayer: audioPlayer,
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 3),
              SvgPicture.asset(
                item.iconAsset,
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 3),
              Text(item.description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopupContent extends StatefulWidget {
  final List<ItemData> items;
  final int currentIndex;
  final bool isAutoNextEnabled;
  final AudioPlayer audioPlayer;
  const _PopupContent({
    required this.items,
    required this.currentIndex,
    required this.isAutoNextEnabled,
    required this.audioPlayer,
  });

  @override
  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<_PopupContent> {
  late int currentIndex;
  Timer? timer;
  late bool isAutoNextEnabled;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    isAutoNextEnabled = widget.isAutoNextEnabled;
    audioPlayer = widget
        .audioPlayer; // Initialize audioPlayer with the provided audioPlayer

    if (isAutoNextEnabled) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
        _nextItem();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void _nextItem() {
    setState(() {
      if (currentIndex < widget.items.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = widget.items[currentIndex];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          color: currentItem.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          currentItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.volume_up,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () {
                          _playTitleSound(audioPlayer, currentItem.titleAsset);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      currentItem.iconAsset,
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentItem.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        _playTitleSound(audioPlayer, currentItem.descAsset);
                      },
                      child: const Text("Дуу тоглуулах")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _previousItem,
                        child: const Text('Өмнөх'),
                      ),
                      ElevatedButton(
                        onPressed: _nextItem,
                        child: const Text('Дараах'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(216, 233, 101, 92)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Хаах',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemData {
  final String iconAsset;
  final String title;
  final String description;
  final String titleAsset;
  final String descAsset;
  final Color backgroundColor;

  ItemData({
    required this.iconAsset,
    required this.title,
    required this.description,
    required this.titleAsset,
    required this.descAsset,
    required this.backgroundColor,
  });
}

class atoy extends StatefulWidget {
  const atoy({Key? key}) : super(key: key);

  @override
  State<atoy> createState() => _atoyState();
}

// ignore: camel_case_types
class _atoyState extends State<atoy> {
  bool isTimerEnabled = false;
  late AudioPlayer audioPlayer;
  List<ItemData> items = [
    ItemData(
      iconAsset: 'assets/images/apple.svg',
      title: 'А',
      titleAsset: "assets/sounds/a.wav",
      description: 'Алим',
      descAsset: "assets/sounds/apple.wav",
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: 'assets/images/ball.svg',
      title: 'Б',
      titleAsset: "assets/sounds/Б.wav",
      description: 'Бөмбөг',
      descAsset: "assets/sounds/ball.wav",
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/vase.svg',
      title: 'В',
      titleAsset: 'assets/sounds/В.wav',
      description: 'Ваар',
      descAsset: "assets/sounds/vaar.wav",
      backgroundColor: const Color.fromARGB(120, 100, 150, 50),
    ),
    ItemData(
      iconAsset: 'assets/images/pig.svg',
      title: 'Г',
      titleAsset: 'assets/sounds/Г.wav',
      description: 'Гахай',
      descAsset: "assets/sounds/pig.wav",
      backgroundColor: const Color.fromARGB(120, 238, 0, 255),
    ),
    ItemData(
      iconAsset: 'assets/images/kettle.svg',
      title: 'Д',
      titleAsset: 'assets/sounds/Д.wav',
      description: 'Данх',
      descAsset: "assets/sounds/danh.wav",
      backgroundColor: const Color.fromARGB(120, 164, 212, 246),
    ),
    ItemData(
      iconAsset: 'assets/images/egypt.svg',
      title: 'Е',
      titleAsset: 'assets/sounds/Е.wav',
      description: 'Египт',
      descAsset: "assets/sounds/egypt.wav",
      backgroundColor: const Color.fromARGB(120, 232, 190, 0),
    ),
    ItemData(
      iconAsset: 'assets/images/europe.svg',
      title: 'Ё',
      titleAsset: 'assets/sounds/Ё.wav',
      description: 'Ёвроп',
      descAsset: "assets/sounds/europe.wav",
      backgroundColor: const Color.fromARGB(120, 44, 75, 97),
    ),
    ItemData(
      iconAsset: 'assets/images/fruits.svg',
      title: 'Ж',
      titleAsset: 'assets/sounds/Ж.wav',
      description: 'Жимс',
      descAsset: "assets/sounds/fruits.wav",
      backgroundColor: const Color.fromARGB(120, 221, 222, 115),
    ),
    ItemData(
      iconAsset: 'assets/images/elephant.svg',
      title: 'З',
      titleAsset: 'assets/sounds/З.wav',
      description: 'Заан',
      descAsset: "assets/sounds/elephant.wav",
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(115, 66, 173, 127),
    ),
    ItemData(
      iconAsset: 'assets/images/irish.svg',
      title: 'И',
      titleAsset: 'assets/sounds/И.wav',
      description: 'Ирланд',
      descAsset: "assets/sounds/irland.wav",
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 20, 255, 145),
    ),
    ItemData(
      iconAsset: 'assets/images/pc.svg',
      title: 'К',
      titleAsset: 'assets/sounds/К.wav',
      description: 'Компьютер',
      descAsset: "assets/sounds/pc.wav",
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 96, 58, 230),
    ),
    ItemData(
      iconAsset: 'assets/images/candless.svg',
      title: 'Л',
      titleAsset: 'assets/sounds/Л.wav',
      description: 'Лаа',
      descAsset: 'assets/sounds/laa.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 227, 106, 0),
    ),
    ItemData(
      iconAsset: 'assets/images/cat.svg',
      title: 'М',
      titleAsset: 'assets/sounds/М.wav',
      description: 'Муур',
      descAsset: "assets/sounds/cat.wav",
      backgroundColor: const Color.fromARGB(194, 130, 243, 69),
    ),
    ItemData(
      iconAsset: 'assets/images/dog.svg',
      title: 'Н',
      titleAsset: 'assets/sounds/Н.wav',
      description: 'Нохой',
      descAsset: "assets/sounds/dog.wav",
      backgroundColor: const Color.fromARGB(115, 215, 199, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/tree.svg',
      title: 'О',
      titleAsset: 'assets/sounds/О.wav',
      descAsset: "assets/sounds/trees.wav",
      description: 'Ой',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 147, 226, 184),
    ),
    ItemData(
      iconAsset: 'assets/images/pants.svg',
      title: 'Ө',
      titleAsset: 'assets/sounds/Ө.wav',
      description: 'Өмд',
      descAsset: 'assets/sounds/omd.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 233, 195, 161),
    ),
    ItemData(
        iconAsset: 'assets/images/xerox.svg',
        title: 'П',
        titleAsset: 'assets/sounds/П.wav',
        backgroundColor: const Color.fromARGB(115, 0, 236, 71),
        description: 'Принтер',
        descAsset: 'assets/sounds/printer.wav'),
    ItemData(
      iconAsset: 'assets/images/radio.svg',
      title: 'Р',
      titleAsset: 'assets/sounds/Р.wav',
      description: 'Радио',
      descAsset: 'assets/sounds/radio.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 61, 50, 40),
    ),
    ItemData(
      iconAsset: 'assets/images/moon.svg',
      title: 'С',
      titleAsset: 'assets/sounds/С.wav',
      description: 'Сар',
      descAsset: 'assets/sounds/moon.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 134, 57, 217),
    ),
    ItemData(
        iconAsset: 'assets/images/parrot.svg',
        title: 'Т',
        titleAsset: 'assets/sounds/Т.wav',
        backgroundColor: const Color.fromARGB(115, 120, 118, 215),
        description: 'Тоть',
        descAsset: 'assets/sounds/toti.wav'),
    ItemData(
      iconAsset: 'assets/images/grapes.svg',
      title: 'У',
      titleAsset: 'assets/sounds/У.wav',
      backgroundColor: const Color.fromARGB(115, 215, 118, 175),
      descAsset: 'assets/sounds/jims.wav',
      description: 'Усан үзэм',
    ),
    ItemData(
      iconAsset: 'assets/images/nest.svg',
      title: 'Ү',
      titleAsset: 'assets/sounds/Ү.wav',
      description: 'Үүр',
      descAsset: 'assets/sounds/vvr.wav',
      backgroundColor: const Color.fromARGB(115, 118, 215, 121),
    ),
    ItemData(
      iconAsset: 'assets/images/flash.svg',
      title: 'Ф',
      titleAsset: 'assets/sounds/Ф.wav',
      description: 'Флаш',
      descAsset: 'assets/sounds/flash.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 224, 212, 237),
    ),
    ItemData(
        iconAsset: 'assets/images/king.svg',
        title: 'Х',
        titleAsset: 'assets/sounds/Х.wav',
        backgroundColor: const Color.fromARGB(115, 171, 215, 118),
        description: 'Хаан',
        descAsset: 'assets/sounds/king.wav'),
    ItemData(
        iconAsset: 'assets/images/window.svg',
        title: 'Ц',
        titleAsset: 'assets/sounds/Ц.wav',
        backgroundColor: const Color.fromARGB(246, 255, 194, 25),
        description: 'Цонх',
        descAsset: 'assets/sounds/windows.wav'),
    ItemData(
      iconAsset: 'assets/images/sledge.svg',
      title: 'Ч',
      titleAsset: 'assets/sounds/Ч.wav',
      description: 'Чарга',
      descAsset: 'assets/sounds/charga.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 221, 142, 52),
    ),
    ItemData(
        iconAsset: 'assets/images/table.svg',
        title: 'Ш',
        titleAsset: 'assets/sounds/Ш.wav',
        backgroundColor: const Color.fromARGB(180, 138, 64, 228),
        description: 'Ширээ',
        descAsset: 'assets/sounds/shiree.wav'),
    ItemData(
      iconAsset: 'assets/images/soup.svg',
      title: 'Щ',
      titleAsset: 'assets/sounds/Щ.wav',
      description: 'Борщ',
      descAsset: 'assets/sounds/borshts.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 234, 172, 101),
    ),
    ItemData(
      iconAsset: 'assets/images/spreads.svg',
      title: 'Ъ',
      titleAsset: 'assets/sounds/Ъ.wav',
      description: 'Таръя',
      descAsset: 'assets/sounds/tariya.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(249, 43, 228, 23),
    ),
    ItemData(
      iconAsset: 'assets/images/horse.svg',
      title: 'Ь',
      titleAsset: 'assets/sounds/Ь.wav',
      description: 'Морь',
      descAsset: 'assets/sounds/horse.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 233, 145, 46),
    ),
    ItemData(
      iconAsset: 'assets/images/elephant.svg',
      title: 'Ы',
      titleAsset: 'assets/sounds/Ы.wav',
      description: 'Зааны тугал',
      descAsset: 'assets/sounds/elephantbaby.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 103, 248, 185),
    ),
    ItemData(
      iconAsset: 'assets/images/butterfly.svg',
      title: 'Э',
      titleAsset: 'assets/sounds/Э.wav',
      description: 'Эрвээхэй',
      descAsset: 'assets/sounds/butterfly.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 238, 0, 255),
    ),
    ItemData(
      iconAsset: 'assets/images/hoodie.svg',
      title: 'Ю',
      titleAsset: 'assets/sounds/Ю.wav',
      description: 'Юүдэнтэй цамц',
      descAsset: 'assets/sounds/hoodie.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 255, 114, 114),
    ),
    ItemData(
      iconAsset: 'assets/images/deer.svg',
      title: 'Я',
      titleAsset: 'assets/sounds/Я.wav',
      description: 'Янзага',
      descAsset: 'assets/sounds/ynzaga.wav',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 253, 200, 23),
    ),
  ];
  @override
  void initState() {
    super.initState();
    isTimerEnabled = false;
    audioPlayer = AudioPlayer(); // Initialize audioPlayer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'А-Я',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isTimerEnabled
                        ? MaterialStateProperty.all(Colors.green)
                        : MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    setState(() {
                      isTimerEnabled = !isTimerEnabled;
                    });
                  },
                  child: const Text(
                    'Auto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for (int i = 0; i < items.length; i++)
              ItemTile(
                index: i,
                items: items,
                isTimerEnabled: isTimerEnabled,
                audioPlayer: AudioPlayer(),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const atoy());
}

Future<void> _playTitleSound(AudioPlayer audioPlayer, String soundAsset) async {
  await audioPlayer.setAsset(soundAsset);
  await audioPlayer.play();
}
