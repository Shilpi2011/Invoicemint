import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view/bottomNavigation.dart';
import 'package:Invoicemint/view_model/SendWhatsAppMessage_api_services.dart';
import 'package:Invoicemint/view_model/whatsAppReminder.api_services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class WhatsAppReminder extends StatefulWidget {
  const WhatsAppReminder({super.key});

  @override
  State<WhatsAppReminder> createState() => _WhatsAppReminderState();
}

class _WhatsAppReminderState extends State<WhatsAppReminder> {
   bool _isScheduled = false;
 DateTime? _selectedDateTime;
 String _selectedTimeZone = 'Africa/Abidjan (GMT+0)';
 final countryController = TextEditingController();
 final messageController = TextEditingController();
final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final whatsappProvider = Provider.of<SentWhatsAppMessageProvider>(context);
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
                image: AssetImage('assets/images/invoicemint bg.png'),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                  width: widthSize,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/recImage.png'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 25),
                        const Text(
                          'WhatsApp Invoice Reminder ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'poppins-regular',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '  Client :',
                            style: TextStyle(
                              fontFamily: 'poppins-light',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xf7070704F)),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: CountryCodePicker(
                                    padding: const EdgeInsets.only(left: 0),
                                    onChanged: (value) {
                                      countryController.text = value.code ?? '';
                                    },
                                    initialSelection: '+91',
                                    hideMainText: true,
                                    favorite: const ['+91', 'IN'],
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Color(0xf7070704F)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Color.fromARGB(255, 67, 235, 218)),
                                ),
                                border: InputBorder.none,
                                labelText: '      Enter Phone Number',
                                fillColor: Colors.white,
                                labelStyle: const TextStyle(fontFamily: 'poppins-regular', fontSize: 14),
                                filled: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: widthSize,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/invoiceEmail.jpg'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '  Message ',
                        style: TextStyle(
                          fontFamily: 'poppins-light',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Consumer<GetWhatsAppReminderMessage>(
                        builder: (context, getWhatsAppMessage, child) {
                          return Center(
                            child: FutureBuilder(
                              future: getWhatsAppMessage.fetchData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  return const CircularProgressIndicator(
                                    color: Colors.red,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  final messageData = getWhatsAppMessage.data;
                                  if (messageData == null) {
                                    return const Text('No data available');
                                  }
                                  return Container(
                                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    margin: const EdgeInsets.symmetric(horizontal: 2),
                                    height: 340,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: const Color(0xf7070704F)),
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Text(
                                      messageData.message,
                                      style: const TextStyle(
                                        fontFamily: 'poppins-light',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 20,
                            child: CheckboxListTile(
                              activeColor: const Color.fromARGB(255, 18, 143, 160),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              value: _isScheduled,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isScheduled = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Padding(
                            padding: EdgeInsets.only(top: 28),
                            child: Text(
                              ' Schedule Message for later',
                              style: TextStyle(
                                fontFamily: 'poppins-light',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (_isScheduled) ...[
                        TextField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Message will be sent on',
                            suffixIcon: Icon(Icons.calendar_today),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xf7070704F)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color.fromARGB(255, 67, 235, 218)),
                            ),
                            labelStyle: TextStyle(fontFamily: 'poppins-regular', fontSize: 14),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  _selectedDateTime = DateTime(
                                    pickedDate.year,
                                    pickedDate.month,
                                    pickedDate.day,
                                    pickedTime.hour,
                                    pickedTime.minute,
                                  );
                                });
                              }
                            }
                          },
                          controller: TextEditingController(
                            text: _selectedDateTime == null
                                ? ''
                                : DateFormat('dd-MM-yyyy HH:mm').format(_selectedDateTime!),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            suffixIconColor: Color(0xFF000000),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Color.fromRGBO(34, 31, 31, 0.216)),
                            ),
                            focusColor: Color.fromRGBO(255, 255, 255, 1),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(34, 31, 31, 0.216)),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            labelText: 'Select Time Zone',
                            labelStyle: TextStyle(fontFamily: 'poppins-regular', fontSize: 14),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          value: _selectedTimeZone,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedTimeZone = newValue!;
                            });
                          },
                          items: <String>[
                            'Africa/Abidjan (GMT+0)',
                            'Africa/Nairobi (GMT+3)',
                            'America/New_York (GMT-4)',
                            // Add more time zones as needed
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontFamily: 'poppins-regular', fontSize: 14),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      final countryCode = countryController.text;
                      final phoneNumber = phoneController.text;
                      final fullPhoneNumber = '$countryCode$phoneNumber';
                      await whatsappProvider.sendWhatsAppMessage(
                        true,
                        messageController.text,
                        invoiceId,
                        fullPhoneNumber,
                      );
                Navigator.push( context,MaterialPageRoute(builder: (context) =>  CustomBottomNavigation()),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [Color(0xff39DEE8), Color(0xff42566A)],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 50,
                        width: 200,
                        constraints: const BoxConstraints(minWidth: 88.0),
                        child: const Center(
                          child: Text(
                            'Send Message',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
