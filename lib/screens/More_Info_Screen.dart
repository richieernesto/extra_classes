

import 'package:flutter/material.dart';

class MoreInfoScreen extends StatefulWidget {
  final AssetImage image;
  MoreInfoScreen({required this.image});

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Stack(
          children:<Widget>[
        Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                )
              ]),
          child: Hero(
            tag: widget.image.assetName,
             child: ClipRRect(borderRadius: BorderRadius.circular(30.0),
            child: Image(image: AssetImage(widget.image.assetName),
            fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        //arrow button and search button at the top
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              IconButton(onPressed: ()=> Navigator.pop(context),
               icon: Icon(Icons.arrow_back),
               iconSize: 30.0,
               color: Colors.black,  
               ),
               Row( children:<Widget>[
               IconButton(onPressed: ()=>{},
               icon: Icon(Icons.search),
               iconSize: 30.0,
               color: Colors.black,  
               ),
                IconButton(onPressed: ()=>
                {},
               icon: Icon(Icons.sort_rounded),
               iconSize: 30.0,
               color: Colors.black,  
               )
               
               ]
               )
            
            ],),
        )
          ]
        ),
        //the other videos with the prices
        Expanded(child: ListView.builder(
          itemCount: 6,
          itemBuilder:(BuildContext context,int index) 
          {
            return Stack(
              children:<Widget>[
                Container(margin:EdgeInsets.fromLTRB(40.0, 4.0, 20.0, 5.0),
             height:170,
             width: double.infinity,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)
             ),
            child: Padding(
              padding:  EdgeInsets.fromLTRB(100.0,20.0,20.0,20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // the details below the hero picture
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                    Text("Name"),
                    Text("\$Price"),
                  ],
                  ),
                  Text("Tutor name"),
                  Text("⭐⭐⭐"),
                  SizedBox(height:10.0 ),
// the details below the hero picture
                  Row(children:<Widget> [
                    Container(
                      width:70.0,
                      decoration:BoxDecoration(color:Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    alignment: Alignment.center,
                    child: Text("unknown"),
                    ),
                    SizedBox(width:10.0),
                     Container(
                      width:70.0,
                      decoration:BoxDecoration(color:Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    alignment: Alignment.center,
                    child: Text("unknown"),
                    ),      
                  ],)
                ]
                ),
            ),
             ),
             
             Positioned(
               left: 20.0,
               top: 15.0,
               bottom: 15.0,

                            child: ClipRRect(
                 borderRadius:BorderRadius.circular(20.0),
                 child:Image(width: 110.0,
                 image: AssetImage("lib/assets/img/bgimage2.jpg"),
                 fit: BoxFit.cover,
                 )
               ),
             )
              ]
            );
          }))
      ]),
    );
  }
}
