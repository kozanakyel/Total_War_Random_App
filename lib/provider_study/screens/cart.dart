import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tw_random/provider_study/models/cart.dart';

class MyCart extends StatelessWidget{
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart', style: Theme.of(context).textTheme.headline1,),
      backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(32),
              child: _CartList(),
            ),
            ),
            const Divider(height: 4, color: Colors.black,),
            _CarTotal(),
          ],
        ),
      ),
    );
  }
  
}

class _CarTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var hugeStyle = Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);
    
    return SizedBox(
      height: 200,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<CartModel>(
                builder: (context, cart, child) =>
                  Text('\$${cart.totalPrice}', style: hugeStyle,),
              ),
              const SizedBox(width: 24,),
              TextButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Buying not supportted yet'),
                      duration: Duration(seconds: 1),)
                    );
              },
                  style: TextButton.styleFrom(primary: Colors.white),
                  child: const Text('BUY'),)
            ],
          ),
        ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    var itemNameStyle = Theme.of(context).textTheme.headline6;

    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: (){
              cart.remove(cart.items[index]);
            },
          ),
          title: Text(
            cart.items[index].name,
            style: itemNameStyle,
          ),
        )
    );
  }
}