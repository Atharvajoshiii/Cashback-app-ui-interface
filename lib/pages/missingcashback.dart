import 'package:flutter/material.dart';

class MissingCashback extends StatelessWidget {
  MissingCashback({super.key});
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("missing cashback ?"),
        backgroundColor: Colors.blue,
        
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Missing Cashback ?",style: 
              TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("We are here to help , please follow these simple steps to help us track your cashback (takes seconds only)",style: TextStyle(
              fontSize: 18
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 190,
              width: screenWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(60, 176, 175, 175)
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Did You Shop ?",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  TextButton(style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)
                  ),onPressed: (){

                  }, child: Text("Yes"),),
                  TextButton(style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)
                  ),onPressed: (){

                  }, child: Text("No"),),


                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}