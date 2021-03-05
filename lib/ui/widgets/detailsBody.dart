import 'package:flutter/material.dart';
import 'package:mystery_meal/ui/widgets/DetailsOrderButton.dart';
import 'package:mystery_meal/ui/widgets/TitlePriceRatingDetails.dart';
import 'package:mystery_meal/ui/widgets/ItemImage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: "assets/images/MidosBurger.jpg",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        children: <Widget>[
          shopeName(name: "Midos"),
          TitlePriceRating(
            name: "Cheese Burger",
            numOfReviews: 24,
            rating: 4,
            price: 15,
            //onRatingChanged: (value) {},
          ),
          Text(
            "Hello it's MIDOS!!!",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          Text("ORDER THE LARGE BOX NOW"),
          SizedBox(height: size.height * 0.1),
          // Free space  10% of total height
          OrderButton(
            size: size,
            press: () {},
          )
        ],
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}