import 'package:coolthrow_client/admin/add_product.dart';
import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40,left: 15,right: 15),
        child: Column(
          children: [
            Center(child: Text("Home Admin",style: AppWidget.headlineTextFieldStyle(),)),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Row(
                      children: [
                        Padding(padding: EdgeInsets.all(6),
                          child: Image.asset("assets/outline-add-product-vector-icon-260nw-1454270585.webp",height: 100,width: 100,fit: BoxFit.cover,)
                          ,),
                        SizedBox(width: 30,),
                        Text("Add Product Items",style: TextStyle(
                            color: Colors.white,fontSize: 18
                        ),)

                      ],
                    ) ,

                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
