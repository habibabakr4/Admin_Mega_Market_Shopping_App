import 'package:admin_of_online_app/screens/edit_upload_product_form.dart';
import 'package:admin_of_online_app/screens/inner_screens/orders/orders_screen.dart';
import 'package:admin_of_online_app/screens/screens_best_selling_products_chart.dart';
import 'package:admin_of_online_app/screens/search_screen.dart';
import 'package:flutter/material.dart';


class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(BuildContext context) => [
        DashboardButtonsModel(
          text: "Add a new product",
          imagePath: "https://res.cloudinary.com/dueksc1xj/image/upload/v1734025398/cloud_tbh9kt.png",
          onPressed: () {
            Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "inspect all products",
          imagePath: "https://res.cloudinary.com/dueksc1xj/image/upload/v1733700836/shopping_cart_twbeff.png",
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "View Orders",
          imagePath: "https://res.cloudinary.com/dueksc1xj/image/upload/v1734025398/order_n4lipk.png",
          onPressed: () {
            Navigator.pushNamed(context, OrdersScreenFree.routeName);
          },
        ),
         DashboardButtonsModel(
          text: "Best Selling",
          imagePath: "https://res.cloudinary.com/dueksc1xj/image/upload/v1734311010/free-bar-chart-icon-676-thumb_osoypn.png",
          onPressed: () {
            Navigator.pushNamed(context, BestSellingProductsChart.routeName);
          },
        ),
      ];
}