import 'package:fashion_shop_flutter/providers/addtocart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("My Cart",style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800,color: Colors.black),)),
                  const SizedBox(width: 30,),
                  GestureDetector(
                    onTap: (){Navigator.pop(context);},
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
              const SizedBox(height: 20,),
              Consumer<AddToCartProvider>(
                builder: (context,provider,widget) {
                  return Container(
                    height: 450,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        Expanded(child:provider.addtoCartList.isEmpty? Image.asset("assets/empty.png",): ListView.builder(
                          itemCount: provider.addtoCartList.length,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                            var data=provider.addtoCartList[index];
                            return   Dismissible(
                              background: Container(
                                color: Colors.black,

                                child:const  Icon(Icons.delete,color: Colors.white,),
                              ),
                              onDismissed: (DismissDirection direction) {
                                provider.removeProduct(data);
                                },
                              key: ValueKey<int>(index),
                              child: Container(
                              height: 80,
                              width: double.infinity,
                              padding:const  EdgeInsets.only(top: 10),

                              decoration: const BoxDecoration(

                                border: Border(bottom: BorderSide(
                                  color: Colors.grey
                                ))
                              ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Image.asset(data.imageUrl),
                                  title: Text(data.title,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                                  trailing:  Container(
                                    height: 40,
                                    width: 100,
                                    padding:const  EdgeInsets.symmetric(horizontal: 15),
                                    margin:const  EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(35),
                                      border: Border.all(),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("\$${data.amount*data.count}",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color:Colors.white)),
                                  ),
                                ),
                          ),
                            );
                        })),
                      const   SizedBox(height: 20,),
                        Container(
                          height: 120,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:  Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total Amount",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text( "\$${getAmountValue(provider.addtoCartList)}",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)
                                ],
                              ),
                          const     SizedBox(height: 10,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Delivery Amount",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text("\$ ${provider.addtoCartList.isEmpty?0:49}",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)
                                ],
                              ),
                             const  Divider(color: Colors.grey,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                const   Text("Grand\n Total",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text("\$${getAmountValue(provider.addtoCartList)+ (provider.addtoCartList.isEmpty?0:49)}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 22),)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                  );
                }
              ),
              const    Spacer(),
              GestureDetector(

                child: Container(


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
                      Text("Make Payment",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                      Container(
                        padding:const  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white

                        ),
                        child: const Icon(Icons.account_balance_wallet_outlined),
                      )
                    ],
                  ),

                ),
              ),
            ],
          ),

        ),
      ),

    );
  }
  double getAmountValue(List addtocartlist){
    List<num>totalamount=[];
    for(int i=0;i<addtocartlist.length;i++){
      totalamount.add(addtocartlist.elementAt(i).count!*addtocartlist.elementAt(i).amount);
    }

    return
       double.parse(totalamount.sum.toStringAsFixed(2));



  }
}

