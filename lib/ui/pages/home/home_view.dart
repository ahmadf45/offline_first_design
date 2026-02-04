import 'package:flutter/material.dart';
import 'package:offline_first_design/infrastructures/base_view.dart';
import 'package:offline_first_design/ui/pages/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder(
      controller: HomeController(),
      builder: (context, controller) {
        return Scaffold(
          body: ListView.builder(
            itemCount: controller.listProduct.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(controller.listProduct[index].name));
            },
          ),
        );
      },
    );
  }
}
