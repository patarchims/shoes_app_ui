import 'package:flutter/material.dart';
import 'package:shoe_app_flutter/constat.dart';
import 'package:shoe_app_flutter/shoe_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  String _imgImage = "assets/blue_shoe.png";
  int _sizeActive = 9;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -290,
              left: -20,
              child: Container(
                height: 564,
                width: 564,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorConstant.blueColor),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 48, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 24,
                          child: Image.asset('assets/back_icon.png'),
                        ),
                        SizedBox(
                          height: 24,
                          child: Image.asset('assets/love_icon.png'),
                        )
                      ],
                    ),
                    Image.asset(_imgImage,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                    Expanded(
                        child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'KD13 EP',
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$12,995',
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "In the games crucial moments, KD thrives. He takes over on both ends of the court, making defenders fear his unstopp...",
                          textAlign: TextAlign.justify,
                          style: greyTextStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          child: Row(
                            children: listShoe
                                .asMap()
                                .entries
                                .map((e) => Container(
                                      height: 82,
                                      width: 90,
                                      margin: EdgeInsets.only(
                                          left: (e.key == 0) ? 0 : 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: (_selectedIndex == e.key)
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              width: 2)),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = e.key;
                                            _imgImage = e.value.assetsImage;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF4F4F4),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child:
                                              Image.asset(e.value.assetsImage),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text("Select Size",
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 12,
                            childAspectRatio: 9 / 6,
                            children: listSizeShoe.asMap().entries.map((e) {
                              return SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: (e.value.stock == 0)
                                            ? Color(0xFFF6F6F6)
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            side: BorderSide(
                                                color: (_sizeActive ==
                                                        e.value.size)
                                                    ? Colors.black
                                                    : Color(0xFFDEE3EB)))),
                                    onPressed: () {
                                      if (e.value.stock != 0) {
                                        setState(() {
                                          _sizeActive = e.value.size;
                                        });
                                      }
                                    },
                                    child: (_sizeActive == e.value.size)
                                        ? Text(
                                            "UK " + e.value.size.toString(),
                                            textAlign: TextAlign.center,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : (e.value.stock == 0)
                                            ? Text(
                                                "UK " + e.value.size.toString(),
                                                textAlign: TextAlign.center,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xFFDEE3EB),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            : Text(
                                                "UK " + e.value.size.toString(),
                                                textAlign: TextAlign.center,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                primary: const Color(0xFF1F2732)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                "Add to Bag",
                                style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
