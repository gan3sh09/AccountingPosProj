import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/widgets/party_screen/ledger_item_tile_new.dart';
import 'package:flutter/material.dart';

class LedgerItemList extends StatefulWidget {
  const LedgerItemList({super.key});

  @override
  State<LedgerItemList> createState() => _LedgerItemListState();
}

class _LedgerItemListState extends State<LedgerItemList> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: spacer.all.xxs,
              child: const Text('Total Ledgers'),
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onDoubleTap: () {},
                    child: const LedgerItemTileNew(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
