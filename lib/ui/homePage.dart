import 'package:crypto_exchange_flutter/network/responsModel.dart';
import 'package:crypto_exchange_flutter/ui/ui_helper/homePageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_exchange_flutter/ui/ui_helper/themeSwitchers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../helper/DecimalRounder.dart';
import '../models/CryptoModels/CryptoData.dart';
import '../provider/cryptoDataProvider.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final PageController _pageController = PageController(initialPage: 0);

  var defultChoiseIndex = 0;

  final List<String> _choiseListe = [
    'Top Market Cap',
    'Top Gainers',
    'Top Losers'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cryptoProvider =
        Provider.of<cryptoDataProvider>(context, listen: false);
    cryptoProvider.GetopMarketCapData();
  }

  @override
  Widget build(BuildContext context) {
    final cryptoProvider = Provider.of<cryptoDataProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var primeriColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: primeriColor,
        actions: const [themeSwitchers()],
        title: const Text('EXCHANGE'),
        titleTextStyle: textTheme.titleLarge,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      homePAgeView(controller: _pageController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 5,
                            effect: const ExpandingDotsEffect(
                                dotHeight: 10, dotWidth: 10),
                            onDotClicked: (index) =>
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInCirc),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Marquee(
                    text: '**This is a Place For News In Application** ',
                    style: textTheme.bodySmall,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('BUY'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(20),
                      ),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('SELL'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[700],
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(20),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 7),
                child: Row(
                  children: [
                    Wrap(
                        spacing: 10,
                        children: List.generate(_choiseListe.length, (index) {
                          return ChoiceChip(
                            label: Text(
                              _choiseListe[index],
                              style: textTheme.titleSmall,
                            ),
                            selected: defultChoiseIndex == index,
                            selectedColor: Colors.blue,
                            onSelected: (value) {
                              setState(() {
                                defultChoiseIndex = value ? index : defultChoiseIndex;
                                switch(index){
                                  case 0 :
                                    // ignore: void_checks
                                    return cryptoProvider.GetopMarketCapData();
                                    break;

                                  case 1 :
                                    // ignore: void_checks
                                    return cryptoProvider.GetopgainersData();

                                  case 2 :
                                    // ignore: void_checks
                                    return cryptoProvider.GetoplosersData();

                                }

                              });
                            },
                          );
                        }))
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Consumer<cryptoDataProvider>(
                    builder: (context, cryptoDataProvider, child) {
                  switch (cryptoDataProvider.state.status) {
                    case Status.COMPLETED:
                      List<CryptoData>? model = cryptoDataProvider
                          .dataFuture.data!.cryptoCurrencyList;

                      return Container(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var number = index + 1;
                              var tokenId = model![index].id;
                              MaterialColor filterColor =
                                  DecimalRounder.setColorFilter(
                                      model[index].quotes![0].percentChange24h);

                              var finalPrice =
                                  DecimalRounder.removePriceDecimals(
                                      model[index].quotes![0].price);

                              // percent change setup decimals and colors
                              var percentChange =
                                  DecimalRounder.removePercentDecimals(
                                      model[index].quotes![0].percentChange24h);

                              Color percentColor =
                                  DecimalRounder.setPercentChangesColor(
                                      model[index].quotes![0].percentChange24h);
                              Icon percentIcon =
                                  DecimalRounder.setPercentChangesIcon(
                                      model[index].quotes![0].percentChange24h);

                              return SizedBox(
                                height: height * 0.075,
                                child: Row(children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      number.toString(),
                                      style: textTheme.bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 15),
                                    child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                        height: 32,
                                        width: 32,
                                        imageUrl:
                                            "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) {
                                          return const Icon(Icons.error);
                                        }),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model[index].name!,
                                          style: textTheme.bodySmall,
                                        ),
                                        Text(
                                          model[index].symbol!,
                                          style: textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                      fit: FlexFit.tight,
                                      child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
                                          child: SvgPicture.network(
                                              "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg"))),
                                  Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10,),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text("\$$finalPrice",style: textTheme.bodySmall,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                percentIcon,
                                                Text(percentChange + "%",style: GoogleFonts.ubuntu(color: percentColor, fontSize: 13),),
                                              ],

                                            )
                                          ],
                                        ),
                                      )
                                  )

                                ]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: 10),
                      );
                    case Status.LOADING:
                      return SizedBox(
                        height: 80,
                        child: Shimmer.fromColors(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, bottom: 8, left: 8),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: SizedBox(
                                          width: 70,
                                          height: 40,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.white),
                      );

                    case Status.ERROR:
                      return Text('chek your connection....');
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
