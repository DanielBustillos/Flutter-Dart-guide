import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

      widget.addTx(
        enteredTitle,
        enteredAmount
      );

      Navigator.of(context).pop();

      print(titleControler.text);
      print(amountController.text);
      }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: "Title"),
              controller: titleControler,
            ),
            TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                //onChanged: (String val) => amountInput = val,
                ),
            TextButton(
              child: Text("Add Transaction"),
              onPressed: () => submitData,
              style: flatButtonStyle,
            )
          ],
        ),
      ),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.pink.shade500,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  );
}
