import 'package:flutter/material.dart';
import 'package:mealdb/detailed_page.dart';
import 'package:mealdb/home_card.dart';
import 'package:mealdb/meal_provide_page.dart';
import 'package:mealdb/search_provider.dart';
import 'package:mealdb/searched_item_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MealProvidePage>(context, listen: false).mealDbDecode();
    Provider.of<SearchProvider>(context, listen: false).searchPro();
  }

  @override
  Widget build(BuildContext context) {
    MealProvidePage provider = context.watch<MealProvidePage>();
    SearchProvider searchProvider = context.watch<SearchProvider>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meal DB'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    print('refreshed');
                    () {};
                  });
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: context.watch<SearchProvider>().controller1,
                  ),
                ),
                searchProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : IconButton(
                        onPressed: () async {
                          await searchProvider.searchPro();
                          setState(() {
                            searchProvider.controller1.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchedItemPage()));
                          });
                        },
                        icon: const Icon(Icons.fastfood_rounded))
              ],
            ),
            provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: provider.mealed?.categories?.length,
                      itemBuilder: (context, index) {
                        final val = provider.mealed?.categories?[index];

                        return HomeCard(
                          id: val?.idCategory ?? '',
                          label1: val?.strCategory ?? '',
                          image: val?.strCategoryThumb ?? '',
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailedPage(index: index)));
                          },
                        );
                      },
                    ),
                  ),
          ],
        ));
  }
}
