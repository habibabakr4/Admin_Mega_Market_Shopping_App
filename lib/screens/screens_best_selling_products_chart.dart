import 'package:admin_of_online_app/models/product_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BestSellingProductsChart extends StatelessWidget {
  static const routeName = '/best-selling-products';

   // Sample list of products (you can replace this with dynamic data)
  final List<ProductModel> products = [
    ProductModel(
      productId: '1',
      productTitle: 'Product 1',
      productPrice: '50',
      productCategory: 'Category 1',
      productDescription: 'Description 1',
      productImage: 'image1.jpg',
      productQuantity: '80',
    ),
    ProductModel(
      productId: '2',
      productTitle: 'Product 2',
      productPrice: '60',
      productCategory: 'Category 2',
      productDescription: 'Description 2',
      productImage: 'image2.jpg',
      productQuantity: '65',
    ),
    ProductModel(
      productId: '3',
      productTitle: 'Product 3',
      productPrice: '40',
      productCategory: 'Category 3',
      productDescription: 'Description 3',
      productImage: 'image3.jpg',
      productQuantity: '50',
    ),
    ProductModel(
      productId: '4',
      productTitle: 'Product 4',
      productPrice: '30',
      productCategory: 'Category 4',
      productDescription: 'Description 4',
      productImage: 'image4.jpg',
      productQuantity: '40',
    ),
    ProductModel(
      productId: '5',
      productTitle: 'Product 5',
      productPrice: '20',
      productCategory: 'Category 5',
      productDescription: 'Description 5',
      productImage: 'image5.jpg',
      productQuantity: '30',
    ),
  ];

  BestSellingProductsChart({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Selling Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Top 5 Best Selling Products',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100, // Adjust maxY as necessary
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          '${products[group.x.toInt()].productTitle}\nSales: ${rod.toY}',
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final style = const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          return Text(
                            products[value.toInt()].productTitle,
                            style: style,
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: products.asMap().entries.map((entry) {
                    int index = entry.key;
                    double quantity = double.parse(entry.value.productQuantity);
                    return BarChartGroupData(
                      x: index,
                      barRods: [BarChartRodData(toY: quantity, color: Colors.blue)],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
