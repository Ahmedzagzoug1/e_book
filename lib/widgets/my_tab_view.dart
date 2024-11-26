import 'package:e_book/constants/colors.dart';
import 'package:flutter/material.dart';

class MyTabView extends StatelessWidget {
  const MyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (_, i) {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              color: tabVarViewColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(0, 0))]),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                        'assets/img/book_flutter.jpg',
                      ))),
                ),SizedBox(width: 10,),
                 Column(
                    children: [
                      Row(
                        children:[ 
                          Icon(Icons.star,size: 40,color: stars,),
                      Text('4.45',style: TextStyle(color: stars),),
                      ]),                      Text(' title',style: TextStyle(fontWeight: FontWeight.bold)),

                      Text('list title',style: TextStyle(fontSize: 16,color: subtitle),),
                      Container(decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: love
                      ),
                      width: 60,height: 15,
                        child: Text('like'))
                    ],
                  ),
                
              ],
            ),
          ),
        ),
      );
    });
  }
}
