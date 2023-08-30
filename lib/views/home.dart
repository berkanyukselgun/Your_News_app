import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Your", style: TextStyle(color: Colors.black)),
          Text("News", style: TextStyle(color: Colors.blue))
        ]),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            child: ListView.builder(
              itemCount: category.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryTile(
                  imageUrl: category[index].imageUrl,
                  categoryName: category[index].categoryName,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl,
                    width: 120, height: 60, fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  BlogTile({required this.imageUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(children: [Image.network(imageUrl), Text(title), Text(desc)]),
    );
  }
}
