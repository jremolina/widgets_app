import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Buscar Comida',
    caption: 'lorem ipsum dolor sit amet, consectetur adipiscing elit',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega Rapida',
    caption: 'lorem ipsum dolor sit amet, consectetur adipiscing elit',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'lorem ipsum dolor sit amet, consectetur adipiscing elit',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      // print('${pageviewController.page}');
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (data) => _Slide(
                        title: data.title,
                        caption: data.caption,
                        imageUrl: data.imageUrl,
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 20,
            top: 20,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir'),
            ),
          ),

          endReached
              ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 2),
                  child: FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Comenzar'),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titlestyle = Theme.of(context).textTheme.titleLarge;
    final captionstyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titlestyle),
            const SizedBox(height: 20),
            Text(caption, style: captionstyle),
          ],
        ),
      ),
    );
  }
}
