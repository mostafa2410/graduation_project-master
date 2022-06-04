//horsedetails.dart
////////////////////////////////
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/alekaamodel.dart';
import 'package:graduation_project/models/productmodel.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../shared/component/components.dart';

class NewFile extends StatelessWidget {
  List<dynamic> countries = [];
  var menu = TextEditingController();
  var menu2 = TextEditingController();
  var menu3 = TextEditingController();
  String? counterid;
  List<dynamic> types = [];
  String? typeid;
  List<dynamic> hoies = [];
  String? horid;
  @override
  void initState() {
    initState();
    this.countries.add({"id": 1, "label": "حصان1 "});
    this.countries.add({"id": 2, "label": "حصان2"});
    this.countries.add({"id": 3, "label": "حصان3"});
    this.types.add({"id": 1, "label": "بالغ"});
    this.types.add({"id": 2, "label": "مفطوم"});
    this.types.add({"id": 3, "label": "حامل"});
    this.types.add({"id": 4, "label": "بعد الولادة"});
    this.types.add({"id": 5, "label": "قبل الولادة"});
    this.types.add({"id": 6, "label": "طلوق"});
    this.hoies.add({"id": 1, "label": "عليقة 1"});
    this.hoies.add({"id": 2, "label": "عليقة 2"});
    this.hoies.add({"id": 3, "label": "عليقة 3"});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OwnerCubit(),
      child: BlocConsumer<OwnerCubit, OwnerState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OwnerCubit.get(context);

          return Scaffold(
        appBar:AppBar(title: Text("")),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: BuildDropBottom(
                          dropdownButtonTitle: 'حالة الحصان',
                          function: (newValue) {
                            cubit.onChangeHorseWeightItem(newValue);
                            cubit.onChangeHalaItem(newValue);
                          },
                          items: [
                            'حامل',
                            'بعد الولادة',
                            'قبل الولادة',
                            'طلوق',
                            ' مفطوم',
                            'بالغ'
                          ].map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          value: cubit.HorseHalaChoose,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: BuildDropBottom(
                          dropdownButtonTitle: ' حدد الفصل الزمني',
                          function: (newValue2) {
                            cubit.onChangeHorseWeightItem2(newValue2);
                            cubit.onChangeHalaItem2(newValue2);
                          },
                          items: [
                            'الفصل الاول-(1:3))',
                            'الفصل الثاني-(4:6)',
                            'الفصل الثالث-(7:9)',
                            'الفصل الرابع-(10:12)',
                          ].map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          value: cubit.HorseHalaChoose2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "كيلو",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "${cubit.horseWeight+cubit.horseCaseWeight}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            " = وزن العليقة المطلوبة ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.grey[100],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              "كجم",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 30,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: defaultFormField(
                                                type: TextInputType.number,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'يجب ادخال الوزن ';
                                                  }
                                                },
                                               onChange: (value){
                                                 cubit.onChangeWeightItem();
                                               },
                                                label: 'الوزن',
                                                prefixIcon:
                                                    Icons.add_to_drive_rounded,
                                                controller: menu),
                                          ),
                                        ),
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 50,
                                                  left: 50,
                                                ),
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),

                                                  content: StreamBuilder(
                                                    stream: cubit.getProducts(),
                                                    builder: ((context, snapshot) {
                                                    if(snapshot.hasData){
                                                      List<ProductData> data=snapshot.data as  List<ProductData>;
                                                      List<String> items=[];
                                                      data.forEach((element){
                                                        items.add(element.productName??'');
                                                      },);
                                                      return Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: 260,
                                                              child: BuildDropBottom(
                                                                dropdownButtonTitle: ' حدد مكون',
                                                                function: (newValue1) {
                                                                double price=double.parse(data.where((element) => element.productName==newValue1).first.productPrice??'');

                                                                  cubit.onChangeAliqaIngredientItem(newValue1,price); 
                                                                  Navigator.pop(context);
                                                                },
                                                                items:  items.map((valueItem) {
                                                                  return DropdownMenuItem(
                                                                    value: valueItem,
                                                                    child: Text(valueItem),
                                                                  );
                                                                }).toList(),
                                                                value: cubit.AliqaValueChoose1,
                                                              )),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                          ],
                                                        );
                                                  }
                                                  else{
                                                    return Text('error');
                                                  }})),
                                                  actionsAlignment: MainAxisAlignment.center,
                                                  actions: [
                                                    ElevatedButton(onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text('ok'))
                                                    ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            width: 140,
                                            height: 40.0,
                                            child: defaultbutton(
                                                width: double.infinity,
                                                background: Colors.grey,
                                                function: () {
                                                  print("hello flutter");
                                                },
                                                text: cubit.AliqaValueChoose1!=null?cubit.AliqaValueChoose1.toString():'مكون الطاقة',
                                                size: 20.0),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                    Text(
                                      menu.text.isEmpty?
                                      "السعر =0 ":
                                      "السعر = ${cubit.AliqaPriceChoose1*double.parse(menu.text.toString())}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.grey[100],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 30),
                                        Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              "كجم",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 30,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: defaultFormField(
                                                type: TextInputType.number,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'يجب ادخال الوزن ';
                                                  }
                                                },
                                                onChange: (value){
                                                 cubit.onChangeWeightItem();
                                               },
                                                label: 'الوزن',
                                                prefixIcon:
                                                    Icons.add_to_drive_rounded,
                                                controller: menu2),
                                          ),
                                        ),
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {
                                             showDialog(
                                              context: context,
                                              builder: (_) => Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 50,
                                                  left: 50,
                                                ),
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  content: StreamBuilder(
                                                    stream: cubit.getProducts(),
                                                    builder: ((context, snapshot) {
                                                    if(snapshot.hasData){
                                                      List<ProductData> data=snapshot.data as  List<ProductData>;
                                                      List<String> items=[];
                                                      data.forEach((element){
                                                        items.add(element.productName??'');
                                                      },);
                                                      return Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: 260,
                                                              child: BuildDropBottom(
                                                                dropdownButtonTitle: ' حدد مكون',
                                                                function: (newValue2) {
                                                                 double price=double.parse(data.where((element) => element.productName==newValue2).first.productPrice??'');
                                                                  
                                                                  cubit.onChangeAliqaIngredientItem2(newValue2,price);
                                                                  Navigator.pop(context);

                                                                },
                                                                items:  items.map((valueItem) {
                                                                  return DropdownMenuItem(
                                                                    value: valueItem,
                                                                    child: Text(valueItem),
                                                                  );
                                                                }).toList(),
                                                                value: cubit.AliqaValueChoose2,
                                                              )),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                          ],
                                                        );
                                                  }
                                                  else{
                                                    return Text('error');
                                                  }})),

                                                  actionsAlignment: MainAxisAlignment.center,
                                                  actions: [
                                                    ElevatedButton(onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text('ok'))
                                                    ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            width: 140,
                                            height: 40.0,
                                            child: defaultbutton(
                                                width: double.infinity,
                                                background: Colors.grey,
                                                function: () {
                                                  print("hello flutter");
                                                },
                                                text: cubit.AliqaValueChoose2!=null?cubit.AliqaValueChoose2.toString():'مكون الحديد',
                                                size: 20.0),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                    Text(
                                       menu2.text.isEmpty?
                                      "السعر =0 ":
                                      "السعر = ${cubit.AliqaPriceChoose2*double.parse(menu2.text.toString())}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.grey[100],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 30),
                                        Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              "كجم",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 30,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: defaultFormField(
                                                type: TextInputType.number,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'يجب ادخال الوزن ';
                                                  }
                                                },
                                                onChange: (value){
                                                 cubit.onChangeWeightItem();
                                               },
                                                label: 'الوزن',
                                                prefixIcon:
                                                    Icons.add_to_drive_rounded,
                                                controller: menu3),
                                          ),
                                        ),
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {
                                             showDialog(
                                              context: context,
                                              builder: (_) => Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 50,
                                                  left: 50,
                                                ),
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  content: StreamBuilder(
                    stream: cubit.getProducts(),
                    builder: ((context, snapshot) {
                    if(snapshot.hasData){
                      List<ProductData> data=snapshot.data as  List<ProductData>;
                      List<String> items=[];
                      data.forEach((element){
                        items.add(element.productName??'');
                      },);
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 260,
                              child: BuildDropBottom(
                                dropdownButtonTitle: ' حدد مكون',
                                function: (newValue3) {
                                  double price=double.parse(data.where((element) => element.productName==newValue3).first.productPrice??'');
                                  cubit.onChangeAliqaIngredientItem3(newValue3,price);  
                                  Navigator.pop(context);

                                },
                                items:  items.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                                value: cubit.AliqaValueChoose3,
                              )),
                              SizedBox(
                                height: 10,
                              ),
                          ],
                        );
                  }
                  else{
                    return Text('error');
                  }})),

                                                  actionsAlignment: MainAxisAlignment.center,
                                                  actions: [
                                                    ElevatedButton(onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text('ok'))
                                                    ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            width: 140,
                                            height: 40.0,
                                            child: defaultbutton(
                                                width: double.infinity,
                                                background: Colors.grey,
                                                function: () {
                                                  print("hello flutter");
                                                },
                                                text: cubit.AliqaValueChoose3!=null?cubit.AliqaValueChoose3.toString():'مكون البروتنات ',
                                                size: 20.0),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                    Text(
                                      menu3.text.isEmpty?
                                      "السعر =0 ":
                                      "السعر = ${cubit.AliqaPriceChoose3*double.parse(menu3.text.toString())}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        double alekaPrice=cubit.AliqaPriceChoose1+cubit.AliqaPriceChoose2+cubit.AliqaPriceChoose3;
                                  cubit.saveAleeka(
                                    AlekaModel('aleka',
                                     cubit.HorseHalaChoose2, cubit.HorseHalaChoose,
                                      [cubit.AliqaValueChoose1,cubit.AliqaValueChoose2,cubit.AliqaValueChoose3],
                                       alekaPrice.toString())
                                  ).then((value) {
                                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الحفظ')));
                                      Navigator.pop(context);
                                    
                                  });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        width: 200,
                        height: 60.0,
                        child: defaultbutton(
                            width: double.infinity,
                            background: Colors.grey,
                            function: () {},
                            text: ' كون عليقة ',
                            size: 30.0),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
