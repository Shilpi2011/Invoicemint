import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Invoicemint/utils/custom_icons_icons.dart';

class MarkAsPaidForm extends StatefulWidget {
  const MarkAsPaidForm({super.key});

  @override
  State<MarkAsPaidForm> createState() => _MarkAsPaidFormState();
}

class _MarkAsPaidFormState extends State<MarkAsPaidForm> {
final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),    
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
         width: widthSize,
        decoration: const BoxDecoration(
       image: DecorationImage(
       fit: BoxFit.cover,
       image: AssetImage('assets/images/invoicemint bg.png'))), 
            child: Column(
              children: <Widget>[
            Container(
            height:80,
            width: widthSize,
            decoration:  BoxDecoration(
            boxShadow: [
                BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                 blurRadius: 4)
                  ],
              borderRadius: const  BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
                     ),
              image: const DecorationImage(
               fit: BoxFit.cover,
              image: AssetImage('assets/images/recImage.png'))),
              child:  Padding(
              padding: const EdgeInsets.only(top:10,left: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  InkWell(
                  onTap: () {
                  Navigator.pop(context);
                },
                child:const Icon(Icons.chevron_left,color: Colors.white,size: 30,),
                         ),  
                 const SizedBox(width:95),
                 const Text('Marked As Paid',
                  style: TextStyle(
                     color:Colors.white,
                      fontSize:17,
                      fontFamily: 'poppins-regular',
                      fontWeight: FontWeight.w800), 
                   ),
                                  
                ],),
              ),
              ),  
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20,top:20),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text('Invoice No', style: TextStyle(fontWeight: FontWeight.bold,)),
                 SizedBox(height: 8),
                 Text('IBS-06-2024-8'),
                      ],
                    ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Text('Billed To', style: TextStyle(fontWeight: FontWeight.bold)),
               SizedBox(height: 8),
               Text('Mehboob Film Studio'),
                      ],
                    )
                  ],
                 ),
                  const SizedBox(height: 16),
                  const Text('Invoice Total', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('(ISK) 11015.851338'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'Amount Received (A)',
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                  ),
                  const SizedBox(height: 16,),
                       const TextField(
                        keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'(Amount Received User currency)',
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'Transaction Charge (B)',
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                     keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'Amount to Settle (A+B)',
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                  ),
                  const SizedBox(height: 16),
                TextField(
                  controller:_dateController,
                 decoration: InputDecoration(
                 suffixIcon: IconButton(
                  onPressed:
                     () async{ 
                 final DateTime? pickedDate =
                     await showDatePicker(
                   context: context,
                   initialDate: DateTime.now(),
                   firstDate: DateTime(1950),
                   lastDate: DateTime(2100),
                 );
                 if (pickedDate != null) {
                   print(
                       pickedDate);
                   String formattedDate =
                       DateFormat('dd/MM/yyyy')
                           .format(pickedDate);
                   print(
                       formattedDate);
                   setState(() {
                    _dateController.text =
                         formattedDate;
                   });
                 } else {
                   print("Date is not selected");
                 }
                     }, 
                     icon: const Icon(CustomIcons.group_484,color: Colors.black,size: 20,),),
                     enabledBorder: const OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'Payment Date',
                              fillColor: Colors.white,
                              labelStyle:const  TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                   decoration:const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'Payment Method',
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                    items: <String>['Account Transfer', 'Credit Card', 'Cash']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                   decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                          color:Color(0xf7070704F))),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color:Color.fromARGB(255, 67, 235, 218),
                              )),
                              border: InputBorder.none,
                              labelText:'Additional Notes',
                              fillColor: Colors.white,
                              labelStyle: TextStyle(fontFamily: 'poppins-regular',fontSize: 14),
                              filled: true),
                    maxLines: 3,
                  ),
                  ],
                ),
              ),
           const SizedBox(height: 16),
                       Center(
                       child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                           elevation: 5,
                          ),
                          onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminLogin()));
                          },
                          child: Ink(
                          decoration: BoxDecoration(
                          gradient: const  LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [Color(0xff39DEE8),Color(0xff42566A)],
                            ),
                           borderRadius: BorderRadius.circular(25)),
                            child: Container(
                             height: 50,
                            width: 175,
                            constraints: const BoxConstraints(minWidth: 88.0),
                            child: const Center(
                            child: Text('Save Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                                 ),
                                                          ),
                                                        ),
                                                      ),
                               ),
                            const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
