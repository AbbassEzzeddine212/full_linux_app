import 'package:flutter/material.dart';




class Textfields extends StatelessWidget {
  const Textfields({super.key, required this.Name});
  final String Name;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        Text(Name,style: TextStyle(fontSize: 20,),),
        Flexible(
          child: TextFormField(

            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        )
      ],
    );
  }
}
