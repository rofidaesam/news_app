import 'dart:ui';

class Catagory {
  String id;
  String title;
  String imagePath;
  Color color;
//
  Catagory(
      {required this.title,
      required this.color,
      required this.imagePath,
      required this.id});
  static List<Catagory> getCategories() {
    return [
      Catagory(
          title: 'Business',
          color: Color(0xffbacCF7E48),
          imagePath: 'assets/images/business.png',
          id: 'business'),
      Catagory(
          title: 'Enviroment',
          color: Color(0xffbac4882CF),
          imagePath: 'assets/images/environment.png',
          id: 'entertainment'),
      Catagory(
          title: 'Sports',
          color: Color(0xffC91C22),
          imagePath: 'assets/images/ball.png',
          id: 'health'),
      Catagory(
          title: 'Science',
          color: Color(0xffF2D352),
          imagePath: 'assets/images/science.png',
          id: 'science'),
      Catagory(
          title: 'Politics',
          color: Color(0xff003E90),
          imagePath: 'assets/images/Politics.png',
          id: 'technology'),
      Catagory(
          title: 'Health',
          color: Color(0xffED1E79),
          imagePath: 'assets/images/health.png',
          id: 'health'),
    ];
  }
}
