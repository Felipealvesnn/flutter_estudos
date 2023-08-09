import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/pages/products_overview.dart';

import '../models/auth.dart';
import 'auth_page.dart';

class auth_or_homepahe extends StatelessWidget {
  const auth_or_homepahe({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return auth.isAuth ? Products_overview() : auth_page();
  }
}
