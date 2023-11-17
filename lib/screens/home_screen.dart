import 'package:fashion_shop_flutter/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

List<String>optionList=["ALL","T-Shirt","Jacket","Shoes","Pants"];


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Order From The Best Of Fashion",style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold,color: Colors.black),)),
                  const SizedBox(width: 30,),
                  Container(
                    height: 80,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(),
                    ),
                    child:const  Icon(Icons.filter_list),
                  ),

                ],
              ),
             const  SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 50,
                  child: Consumer<CategoryProvider>(
                    builder: (context,provider,widget) {
                      return Row(
                        children: [
                          for(int i=0;i<optionList.length;i++)...[
                            GestureDetector(
                              onTap:(){
                                provider.updateCategory(i);
                                },
                              child: Container(
                                height: 40,
                                padding:const  EdgeInsets.symmetric(horizontal: 15),
                                margin:const  EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: i==provider.index?Colors.black:Colors.transparent,
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(),
                                ),
                                alignment: Alignment.center,
                                child: Text(optionList[i],style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color:i==provider.index?Colors.white: Colors.black)),
                              ),
                            )
                          ]
                        ],

                      );
                    }
                  ),
                ),
              ),
             const  SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: Text("T-Shirts Collections",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),)),
                 const  Icon(Icons.arrow_forward)
                ],
              ),
              const  SizedBox(height: 20,),
              Stack(
                children: [

                  Transform.rotate(
                    angle: -0.15,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:const  Color(0xffb7d02a)
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 0.15,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:const  Color(0xffb7d02a)
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DetailScreen()));
                    },
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:Colors.white
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [

                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hoody T-Shirt",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 200,
                             width: double.infinity,
                             child:  Hero(
                               tag: "shirt1",
                                 child: Image.asset("assets/shirt1.png")),)

                            ],
                          ),
                          Container(
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
                                Text("\$ 150",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                Container(
                                  padding:const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white

                                  ),
                                  child:const  Icon(Icons.add_shopping_cart_outlined),
                                )
                              ],
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Spacer(),
              Container(
                height: 60,
                width: double.infinity,
                padding:const  EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),

                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text("3",style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 10,),
                   Expanded(child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [Text("Cart",style: TextStyle(color: Colors.black),
                     ),
                       Text("3 Items",style: TextStyle(color: Colors.black),
                       ),
                     ],

                   )),
                   CircleAvatar(
                     backgroundColor: Colors.black,
                     child:  const Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
                   )
                  ],
                ),

              )


            ],
          ),
        ),
      ),

    );
  }
}
