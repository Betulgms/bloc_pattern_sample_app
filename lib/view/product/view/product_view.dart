import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_product/widgets/custom_appbar/custom_appbar.dart';
import '../../../_product/widgets/empty_widget.dart';
import '../../../_product/widgets/loading/loading_widget.dart';
import '../model/product_model.dart';
import '../viewmodel/product_cubit.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    // var loadforassetsjson = DefaultAssetBundle.of(context).loadString("assets/json/product.json");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: BlocProvider(
        create: (context) => ProductCubit(context),
        child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          var cubit = context.read<ProductCubit>();
          return state.isLoading
              ? const LoadingWidget()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView(
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        children: [
                          const Text(
                            "  Let's Enjoy Your",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "  Fast Food",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          Image.network(
                            "https://images.pexels.com/photos/3915907/pexels-photo-3915907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "  Categories",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          state.categories.isEmpty
                              ? const EmptyWidget(message: "     Categori bulunamadı")
                              : SizedBox(
                                  height: 35,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.categories.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => buildCategoryCard(index, state, cubit),
                                  ),
                                ),
                          const SizedBox(height: 10),
                          const Text(
                            "  Popular Food",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          state.productCardStatusLoading
                              ? const LoadingWidget()
                              : state.products.isEmpty
                                  ? const EmptyWidget(message: "     Kategoriye ait ürün bulunamadı")
                                  : ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: state.products.length,
                                      itemBuilder: (context, index) => buildProductCard(context, index, state.products[index]),
                                    ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }

  Widget buildProductCard(BuildContext context, int index, ProductModel product) {
    return Padding(
      padding: EdgeInsets.only(right: 6.0, left: 10, bottom: index == 9 ? 50 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Image.network(
                    product.photoPath,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.red,
                            size: 15,
                          ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.black,
              ),
              Text(
                product.price.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(int index, ProductState state, ProductCubit cubit) {
    var isSelected = state.categories[index].id == state.selectedCategory?.id;
    return Padding(
      padding: EdgeInsets.only(right: 6.0, left: index == 0 ? 12 : 0),
      child: InkWell(
        onTap: () => cubit.selectCategory(state.categories[index]),
        child: Container(
          height: isSelected ? 35 : 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected ? Colors.red : Colors.grey.withOpacity(0.5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isSelected ? 8 : 4, vertical: isSelected ? 4 : 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: isSelected ? 20 : 16,
                  width: isSelected ? 20 : 16,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      state.categories[index].photoPath,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Text(
                  state.categories[index].title,
                  style: TextStyle(
                    fontSize: isSelected ? 12 : 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
