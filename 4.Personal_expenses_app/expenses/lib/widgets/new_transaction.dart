import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();

    print(titleControler.text);
    print(amountController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            right: 10,
          ),
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
                onSubmitted: (_) => _submitData(),
                //onChanged: (String val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No date chosen"
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  Platform.isIOS
                  ? CupertinoButton(
                      child: Text("Choosen date", style: TextStyle(
                        fontWeight: FontWeight.bold,)),
                      onPressed: _presentDatePicker,
                      )
                  : TextButton(
                    style: flatButtonStyle,
                    child: Text(
                      "Choosen date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ]),
              ),
              Platform.isIOS
                  ? CupertinoButton(
                      color: Colors.pink[300],
                      child: Text("Add Transaction"),
                      onPressed: _submitData,
                      )
                  : ElevatedButton(
                      child: Text("Add Transaction"),
                      onPressed: _submitData,
                      style: raisedButtonStyle,
                    )
            ],
          ),
        ),
      ),
    );
  }

  final ButtonStyle raisedButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.pink.shade500,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  );

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.pink.shade500,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  );
}
