// ignore_for_file: unnecessary_null_comparison, unused_element

import 'package:accounting_pos_project/theme/dimensions.dart';
import 'package:accounting_pos_project/ui/views/detail_card.dart';
import 'package:accounting_pos_project/ui/views/voucher_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class PaymentVoucherScreen extends StatelessWidget {
  const PaymentVoucherScreen({required this.timePeriod, super.key});

  final String timePeriod;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PaymentVoucherList(
          timePeriod: timePeriod,
        ),
      ],
    );
  }
}

class PaymentVoucherList extends StatefulWidget {
  const PaymentVoucherList({required this.timePeriod, super.key});

  final String timePeriod;

  @override
  State<PaymentVoucherList> createState() => _PaymentVoucherListState();
}

class _PaymentVoucherListState extends State<PaymentVoucherList> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* String voucherIdView;
    String partyGuid; */

    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: spacer.all.xxs,
              child: const Text('Total Payment Vouchers:'),
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
                      hintText: "Search by party name...",
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
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
                    onDoubleTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const VoucherView(
                                voucherId: 'voucherId',
                                partyGuid: 'partyGuid')),
                      );
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => VoucherView(
                      //       voucherId: voucherIdView,
                      //       partyGuid: partyGuid,
                      //     ),
                      //   ),
                      // )
                    },
                    child: const PaymentVoucherTile(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class PaymentVoucherTile extends StatelessWidget {
  const PaymentVoucherTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailCard(
        title1: 'Party Name',
        info1: 'Voucher No.',
        info2: 'Voucher Type',
        info3: "Amount",
        info4: 'Date');
  }
}
