import 'package:flutter/material.dart';
import 'package:food_delivery/utilities/app_asstets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVoucherItem(BuildContext context,
      {required String name, required int number}) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.deepOrange, fontWeight: FontWeight.w600),
        ),
        Text(name, style: Theme.of(context).textTheme.titleMedium)
      ],
    );
  }

  Widget itemTappedTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? subtitle,
  }) {
    final sizePh = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          title: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500)),
          onTap: () => debugPrint("$title clicked"),
          subtitle: subtitle != null ? Text(subtitle) : null,
          leading:
              Icon(icon, size: sizePh.height * .036, color: Colors.deepOrange),
          trailing: Icon(Icons.chevron_right_rounded,
              color: Colors.deepOrange, size: sizePh.height * .04),
        ),
        Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeP = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: sizeP.height * .26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  (AppAsstets.profilePhoto),
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: sizeP.height * .028),
          Text(
            "Aday Jaradat",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: sizeP.height * .015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              orderVoucherItem(context, name: "Oreder", number: 50),
              orderVoucherItem(context, name: "Voucher", number: 10),
            ],
          ),
          SizedBox(height: sizeP.height * .04),
          Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          itemTappedTile(context,
              title: "Past Orders", icon: Icons.shopping_cart_outlined),
          itemTappedTile(context,
              title: "Avaible Vouchers", icon: Icons.card_giftcard_outlined),
        ],
      ),
    );
  }
}
