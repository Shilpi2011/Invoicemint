import 'package:flutter/material.dart';

class SliverAppBarBldr extends StatelessWidget {
  const SliverAppBarBldr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading:false ,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned:false,
      stretch: true,
      expandedHeight:20,
      leadingWidth: 170,
       actions: [
             Padding(
               padding: const EdgeInsets.only(right:20),
               child: Builder(builder: (context) {
               return GestureDetector(
               onTap: (){
              Scaffold.of(context).openDrawer();
                        },
                   child:Container(
                    height:10,
                    width: 30,
                   decoration:const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    //  borderRadius: BorderRadius.all(Radius.circular(10)),
                   ),
                     child:const Icon(Icons.menu ,color: Colors.black,size:20,weight:800 ,),
                   ),
                       );
                       }),
             ), 
            ],
       leading: Image.asset('assets/images/Sidebar logo.png',scale:3,),
       flexibleSpace: const FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: Image(
          image: AssetImage('assets/images/recImage.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
