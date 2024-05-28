import 'package:dio/dio.dart';
import 'package:film_at_night/consts/app_const.dart';
import 'package:film_at_night/models/email_model.dart';
import 'package:film_at_night/models/movie_model.dart';
import 'package:film_at_night/save_api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color colormain = Colors.blue.shade100;
  String namefilms = 'Выбирите фильм';
  String image =
      'https://images.vexels.com/media/users/3/321264/isolated/preview/cfabfc57c1ea0517d56456ad31b4bc51-cinema-camera-icon.png';
  double rating = 0;
  String ratingText = 'Для просмотра';
  String countryfilm = '';
  final TextEditingController controller = TextEditingController();
  String actor = '';
  String year = '';
  String plot = '';
  String writer = '';
  String genre = '';

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerFromName = TextEditingController();
  TextEditingController controllerMessage = TextEditingController();
  String sendData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: colormain,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 140, right: 120, bottom: 15),
                      child: Positioned(
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/4230/4230745.png',
                        ),
                      ),
                    ),
                    Text(
                      'Technical support',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          'If you have something problems,you must write here ⬇️'),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: controllerName,
                        decoration: InputDecoration(
                            hintText: 'To name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: controllerFromName,
                        decoration: InputDecoration(
                            hintText: 'From name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        maxLines: 6,
                        controller: controllerMessage,
                        decoration: InputDecoration(
                            hintText: 'Message',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(sendData),
                    ElevatedButton(
                        onPressed: () {
                          sendEmail();
                        },
                        child: Text(
                          'Send ➡️',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: colormain,
        appBar: AppBar(
          backgroundColor: colormain,
          title: TextField(
            onChanged: (value) {
              getData(value);
            },
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: '   Введите название фльма 🍿🎬',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                namefilms == ''
                    ? Text(
                        'Такого фильма не существует',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      )
                    : Text(
                        namefilms,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                SizedBox(
                  height: 20,
                ),
                image == ''
                    ? Image.network(
                        'https://cdn-icons-png.freepik.com/256/4516/4516955.png?semt=ais_hybrid')
                    : Image.network(image),
                SizedBox(
                  height: 20,
                ),
                rating == 0
                    ? Text(
                        '...',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      )
                    : Center(
                        child: RatingBar.builder(
                          itemSize: 33,
                          initialRating: rating,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 10,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ratingText,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(countryfilm,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    textAlign: TextAlign.center,
                    actor,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    textAlign: TextAlign.center,
                    year,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    textAlign: TextAlign.center,
                    writer,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 30,
                ),
                Text(
                    textAlign: TextAlign.center,
                    plot,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 30,
                ),
                Text(
                    textAlign: TextAlign.center,
                    genre,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ));
  }

  Future<void> getData(String title) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get('http://www.omdbapi.com/',
          queryParameters: {"apikey": ApiKey.apikey, "t": title});
      final result = MovieModel.fromJson(response.data);
      image = result.poster ?? '';
      namefilms = result.title ?? '';
      ratingText = result.ratings?[0].value ?? '';
      rating = double.tryParse(result.imdbRating ?? '') ?? 0;
      countryfilm = result.country ?? '';
      actor = result.actors ?? '';
      year = result.year ?? '';
      plot = result.plot ?? '';
      writer = result.writer ?? '';
      genre = result.genre ?? '';
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Colors.red.shade300,
                content: Text(
                    'Check your network connection'), /////////////////////Здесь доделать можно ///////////////
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ok')),
                      ElevatedButton(onPressed: () {}, child: Text('Help'))
                    ],
                  ),
                ],
                title: Center(child: Text('Network error')),
              ));
    }

    setState(() {});
  }

  Future<void> sendEmail() async {
    final Dio dio = Dio();

    try {
      await dio.post("https://api.emailjs.com/api/v1.0/email/send",
          data: EmailModal(
              serviceId: AppConts.servicId,
              templateId: AppConts.templeteId,
              userId: AppConts.userId,
              accessToken: AppConts.accessToken,
              templateParams: TemplateParams(
                date: DateTime.now().toString(),
                fromName: controllerFromName.text,
                toName: controllerName.text,
                message: controllerMessage.text,
              )).toJson());
    } catch (e) {
      print(e.toString());
    }
  }
}
