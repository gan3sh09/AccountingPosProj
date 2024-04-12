import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/widgets/stock_screen.dart/stock_item_tile.dart';
import 'package:flutter/material.dart';

class StockItemList extends StatefulWidget {
  const StockItemList({super.key});

  @override
  State<StockItemList> createState() => _StockItemListState();
}

class _StockItemListState extends State<StockItemList> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: spacer.all.xxs,
              child:
                  const Text('Total Stock Items:'),
            ),
            Container(
              padding: spacer.bottom.xs,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  child: TextField(
                    onChanged: (value) {
                      // filterSearchResults(value.toLowerCase());
                    },
                    controller: editingController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      labelText: "Search",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      counterStyle: Theme.of(context).textTheme.bodyMedium,
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const StockItemTile();
                },
              ),
            ),
          ],
        ));
  }
}
