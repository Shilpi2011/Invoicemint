import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  List<Item> itemList = [];
  double totalAmount = 0;
  double totalTax = 0;
  double grandTotal = 0;
  double deduction = 0;


  void _addItem(String name, double rate, double quantity, double taxRate) {
    // Calculate values
    double amount = rate * quantity;
    double taxTotal = amount * (taxRate / 100);
    double total = amount + taxTotal;

    // Add the item to the list
    setState(() {
      itemList.add(Item(name, rate, quantity, amount, taxTotal, total,taxRate));
      _updateTotals(); 
    });
  }

  void _removeItem(int index) {
    setState(() {
      itemList.removeAt(index);
      _updateTotals(); 
    });
  }

  void _updateTotals() {
    totalAmount = itemList.fold(0.0, (sum, item) => sum + item.amount);
    totalTax = itemList.fold(0.0, (sum, item) => sum + item.taxTotal);
    grandTotal = itemList.fold(0.0, (sum, item) => sum + item.total) - deduction;
  }

  void _applyDiscount(double discountValue, String discountType) {
    setState(() {
      if (discountType == '%') {
        deduction = grandTotal * (discountValue / 100);
      } else {
        deduction = discountValue;
      }
      grandTotal = itemList.fold(0.0, (sum, item) => sum + item.total) - deduction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Items")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return ExpansionTile(
                  title: Text(item.name),
                  children: [
                    ListTile(
                      title: Text("Rate: ${item.rate}"),
                      subtitle: Text("Quantity/Tax Rate: ${item.quantity}${item.taxRate}"),
                      trailing: Text("Amount: ${item.amount.toStringAsFixed(2)}"), // cast to string with precision
                    ),
                    ListTile(
                      title: Text("Tax Total: ${item.taxTotal.toStringAsFixed(2)}"), // cast to string with precision
                      subtitle: Text("Total: ${item.total.toStringAsFixed(2)}"), // cast to string with precision
                    ),
                    // Button to remove an item
                    IconButton(
                      icon:const Icon(Icons.delete),
                      onPressed: () {
                        _removeItem(index);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          // Display Deductions
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Deductions: ${deduction.toStringAsFixed(2)}"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Total Amount: ${totalAmount.toStringAsFixed(2)}"), 
                Text("Total Tax: ${totalTax.toStringAsFixed(2)}"), 
                Text("Grand Total: ${grandTotal.toStringAsFixed(2)}"), 
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showDiscountDialog(context);
            },
            child:const Text("Apply Discount"),
          ),
          ElevatedButton(
            onPressed: () {
              _showAddItemModal(context);
            },
            child:const Text("Add Item"),
          ),
        ],
      ),
    );
  }

 void _showAddItemModal(BuildContext context) {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController quantityController = TextEditingController(text: "1");
  TextEditingController taxRateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController taxTotalController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  void _updateCalculatedValues() {
    double rate = double.tryParse(rateController.text) ?? 0;
    double quantity = double.tryParse(quantityController.text) ?? 1;
    double taxRate = double.tryParse(taxRateController.text) ?? 0;

    double amount = rate * quantity;
    double taxTotal = amount * (taxRate / 100);
    double total = amount + taxTotal;

    amountController.text = amount.toStringAsFixed(2);
    taxTotalController.text = taxTotal.toStringAsFixed(2);
    totalController.text = total.toStringAsFixed(2);
  }
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            TextFormField(
             controller: itemNameController,
            decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextFormField(
                controller: rateController,
                decoration: const InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _updateCalculatedValues(); 
                },
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _updateCalculatedValues();
                },
              ),
              TextFormField(
                controller: taxRateController,
                decoration: const InputDecoration(labelText: 'Tax Rate'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _updateCalculatedValues(); 
                },
              ),
              TextFormField(
                controller: amountController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              TextFormField(
                controller: taxTotalController,
                readOnly: true, 
                decoration: const InputDecoration(labelText: 'Tax Total'),
              ),
              TextFormField(
                controller: totalController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Total'),
              ),
              ElevatedButton(
                onPressed: () {
                  String itemName = itemNameController.text;
                  double rate = double.tryParse(rateController.text) ?? 0;
                  double quantity = double.tryParse(quantityController.text) ?? 1;
                  double taxRate = double.tryParse(taxRateController.text) ?? 0;
                  _addItem(itemName, rate, quantity, taxRate);
                  Navigator.pop(context);
                },
                child:const Text('Submit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

 void _showDiscountDialog(BuildContext context) {
  TextEditingController discountController = TextEditingController();
  final List<String> discountTypes = ['%', 'Amount'];
  String? selectedDiscountType;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 300.0,
          height: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(255, 65, 213, 221),
                      Color.fromARGB(255, 77, 76, 76)
                    ]
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  )
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CustomIcons.group_490, color: Colors.white, size: 25),
                    SizedBox(width: 5),
                    Text(
                      'Add Discount',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: discountController, 
                      keyboardType: TextInputType.number,
                      decoration:const InputDecoration(
                        hintText: '0.0',
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 196, 242, 245),
                          Color.fromARGB(255, 243, 211, 211)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.black),
                        isExpanded: true,
                        items: discountTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Center(
                              child: Text(
                                type,
                                style: const TextStyle(
                                  fontFamily: 'poppins-medium',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDiscountType = value;
                          });
                        },
                        value: selectedDiscountType,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                          fontFamily: 'poppins-medium',
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                          fontFamily: 'poppins-medium',
                        ),
                      ),
                      onPressed: () {
                        double discountValue =
                            double.tryParse(discountController.text) ?? 0;

                        if (selectedDiscountType != null) {
                          _applyDiscount(discountValue, selectedDiscountType!);
                          Navigator.of(context).pop();
                        } else {
                          // Show a message if no discount type is selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select a discount type')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
         }

class Item {
  String name;
  double rate;
  double taxRate;
  double quantity;
  double amount;
  double taxTotal;
  double total;

  Item(this.name, this.rate, this.quantity, this.amount, this.taxTotal, this.total, this.taxRate);
}