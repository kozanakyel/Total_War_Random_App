import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tw_random/provider_study/models/catalog.dart';

import '../models/cart.dart';

class MyCatalog extends StatelessWidget{
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12,),),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)
            ),
          ),
          
        ],
      ),
    );
  }
  
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context){
    var item = context.select<CatalogModel, Item>(
        (catalog) => catalog.getByPosition(index),

    );
    //print('in catalogScreen see the 11 and 12. catalog EQUALITY: ${context.select<CatalogModel, bool>((p) => p.getByPosition(11) != p.getByPosition(12))}');
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1,
            child: Container(color:item.color,),),
            const SizedBox(width: 24,),
            Expanded(child: Text(item.name, style: textTheme,),),
            const SizedBox(width: 24,),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
            (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart ? null
          : (){
        var cart = context.read<CartModel>();
        cart.add(item);
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (states){
                  if(states.contains(MaterialState.pressed)){
                    return Theme.of(context).primaryColor;
                  }
                  return null;
                }),
      ),
        child: isInCart
            ? const Icon(Icons.check, semanticLabel: 'ADDED')
            : const Text('ADD')
    );
  }
}

class _MyAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.headline1,),
      floating: true,
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart'),
          icon: const Icon(Icons.shopping_cart),)
      ],
    );
  }
}