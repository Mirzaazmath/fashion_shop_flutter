import 'package:fashion_shop_flutter/providers/size_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mycart_screen.dart';
List<String>sizeList=["S", "M", "L", "XL","XXL","Custom"];
  class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(

          children: [
          Container(
        color: Colors.black,

            child: Container(
              height: 450,

              decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))

              ),
              child: Column(
                children: [
                  const  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(child: Text("Slim Fit\nHooded T-Shirt",style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold,color: Colors.black),)),
                        const SizedBox(width: 30,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(),
                            ),
                            child:const  Icon(Icons.arrow_back),
                          ),
                        ),

                      ],
                    ),

                  ),
                  Consumer<SizeProvider>(
                    builder: (context,provider,widget) {
                      return AnimatedContainer(
                        duration:const  Duration(milliseconds: 300),
                        curve: Curves.fastEaseInToSlowEaseOut,


                        height:  getSize(provider.size),

                        child:  Hero(
                          tag: "shirt1",
                            child: Image.asset("assets/shirt1.png")),);
                    }
                  ),
                  const Spacer(),
                  // const  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 30,
                        child: Consumer<SizeProvider>(
                          builder: (context,provider,widget) {
                            return Row(
                              children: [
                                for(int i=0;i<sizeList.length;i++)...[
                                 GestureDetector(
                                   onTap: (){
                                     provider.updateSize(sizeList[i]);
                                   },
                                   child:  Container(
                                     height: 40,
                                     padding:const  EdgeInsets.symmetric(horizontal: 15),
                                     margin:const  EdgeInsets.symmetric(horizontal: 10),
                                     decoration: BoxDecoration(
                                       color: sizeList[i]==provider.size?Colors.black:Colors.transparent,
                                       borderRadius: BorderRadius.circular(35),
                                       border: Border.all(),
                                     ),
                                     alignment: Alignment.center,
                                     child: Text(sizeList[i],style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color:sizeList[i]==provider.size?Colors.white: Colors.black)),
                                   ),
                                 )
                                ]
                              ],

                            );
                          }
                        ),
                      ),
                    ),
                  ),
                  const  SizedBox(height: 20,),
                ],
              ),
            ),
          ),





            Stack(
              children: [
                Container(
                  color: Colors.black,
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    margin:const  EdgeInsets.symmetric(horizontal: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("01",style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                                   const  SizedBox(height: 5,),
                                    Container(
                                      height: 40,
                                      padding:const  EdgeInsets.symmetric(horizontal: 15),
                                      margin:const  EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color:Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(color: Colors.grey.shade300),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("\$1500",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color:Colors.black)),
                                    )


                                  ],
                                ),


                      ],
                    ),

                  ),
                ),
                Positioned(
                        right: -50,
                        child: ClipOval(
                          child: GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              width: 120,
                              height: 100,
                              color: Colors.black,
                              alignment: Alignment.centerLeft,
                              child:const Icon(Icons.add,color: Colors.white,size: 30,),
                                


                            ),
                          ),
                        ),
                      ),
                Positioned(
                  left: -50,
                  child: ClipOval(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        width: 120,
                        height: 100,
                        color: Colors.black,
                        alignment: Alignment.centerRight,
                        child:const Icon(Icons.remove,color: Colors.white,size: 30,),
                      ),
                    )
                  ),
                ),
              ],
            ),
        Expanded(child: Container(
          color: Colors.black,
          child: Container(

            decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))
            ),
            child: Column(
              children: [
                const    Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyCartScreen()));
                  },
                  child: Container(
                    margin:const  EdgeInsets.symmetric(horizontal: 25),

                    height: 50,
                    padding:const  EdgeInsets.only(left: 20,right: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add to Cart",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                        Container(
                          padding:const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white

                          ),
                          child: const Icon(Icons.add_shopping_cart_outlined),
                        )
                      ],
                    ),

                  ),
                ),
                const  SizedBox(height: 25,)],
            ),
          ),
        ))

          ],
        ),
      )



    );
  }
}
getSize(value){
    switch(value){
      case "S":{
        return 200.0;
      }
      case "M":{
        return 220.0;
      }
      case "L":{
        return 240.0;
      }
      case "XL":{
        return 260.0;
      }
      case "XXL":{
        return 280.0;
      }
      case "Custom":{
        return 180.0;
      }
    }
}
