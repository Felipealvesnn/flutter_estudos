import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/cart.dart';
import 'package:shop_roupas/models/product.dart';

import '../models/auth.dart';
import '../utils/app_routes.dart';

class product_grid_item extends StatelessWidget {
  _icns(Product product) {
    return product.isFavorite ? Icons.favorite : Icons.favorite_border;
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: true);
    final Auth auth = Provider.of<Auth>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            App_routes.product_details,
            arguments: product,
          );
        },
        child: GridTile(
            child: Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: AssetImage('assets/images/product-placeholder.png'),
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),

            // child: Image.network(
            //   product.imageUrl,
            //   fit: BoxFit.cover,
            // ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                onPressed: () async {
                  try {
                    await product.toggleFavoriteStatus(auth.token, auth.uid);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erro ao favoritar'),
                      ),
                    );
                  }
                },
                icon: Icon(
                  _icns(product),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(252, 252, 252, 1),
                  )),
              trailing: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Produto adicionado com sucesso!'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Desfazer',
                        onPressed: () {
                          cart.diminuiItem(product.id);
                        },
                      ),
                    ),
                  );
                  cart.addItem(product);
                },
                icon: Icon(Icons.shopping_cart,
                    color: Color.fromRGBO(233, 233, 250, 1)),
              ),
            )),
      ),
    );
  }
}
