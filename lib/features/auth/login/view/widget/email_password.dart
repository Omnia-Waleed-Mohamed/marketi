import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widget/custom_text_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(child: 
    Column(
      children: [
        CustomTextField( hintText: 'Username or Email', validator: (value){
            
        }),
        SizedBox(
          height: 12.h,
        ),
        CustomTextField(hintText: 'Password', validator: (value){})
      ],
    )
    );
  }
}