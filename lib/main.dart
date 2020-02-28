import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tipco/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topContainer(),
              _bottomContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 8,
          spreadRadius: 0,
          offset: Offset(0, 2),
        )
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildRecommendedTitle(),
          Container(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //lets build static children. Ideally you would use listview.buider here

                _recommendedHotel(hotelOne, 'Court Yard Villas.'),
                _recommendedHotel(hotelTwo, 'Villa Rosa Kempinski.'),
                _recommendedHotel(hotelThree, 'Ole Sereni Luxuries Resort.'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _recommendedHotel(imageUrl, hotelName) {
    return Container(
      margin: EdgeInsets.all(16),
      width: 270,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 1,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 140,
                  width: 270,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    gradient: redGradient,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                child: Text(
                  'Ksh 34,899',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          _hotelTitle(hotelName),
          SizedBox(height: 6),
          _hotelRatings(),
          SizedBox(height: 6),
          _hotelSubtitle(),
        ],
      ),
    );
  }

  Widget _hotelTitle(hotelName) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        hotelName,
        style: GoogleFonts.firaSans(
            textStyle: TextStyle(
          color: Colors.grey[850],
          fontWeight: FontWeight.w400,
          fontSize: 18,
        )),
      ),
    );
  }

  Widget _hotelSubtitle() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        'Karen Estate, Nairobi',
        style: GoogleFonts.firaSans(
            textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey[850],
          fontSize: 14,
        )),
      ),
    );
  }

  Widget _hotelRatings() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: SmoothStarRating(
        allowHalfRating: false,
        onRatingChanged: (v) {
          //SET STATE

        },
        starCount: 5,
        rating: 4,
        size: 22,
        filledIconData: Icons.lens,
        defaultIconData: Icons.panorama_fish_eye,
        halfFilledIconData: Icons.panorama_fish_eye,
        color: Colors.green,
        borderColor: Colors.green,
        spacing: 0.0,
      ),
    );
  }

  Widget _buildRecommendedTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'RECOMMENDED HOTELS FOR YOU',
        style: GoogleFonts.firaSans(
            textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        )),
      ),
    );
  }

  Widget _topContainer() {
    return Container(
      // height: 400, nO longer needed
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          _topBarRow(),
          SizedBox(height: 48),
          Text(
            'Let\'s Trip to anywhere \nin the world',
            style: GoogleFonts.firaSans(
                textStyle: TextStyle(
              fontSize: 26,
              color: Colors.grey[900],
              fontWeight: FontWeight.w500,
            )),
          ),
          SizedBox(height: 48),
          _searchBox(),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _menuSelector(Icons.airline_seat_flat, redGradient, 'Hotel'),
              _menuSelector(Icons.hot_tub, blueGradient, 'Villa'),
              _menuSelector(Icons.restaurant, tealGradient, 'Food'),
              _menuSelector(Icons.star, yellowGradient, 'Experience'),
            ],
          ),
          SizedBox(height: 24),
          _offerBanner(),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _offerBanner() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.local_offer, color: Colors.red[900], size: 18),
          Text(
            ' Get Ksh 99 off. ',
            style: GoogleFonts.firaSans(
                textStyle: TextStyle(
              fontSize: 16,
              color: Colors.red[900],
              fontWeight: FontWeight.w500,
            )),
          ),
          Text(
            ' Hurry ! Limited period offer. ',
            style: GoogleFonts.firaSans(
                textStyle: TextStyle(
              fontSize: 16,
              color: Colors.red[400],
              fontWeight: FontWeight.w400,
            )),
          ),
        ],
      ),
    );
  }

  Widget _menuSelector(IconData iconName, bgGradient, title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: bgGradient,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 8),
                color: Colors.lightBlue[50],
                spreadRadius: 8,
                blurRadius: 8,
              )
            ],
          ),
          child: Center(
            child: Icon(
              iconName,
              size: 44,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.firaSans(
              textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
            fontSize: 16,
          )),
        ),
      ],
    );
  }

  Widget _searchBox() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon:
            Icon(Icons.trip_origin, size: 18, color: Colors.lightBlueAccent),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(36)),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
        hintText: 'Search your locale here,Nairobi',
        fillColor: Colors.white70,
      ),
    );
  }

  Widget _topBarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.menu,
          size: 24,
          color: Colors.black,
        ),
        Text(
          'tipco',
          style: GoogleFonts.firaSans(
              textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.lightBlueAccent,
            fontSize: 38,
          )),
        ),
        Icon(
          Icons.more_vert,
          size: 24,
          color: Colors.black,
        ),
      ],
    );
  }
}
