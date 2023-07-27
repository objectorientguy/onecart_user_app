import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_color.dart';
import '../../configs/app_spacing.dart';

class SelectVariantScreen extends StatelessWidget {
  static const routeName = 'SelectVariantScreen';
  const SelectVariantScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Variant', style: Theme.of(context).textTheme.headingMedium),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: AppColor.black,
                size: 30,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColor.black,
                ))
          ],
          titleSpacing: xxxTiniestSpacing,
        ),
        bottomNavigationBar: BottomAppBar(elevation: 0,color: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 1000,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                      child: const Text('DONE',
                          style: TextStyle(fontSize: 20))))),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 1.0, left: 20.0, bottom: 10.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Image.asset('assets/img_2.png',
                          height: 100, width: 50),
                    ),
                    const Flexible(
                        child: Text(
                            'Lays American Style Cream & Onion Potato Chips',
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15))),
                    const SizedBox(width: 15.0)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 2.0),
                child: Card(
                    color: Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('196gm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('₹29',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15)),
                                  const SizedBox(width: 10),
                                  const Text('₹50',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 10)),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius:BorderRadius.circular(10.0),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text('40% OFF',style: TextStyle(color: Colors.green),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    )
                                ),
                                child: const Text('SELECT',
                                    style: TextStyle(fontSize: 13))),
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 2.0,top: 4.0),
                child: Card(
                    color: Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('420gm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('₹29',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15)),
                                  const SizedBox(width: 10),
                                  const Text('₹50',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 10)),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius:BorderRadius.circular(10.0),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text('40% OFF',style: TextStyle(color: Colors.green),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    )
                                ),
                                child: const Text('SELECT',
                                    style: TextStyle(fontSize: 13))),
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 2.0,top: 4.0),
                child: Card(
                    color: Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('640gm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('₹29',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15)),
                                  const SizedBox(width: 10),
                                  const Text('₹50',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 10)),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius:BorderRadius.circular(10.0),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text('40% OFF',style: TextStyle(color: Colors.green),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    )
                                ),
                                child: const Text('SELECT',
                                    style: TextStyle(fontSize: 13))),
                          )
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 2.0,top: 4.0),
                child: Card(
                    color: Colors.white,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('900gm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('₹29',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15)),
                                  const SizedBox(width: 10),
                                  const Text('₹50',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 10)),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius:BorderRadius.circular(10.0),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text('40% OFF',style: TextStyle(color: Colors.green),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    )
                                ),
                                child: const Text('SELECT',
                                    style: TextStyle(fontSize: 13))),
                          )
                        ],
                      ),
                    )
                ),
              ),
            ]
        )
    );
  }
}