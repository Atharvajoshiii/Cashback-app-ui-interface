import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:todowebapp/colors/colors.dart";
import "package:todowebapp/assets/assets.dart";



class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C A S H I F Y",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: kWhitePrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 45, bottom: 10, left: 20, right: 20),
            child: Text(
              "What Would you like to travel?",
              style: kMainHead.copyWith(
                  color: kBlack, fontWeight: kBoldFontWeight),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: kGreyOutlined,
                borderRadius: BorderRadius.circular(kFullRadius)),
            child: Center(
              child: TextFormField(
                autofocus: false,
                cursorHeight: 15,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  border: InputBorder.none,
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ChoiceChipWidget(),
          ),
          Expanded(
            child: GridView.custom(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 2,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(5 / 7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => CityCard(
                        city: citiesList[index],
                      ),
                  childCount: citiesList.length),
            ),
          )
        ],
      ),
    );
  }
}

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({Key? key}) : super(key: key);

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  List<String>? _choices;
  int? _defaultChoiceIndex;
  Color? iColor;

  @override
  void initState() {
    _choices = ['All', 'Flight', 'Cruise', 'Train', 'Bus'];
    _defaultChoiceIndex = 0;
    iColor = Colors.grey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _choices!.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              label: Text(_choices![index],
                  style: kCityStyle.copyWith(
                      color:
                          _defaultChoiceIndex == index ? Colors.white : iColor,
                      fontWeight: FontWeight.w400)),
              selected: _defaultChoiceIndex == index,
              selectedColor: kPinkColor,
              backgroundColor: kGreyOutlined,
              onSelected: (bool selected) {
                setState(() {
                  _defaultChoiceIndex = selected ? index : 0;
                });
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final Cities city;
  const CityCard({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Hero(
          tag: city.imagePath,
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      city.imagePath,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(children: [
                Positioned(
                  left: 10,
                  bottom: 20,
                  child: Text(
                    city.cityName,
                    style: kCityStyle.copyWith(
                        color: kWhitePrimary, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kFullRadius),
                        color: kWhitePrimary,
                      ),
                      height: 40,
                      width: 60,
                      child: Center(
                          child: Text("${city.priceInDollars}".toString(),
                              style: kPrizeStyleDevice.copyWith(
                                  color: kBlack, fontWeight: FontWeight.w500))),
                    )),
              ])),
        ));
  }
}

class Cities {
  String cityName;
  String imagePath;
  int priceInDollars;
  Cities({
    required this.cityName,
    required this.imagePath,
    required this.priceInDollars,
  });
}

Cities newYork = Cities(
  cityName: 'New York',
  imagePath: 'https://images.unsplash.com/photo-1511527661048-7fe73d85e9a4?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  priceInDollars: 100,
);
Cities paris = Cities(
  cityName: 'Paris',
  imagePath: 'https://images.unsplash.com/photo-1554939437-ecc492c67b78?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  priceInDollars: 120,
);

Cities italy = Cities(
  cityName: 'Italy',
  imagePath: 'https://images.unsplash.com/photo-1549643276-fdf2fab574f5?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  priceInDollars: 150,
);
Cities rome = Cities(
  cityName: 'Rome',
  imagePath: 'https://images.unsplash.com/photo-1504019347908-b45f9b0b8dd5?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  priceInDollars: 225,
);
Cities spain = Cities(
  cityName: 'Spain',
  imagePath: 'https://images.unsplash.com/photo-1509840841025-9088ba78a826?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  priceInDollars: 150,
);

List<Cities> citiesList = [newYork, paris, italy, rome, spain];

