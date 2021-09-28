
import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
//import 

enum FilterOptions{
  Favorites,
  All,
}


class ProductsOverviewScreen extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
final productContainer =Provider.of<Products>(context,listen: false);   
    return Scaffold(
      appBar: AppBar(
        title: Text('Toy Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue)
            {
              //print(selectedValue);
              if (selectedValue ==FilterOptions.Favorites){
                    productContainer.showFavoritesOnly();
                  //  notifyListeners();
              }
              else
              {
                  productContainer.showAll();
                  //notifyListeners();
              }
            },
            icon: Icon(
             Icons.more_vert,
            ),
            itemBuilder: (_) =>[
              PopupMenuItem(child: Text('Only Favorites'),value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'),value: FilterOptions.All),
            ],
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}

