import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todowebapp/api/google_sign_in_api.dart';
import 'package:todowebapp/auth/loginscreen.dart';
import 'package:todowebapp/pages/detialscreen.dart';

class FoodAppHome extends StatelessWidget {
  const FoodAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TopBar(),
                SearchInput(),
                PromoImage(path: "images/amazonpromocard.jpg",),
                SizedBox(
                  height: 20,
                ),
                Headline(),
                CardListView(),
                PromoImage(path: "images/swiggypromo.png",),
                SizedBox(height: 20,),
                PromoImage(path: "images/zomatopromo.jpeg",),
                SizedBox(height: 20,),
                PromoImage(path: "images/swiggypromo2.jpg",),
              ],
            ),
          ),
        ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  void logout() {
    // Implement your logout logic here
    print('Logout function called');
    // For example, you might want to navigate to the login screen
    // Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Offer Connect",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () async {
              await GoogleSignInApi.logout();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }, // Call the logout function when tapped
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.logout,
                size: 25,
                color: Color(0xff53E88B),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}



class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "The best for you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        
      ],
    );
  }
}

class PromoImage extends StatelessWidget {
  final String path;
  const PromoImage({Key? key,required this.path});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 180,
      width: screenWidth,
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.fill, // Ensure the image covers the whole container
      ),
    );
  }
}

class SHeadline extends StatelessWidget {
  const SHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Menu",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "The best food for you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Text(
          "View More",
          style: TextStyle(
              color: Color(0xff15BE77), fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
          Card(
              'Fashion',
              FontAwesomeIcons.shirt,
              
          ),
          Card(
              'Food',
              Icons.food_bank,
              
          ),
          Card(
              'Mobile',
              FontAwesomeIcons.mobile,
              
          ),
          Card(
              'banking',
              FontAwesomeIcons.piggyBank,
              
          ),
          
          Card(
              'health',
              FontAwesomeIcons.suitcaseMedical,
              
          ),
            
            
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final IconData icon;
  

  const Card(this.text, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 70,
              color: Color.fromARGB(255, 236, 116, 95),
            ),
            const Spacer(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
