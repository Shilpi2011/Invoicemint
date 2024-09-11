import 'package:Invoicemint/view/scheduled_reminder.dart';
import 'package:flutter/material.dart';
import 'package:Invoicemint/utils/custom_icons_icons.dart';
class SilverBelowAppbar extends StatelessWidget {
  const SilverBelowAppbar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
    automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      expandedHeight:-100,
      bottom: const PreferredSize(
      preferredSize: Size.fromHeight(-35), child: SizedBox()),
      flexibleSpace: const InvoicesProgressIndicator(),
    );
  }
}

class InvoicesProgressIndicator extends StatefulWidget {
const InvoicesProgressIndicator({Key? key}) : super(key: key);

  @override
  State<InvoicesProgressIndicator> createState() => _InvoicesProgressIndicatorState();
}

class _InvoicesProgressIndicatorState extends State<InvoicesProgressIndicator> {
   void _showPopupMenu() {
    final RenderBox _overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      shape: Border.all(color: Colors.black),
      context: context,
      position: RelativeRect.fromRect(
       const Rect.fromLTWH(250, 250, 100, 100),
        Offset.zero & _overlay.size,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'zip',
          child: Text('Download as ZIP'),
        ),
        const PopupMenuItem<String>(
          value: 'pdf',
          child: Text('Download as PDF'),
        ),
      ],
    ).then((value) {
      if (value == 'zip') {
      } else if (value == 'pdf') {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
             return Padding(
              padding: const EdgeInsets.only(right:17,top:10,bottom:2),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:const EdgeInsets.only(left:18),
                  child: Container(
                  height:35,
                  width:165, 
               decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
               gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors:[Color(0xff39DEE8),Color.fromARGB(255, 168, 158, 158)],
                  )
                ),
                 child: ElevatedButton(
                 style: ButtonStyle(
                 shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder( 
                 borderRadius: BorderRadius.circular(10.0),)),
                 backgroundColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                   onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduledReminderScreen()));
                      }, 
                child:const Text('Scheduled Reminder',style: TextStyle(fontFamily: 'poppins-light',fontSize:12,fontWeight: FontWeight.w400,color: Colors.white),)
                      ),
                  ),
                ),
                Container(
                 height:35,
                  width:155, 
                decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
               gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors:[Color(0xff39DEE8),Color.fromARGB(255, 168, 158, 158)],
                  )
                ),
                 child: ElevatedButton(
                 style: ButtonStyle(
                 shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10.0),)),
                 backgroundColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                   onPressed:(){
                  _showPopupMenu();
                      }, 
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                 Icon(CustomIcons.group_557,color: Colors.white,size: 14,),
                 Text('Download',style: TextStyle(fontFamily: 'poppins-light',fontSize:12,fontWeight: FontWeight.w500,color: Colors.white),),
                  ],
                )
                      ),
                  ),
            //   GestureDetector(
            //      onTap: (){
            //   _showPopupMenu();
            //       },
            //   child: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //   const Icon(CustomIcons.group_557,color: Colors.blue,size: 16,),
            //   const SizedBox(width: 10),
            //   GestureDetector(
            //   onTap: (){
            //  _showPopupMenu();
            //   },
            //   child: const Text('Download',style: TextStyle(fontFamily: 'poppins-medium',fontSize:16,color: Colors.blue,fontWeight: FontWeight.bold),))
            //           ],
            //         ),
            //     ),
             ],
           ),
            );
  }
}

