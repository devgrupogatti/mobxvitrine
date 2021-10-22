import 'package:flutter/material.dart';
import 'package:vitrinebeauty/widgets/page_tile.dart';

class DashVitrine extends StatefulWidget {
  const DashVitrine({Key? key}) : super(key: key);

  @override
  _DashVitrineState createState() => _DashVitrineState();
}

class _DashVitrineState extends State<DashVitrine> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final _listSlide = [
    {'id': 0, 'image': 'assets/images/img1.jpeg'},
    {'id': 1, 'image': 'assets/images/img2.jpeg'},
    {'id': 2, 'image': 'assets/images/img3.jpeg'}
  ];

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _listSlide.length,
                itemBuilder: (_, currentIndex) {
                  bool activePage = currentIndex == _currentPage;
                  return SlideTile(
                    activePage: activePage,
                    image: _listSlide[currentIndex]['image'].toString(),
                  );
                },
              ),
            ),
            _buildBullets(),
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(int.parse(i['id'].toString()));
                _currentPage = int.parse(i['id'].toString());
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _currentPage == i['id'] ? Colors.red : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
