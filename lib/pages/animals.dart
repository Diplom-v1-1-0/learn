import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class Animal {
  final String name;
  final String nameAssets;
  final String svgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Animal({
    required this.name,
    required this.svgAsset,
    required this.soundAsset,
    required this.backgroundColor,
    required this.nameAssets,
  });
}

class AnimalsPage extends StatelessWidget {
  final List<Animal> animals = [
    Animal(
      name: 'Муур',
      svgAsset: 'assets/images/cat.svg',
      nameAssets: 'assets/sounds/cat.wav',
      soundAsset: 'assets/sounds/cat_sound.wav',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Буга',
      svgAsset: 'assets/images/deer.svg',
      nameAssets: 'assets/sounds/buga.wav',
      soundAsset: 'assets/sounds/deer_sound.mp3',
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Animal(
      name: 'Баавгай',
      svgAsset: 'assets/images/bear.svg',
      nameAssets: 'assets/sounds/baavgai.wav',
      soundAsset: 'assets/sounds/bear_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Animal(
      name: 'Анааш',
      svgAsset: 'assets/images/giraffe.svg',
      nameAssets: 'assets/sounds/anaash.wav',
      soundAsset: 'assets/sounds/giraffe_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Animal(
      name: 'Ямаа',
      svgAsset: 'assets/images/goat.svg',
      nameAssets: 'assets/sounds/ymaa.wav',
      soundAsset: 'assets/sounds/goat_sound.mp3',
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Animal(
      name: 'Kенгуру',
      svgAsset: 'assets/images/kangaroo.svg',
      nameAssets: 'assets/sounds/kenguru.wav',
      soundAsset: 'assets/sounds/kangaroo_sound.mp3',
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Animal(
      name: 'Сармагчин',
      svgAsset: 'assets/images/monkey.svg',
      nameAssets: 'assets/sounds/sarmagchin.wav',
      soundAsset: 'assets/sounds/monkey_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Гахай',
      svgAsset: 'assets/images/pig.svg',
      nameAssets: 'assets/sounds/pig.wav',
      soundAsset: 'assets/sounds/pig_sound.mp3',
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Animal(
      name: 'Хонь',
      svgAsset: 'assets/images/sheep.svg',
      nameAssets: 'assets/sounds/honi.wav',
      soundAsset: 'assets/sounds/sheep_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Animal(
      name: 'Могой',
      svgAsset: 'assets/images/snake.svg',
      nameAssets: 'assets/sounds/mogoi.wav',
      soundAsset: 'assets/sounds/snake_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Animal(
      name: 'Хэрэм',
      svgAsset: 'assets/images/squirrel.svg',
      nameAssets: 'assets/sounds/herem.wav',
      soundAsset: 'assets/sounds/squirrel_sound.mp3',
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Animal(
      name: 'Бар',
      svgAsset: 'assets/images/tiger.svg',
      nameAssets: 'assets/sounds/bar.wav',
      soundAsset: 'assets/sounds/tiger_sound.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Animal(
      name: 'Алаг тахь',
      svgAsset: 'assets/images/zebra.svg',
      soundAsset: 'assets/sounds/zebra_sound.mp3',
      nameAssets: 'assets/sounds/alagtahi.wav',
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Animal(
      name: 'Нохой',
      svgAsset: 'assets/images/dog.svg',
      nameAssets: 'assets/sounds/dog.wav',
      soundAsset: 'assets/sounds/dog_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 33, 149, 243),
    ),
    Animal(
      name: 'Заан',
      svgAsset: 'assets/images/elephant.svg',
      nameAssets: 'assets/sounds/elephant.wav',
      soundAsset: 'assets/sounds/elephant_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Animal(
      name: 'Морь',
      svgAsset: 'assets/images/horse.svg',
      nameAssets: 'assets/sounds/horse.wav',
      soundAsset: 'assets/sounds/horse_sound.mp3',
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Animal(
      name: 'Арслан',
      svgAsset: 'assets/images/lion.svg',
      nameAssets: 'assets/sounds/arslan.wav',
      soundAsset: 'assets/sounds/lion_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 43, 197, 35),
    ),
    Animal(
      name: 'Туулай',
      svgAsset: 'assets/images/rabbit.svg',
      nameAssets: 'assets/sounds/tuulai.wav',
      soundAsset: 'assets/sounds/rabbit_sound.mp3',
      backgroundColor: const Color.fromARGB(156, 243, 33, 236),
    ),
  ];

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  AnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Амьтан',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showAnimalPopup(context, animals[index], index);
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: animals[index].backgroundColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(animals[index].svgAsset),
                  ),
                  const SizedBox(width: 28.0),
                  Text(
                    animals[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: 'Comic',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showAnimalPopup(
      BuildContext context, Animal animal, int currentIndex) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.setLanguage("mn-MN");
    await flutterTts.setPitch(1.0);

    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return AnimalPopup(
          animal: animal,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
          animals: animals,
          currentIndex: currentIndex,
        );
      },
    );
  }
}

// ignore: must_be_immutable
class AnimalPopup extends StatefulWidget {
  Animal animal;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;
  final List<Animal> animals;

  int currentIndex;

  AnimalPopup({
    Key? key,
    required this.animal,
    required this.flutterTts,
    required this.audioPlayer,
    required this.animals,
    required this.currentIndex,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimalPopupState createState() => _AnimalPopupState();
}

class _AnimalPopupState extends State<AnimalPopup> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.animal.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              _playAnimalSound(widget.animal.nameAssets);
            },
            icon: const Icon(Icons.volume_up),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                widget.animal.svgAsset,
                // ignore: deprecated_member_use
                color: isTapped ? const Color.fromARGB(81, 118, 96, 94) : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _playAnimalSound(widget.animal.soundAsset);
            },
            child: const Text('Дуу тоглуулах'),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _navigateToPreviousAnimal();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(
                width: 135,
              ),
              IconButton(
                onPressed: () {
                  _navigateToNextAnimal();
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          )
        ],
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            _stopAnimalSound();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Хаах',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _navigateToPreviousAnimal() {
    setState(() {
      widget.currentIndex = (widget.currentIndex - 1) % widget.animals.length;
      if (widget.currentIndex < 0) {
        widget.currentIndex = widget.animals.length - 1;
      }
      widget.animal = widget.animals[widget.currentIndex];
    });
  }

  void _navigateToNextAnimal() {
    setState(() {
      widget.currentIndex = (widget.currentIndex + 1) % widget.animals.length;
      widget.animal = widget.animals[widget.currentIndex];
    });
  }

  Future<void> _playAnimalSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }

  Future<void> _stopAnimalSound() async {
    await widget.audioPlayer.stop();
  }
}
