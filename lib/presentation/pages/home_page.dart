// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:cryptoapp/presentation/pages/market_page.dart';
import 'package:cryptoapp/presentation/pages/news_page.dart';
import 'package:cryptoapp/presentation/pages/portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:cryptoapp/data/repositories/coin_repository_impl.dart';
import 'package:cryptoapp/presentation/bloc/coin_bloc.dart';
import 'package:cryptoapp/presentation/pages/profile_page.dart';
import 'package:cryptoapp/presentation/pages/search_page.dart';
import 'package:cryptoapp/presentation/pages/moedas_page.dart';
import 'package:cryptoapp/presentation/pages/interesse_page.dart';
import 'package:cryptoapp/presentation/pages/visao_page.dart';
import 'package:cryptoapp/presentation/widgets/market_card.dart';
import 'package:cryptoapp/domain/use_cases/get_coin_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentIndex = 0;

  final double _marketCap = 1.5;
  final double _volume = 2.1;
  final double _btcDominance = 50.5;
  final int _fearAndGreedIndex = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Coin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 120,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                viewportFraction: 0.4,
                autoPlay: true,
              ),
              items: [
                MarketCard(
                  title: 'Cap. de Mercado',
                  value: '\$${_marketCap.toStringAsFixed(2)} T',
                ),
                MarketCard(
                  title: 'Volume',
                  value: '\$${_volume.toStringAsFixed(2)} B',
                ),
                MarketCard(
                  title: 'Dominância',
                  value: '${_btcDominance.toStringAsFixed(2)}%',
                ),
                MarketCard(
                  title: 'Medo e Ganância',
                  value: _fearAndGreedIndex.toString(),
                ),
              ].map((card) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.5, // Adjusted for two cards
                      child: card,
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, isScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.blue,
                  pinned: true,
                  floating: true,
                  forceElevated: isScrolled,
                  bottom: TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white, //
                    tabs: const [
                      Tab(text: 'Moedas'),
                      Tab(text: 'Lista Interesse'),
                      Tab(text: 'Visão Geral'),
                    ],
                  ),
                ),
              ],
              body: TabBarView(
                controller: _tabController,
                children: [
                  BlocProvider(
                    create: (context) =>
                        CoinBloc(GetCoinData(CoinRepositoryImpl(Dio())))
                          ..add(LoadCoin()),
                    child: const MoedasPage(),
                  ),
                  const InteressePage(),
                  const VisaoPage(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Mercados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Novidades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Portfólio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => BlocProvider(
                  create: (context) =>
                      CoinBloc(GetCoinData(CoinRepositoryImpl(Dio())))
                        ..add(LoadCoin()),
                  child: const MarketPage(),
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const NewsPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const SearchPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const PortfolioPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const ProfilePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          }
        },
      ),
    );
  }
}
