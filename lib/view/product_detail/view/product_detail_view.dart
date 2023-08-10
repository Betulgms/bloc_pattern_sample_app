import 'dart:math';

import 'package:bloc_pattern_sample_app/view/product/model/product_model.dart';
import 'package:bloc_pattern_sample_app/view/product_detail/viewmodel/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/product_detail_cubit.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  _ProduckDetailViewState createState() => _ProduckDetailViewState();
}

class _ProduckDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(widget.productModel),
      child: Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home, color: Colors.red, size: 40),
              ),
              SizedBox(width: 35),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border, color: Colors.red, size: 40),
              ),
              SizedBox(width: 35),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag, color: Colors.red, size: 40),
              ),
              SizedBox(width: 35),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_suggest, color: Colors.red, size: 40),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/3915907/pexels-photo-3915907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(130),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pasta Carbonara",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "SpicyChickenPasta",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                          size: 15,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${Random().nextInt(30) + 50} Calories",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ingredients",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildIngredientContainer("https://altinertarim.com/wp-content/uploads/2020/04/brokoli.png"),
                        buildIngredientContainer("https://d1mm3tuyihn37h.cloudfront.net/wp-content/uploads/Domates.png"),
                        buildIngredientContainer("https://www.mismarsanalmarket.com/UserFiles/Fotograflar/org/3785-2809019-jpg-2809019.jpg"),
                        buildIngredientContainer("https://www.bugrabuyrukcu.com/img/page/sarimsak.jpg"),
                        buildIngredientContainer("https://ebeymar.com/Resim/Minik/1000x1000_thumb_2901017.jpg"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 10),
                    Text(
                      "Magna interdum sagittis in velit. Pharette sagittis proin odio adipiscing parturient sodales ultries Magnpdum saggittis in velit",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<ProductDetailCubit, ProductDetailState>(builder: (context, state) {
                      var cubit = context.read<ProductDetailCubit>();
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cubit.decrement();
                            },
                            icon: Icon(Icons.do_not_disturb_on, color: Colors.black, size: 30),
                          ),
                          Text(
                            state.amount.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {
                                cubit.increment();
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.red,
                                size: 30,
                              )),
                          Spacer(),
                          Icon(
                            Icons.attach_money,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text(
                            state.price.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildIngredientContainer(String image) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
