import 'package:flutter/material.dart';
import 'package:mealdb/search_provider.dart';
import 'package:provider/provider.dart';

class SearchDetailedPage extends StatelessWidget {
  final int index;
  const SearchDetailedPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<SearchProvider>(context).searchmeal?.meals?[index];
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
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              meal?.idMeal ?? "",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              meal?.strMeal ?? '',
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
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                List.generate(15, (i) {
                                  final ingredient =
                                      meal?.toJson()["strIngredient${i + 1}"] ??
                                          "";
                                  final measure =
                                      meal?.toJson()["strMeasure${i + 1}"] ??
                                          "";
                                  if (ingredient.trim().isEmpty) return "";
                                  return "$ingredient - $measure";
                                }).where((e) => e.isNotEmpty).join("\n"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.network(meal?.strMealThumb ??
                                  "https://imexpert.au/wp-content/uploads/2023/08/image-not-found.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                meal?.strInstructions ?? "",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.watch<SearchProvider>().linkdir();
                  },
                  child: Text('Watch Tutorial'))
            ],
          ),
        ),
      ),
    );
  }
}
