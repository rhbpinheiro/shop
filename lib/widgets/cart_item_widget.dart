import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../model/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: const Color.fromARGB(255, 247, 32, 17),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) {
        //chamando a função remove do cart com o provider
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple,
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '${cartItem.price}',
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          ),
          title: Text(cartItem.name),
          subtitle: Text(
            'Total: R\$ ${cartItem.price * cartItem.quantity}',
          ),
          trailing: Text('${cartItem.quantity}X'),
        ),
      ),
    );
  }
}
