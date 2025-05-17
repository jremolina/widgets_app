import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScroll extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadnextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadnextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    addImages();

    isLoading = false;

    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    await Future.delayed(Duration(milliseconds: 300));

    if (!isMounted) return;

    isLoading = false;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Scroll')),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        edgeOffset: 10,
        strokeWidth: 2,
        child: customListView(
          scrollController: scrollController,
          imagesIds: imagesIds,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child:
            isLoading
                ? SpinPerfect(infinite: true, child: Icon(Icons.refresh))
                : Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class customListView extends StatelessWidget {
  const customListView({
    super.key,
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: imagesIds.length,
      itemBuilder: (context, index) {
        return FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: const AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(
            'https://picsum.photos/id/${imagesIds[index]}/500/300',
          ),
        );
      },
    );
  }
}
