import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/widgets/account_payable/ap_item_list.dart';
import 'package:flutter/material.dart';

class APLedgerItemList extends StatefulWidget {
  const APLedgerItemList({super.key});

  @override
  State<APLedgerItemList> createState() => _APLedgerItemListState();
}

class _APLedgerItemListState extends State<APLedgerItemList> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* String ledgerGuid;
    String partyname; */
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: spacer.all.xxs,
            child: Text(
              'Total Accounts Payable',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
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
          Padding(
            padding: spacer.all.xxs,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: const Text(
                        'Party Name',
                        style: TextStyle(
                            color: tassistPrimary, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                      width: 90,
                      child: Text(
                        'Payables',
                        style: TextStyle(
                            color: tassistBlack, fontWeight: FontWeight.bold),
                      )),
                  // Text ('Payment', style: TextStyle(color: TassistInfoGrey, fontWeight: FontWeight.bold ),),
                  const Icon(Icons.phone)
                ]),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => {
                    /* partyname = ledgerItemDataforDisplay[index].name,
                          ledgerGuid = ledgerItemDataforDisplay[index].guid,
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => LedgerView(
                                        ledgerGuid: ledgerGuid,
                                        partyname: partyname,
                                      ))) */
                  },
                  child: const APSingleItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
