import 'package:flutter/material.dart';
import 'package:marketi/core/routing/router.dart';

void main() {
  runApp( Marketi(appRouter: AppRouter(),));
}


//https://www.figma.com/design/dlv95BuNaWuUECHDODNM5A/Marketi%D9%90_E-commerce-app?node-id=153-262&p=f&t=8FX45Ih0FNqUMjwP-0

class Marketi extends StatelessWidget {
  const Marketi({super.key,required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}