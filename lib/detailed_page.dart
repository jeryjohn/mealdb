import 'package:flutter/material.dart';
import 'package:mealdb/meal_provide_page.dart';
import 'package:provider/provider.dart';

class DetailedPage extends StatelessWidget {
  final int index;
  const DetailedPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              Provider.of<MealProvidePage>(context)
                                      .mealed
                                      ?.categories?[index]
                                      .idCategory ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              Provider.of<MealProvidePage>(context)
                                      .mealed
                                      ?.categories?[index]
                                      .strCategory ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 500,
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.network(Provider.of<MealProvidePage>(context)
                                    .mealed
                                    ?.categories?[index]
                                    .strCategoryThumb ??
                                ''),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                Provider.of<MealProvidePage>(context)
                                        .mealed
                                        ?.categories?[index]
                                        .strCategoryDescription ??
                                    '',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
