import 'package:flutter/material.dart';
import 'package:myproject/Models/Places.dart';

import '../Models/data.dart';

class Detiles extends StatelessWidget {
  final Places place;
  const Detiles({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(place.imgUrl!, height: 300, fit: BoxFit.cover),
              AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.white),
                  leading: Icon(Icons.arrow_back_ios),
                  actions: [
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.more_vert,
                            color: Colors.white, size: 30))
                  ])
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  place.discrption!,
                  style: TextStyle(height: 1.5),
                ),
                const SizedBox(
                  height: 15,
                ),
                Picture(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Picture extends StatelessWidget {
  List<Places> MapToModelConverter() {
    return Appdata.map((e) => Places.fromMap(e)).toList();
  }

  // function 2
  List<Widget> ModelToWidgetConverter() {
    List<Places> places = MapToModelConverter();
    List<Widget> picturWidgets = places.take(4).map((e) => pic(e)).toList();
    return picturWidgets;
  }

  Picture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Picture",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: ModelToWidgetConverter(),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "+${Appdata.length - 4}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Text(
            "More in Bali >",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}

class pic extends StatelessWidget {
  Places place;
  pic(this.place);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detiles(
                      place: place,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            place.imgUrl!,
            width: 65,
            height: 65,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
