import 'package:flutter/material.dart';
import 'package:mealdb/search_detailed_page.dart';
import 'package:mealdb/search_provider.dart';
import 'package:mealdb/searched_item_card.dart';
import 'package:provider/provider.dart';

class SearchedItemPage extends StatefulWidget {
  const SearchedItemPage({super.key});

  @override
  State<SearchedItemPage> createState() => _SearchedItemPageState();
}

class _SearchedItemPageState extends State<SearchedItemPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider provider = context.watch<SearchProvider>();
    return Scaffold(
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.searchmeal?.meals == null
              ? const Center(child: Text("No results found"))
              : ListView.builder(
                  itemCount: provider.searchmeal?.meals?.length,
                  itemBuilder: (context, index) {
                    return SearchedItemCard(
                        id: provider.searchmeal?.meals?[index].idMeal ?? '',
                        label1:
                            provider.searchmeal?.meals?[index].strMeal ?? '',
                        image: provider
                                .searchmeal?.meals?[index].strMealThumb ??
                            'https://imexpert.au/wp-content/uploads/2023/08/image-not-found.png',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchDetailedPage(index: index)));
                        });
                  },
                ),
    );
  }
}
