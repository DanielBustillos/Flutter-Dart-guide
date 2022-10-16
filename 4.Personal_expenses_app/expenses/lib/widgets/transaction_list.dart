import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "No transactions added yet",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            DateFormat.yMMMMd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey[650],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
                },
                itemCount: transactions.length,
              ));
  }
}
