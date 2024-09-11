import 'package:Invoicemint/utils/custom_icons_icons.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:Invoicemint/view_model/scheduledReminder_api_services.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduledReminderScreen extends StatefulWidget {
  const ScheduledReminderScreen({super.key});

  @override
  State<ScheduledReminderScreen> createState() => _ScheduledReminderScreenState();
}

class _ScheduledReminderScreenState extends State<ScheduledReminderScreen> {
  final List<String> scheduleReminder = [
    'All',
    'Scheduled',
    'Sent',
    'Deleted'
  ];

  String? scheduleReminderType;
  late Future<void> _fetchDataFuture;
  int selectedScheduleTypeIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
  }

  Future<void> _loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedScheduleTypeIndex = prefs.getInt('selectedScheduleTypeIndex') ?? 0;
      _fetchDataFuture = Provider.of<ScheduledReminderProvider>(context, listen: false)
          .fetchData(selectedScheduleTypeIndex);
    });
  }

  Future<void> _saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedScheduleTypeIndex', index);
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ScheduledReminderProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            stretch: true,
            expandedHeight: 10,
            leadingWidth: 70,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff39DEE8), Color(0xff42566A)],
                ),
              ),
            ),
            automaticallyImplyLeading: true,
            title: const Text(
              'Scheduled Reminder',
              style: TextStyle(fontFamily: 'poppins-regular', fontSize: 16),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          if (dataProvider.data == null)
            const SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.teal,
                ),
              ),
            )
          else if (dataProvider.data!.content.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Image.asset(
                  'assets/images/Group 580.png',
                  scale: 1,
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.only(top: 0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Invoice No.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  dataProvider.data!.content[index].invoiceNumber,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-medium',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Send To',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  dataProvider.data!.content[index].sendTo.toString(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-medium',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Date&Time',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  dataProvider.data!.content[index].dateTime,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-medium',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sent On',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                dataProvider.data!.content[index].email
                                    ? const Icon(Icons.email_outlined, color: Colors.black, size: 20)
                                    : Image.asset('assets/images/whats-app.png', height: 20, width: 30),
                                const SizedBox(height: 8),
                                const Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                dataProvider.data!.content[index].sent
                                    ? const Text(
                                        'Sent',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'poppins-medium',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      )
                                    : const Text(
                                        'Stop',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'poppins-medium',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Action',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                dataProvider.data!.content[index].sent
                                    ? const Text('')
                                    : SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Restart action
                                          },
                                          child: const Text(
                                            'Restart',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins-regular',
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: dataProvider.data!.content.length,
              ),
            ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 110),
          ),
        ],
      ),
      floatingActionButton: DraggableFab(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff39DEE8), Color.fromARGB(255, 251, 253, 235)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (context, setBottomState) {
                      return Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: ListView(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xff39DEE8), Color(0xff42566A)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Filter',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  'Search Type',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins-regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              decoration: const InputDecoration(
                                suffixIconColor: Color(0xFF000000),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(34, 31, 31, 0.216),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(34, 31, 31, 0.216),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              hint: Text(
                                scheduleReminder[selectedScheduleTypeIndex],
                                style: const TextStyle(color: Colors.black),
                              ),
                              style: const TextStyle(color: Colors.black),
                              isExpanded: true,
                              value: scheduleReminder[selectedScheduleTypeIndex],
                              items: scheduleReminder.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Center(
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: 'poppins-regular',
                                        color: Color(0xFF000000),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                setBottomState(() {
                          selectedScheduleTypeIndex = scheduleReminder.indexOf(value!);
                         messageId= dataProvider.data!.content[invoiceId].id;
                                });
                                await _saveSelectedIndex(selectedScheduleTypeIndex);
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                  ),
                                  onPressed: () {
                                    // Reset action
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDBDBDB),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      constraints: const BoxConstraints(minWidth: 88.0),
                                      child: const Center(
                                        child: Text(
                                          'Reset',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'poppins-regular',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF42566A),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                  ),
                                  onPressed: () async {
                                    await Provider.of<ScheduledReminderProvider>(context, listen: false)
                                        .fetchData(selectedScheduleTypeIndex);
                                    Navigator.pop(context);
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff39DEE8),
                                          Color(0xff42566A)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      constraints: const BoxConstraints(minWidth: 88.0),
                                      child: const Center(
                                        child: Text(
                                          'Apply Filter',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'poppins-regular',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Icon(CustomIcons.group_446, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}
