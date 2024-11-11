import 'package:flutter/material.dart';
import 'lawyer_details_page.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> lawyers = [
    {
      "name": "Lingui Nettlewater",
      "category": "Criminal Lawyer",
      "location": "Long Street, Randomise 12, New York",
      "lawsuits": "43 clients",
      "achievements": "97% success rate",
      "experience": "10 years",
      "phoneNumber": "+46 123 456 78",
      "email": "linguina@nettlewater.com",
      "imagePath": "assets/images/image1.jpeg",
    },
    {
      "name": "John Doe",
      "category": "Business Lawyer",
      "location": "Wall Street, New York",
      "lawsuits": "30 clients",
      "achievements": "90% success rate",
      "experience": "8 years",
      "phoneNumber": "+46 987 654 32",
      "email": "john@doelawfirm.com",
      "imagePath": "assets/images/image2.jpeg",
    },
    {
      "name": "Sarah Connor",
      "category": "Family Lawyer",
      "location": "Sunset Boulevard, LA",
      "lawsuits": "25 clients",
      "achievements": "95% success rate",
      "experience": "5 years",
      "phoneNumber": "+46 555 123 45",
      "email": "sarah@lawfirm.com",
      "imagePath": "assets/images/image3.jpeg",
    },
    {
      "name": "Mike Johnson",
      "category": "Constitutional Lawyer",
      "location": "Main Street, Chicago",
      "lawsuits": "20 clients",
      "achievements": "88% success rate",
      "experience": "7 years",
      "phoneNumber": "+46 654 987 32",
      "email": "mike@lawfirm.com",
      "imagePath": "assets/images/image4.jpeg",
    },
  ];

  final List<String> images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
    'assets/images/image4.jpeg',
    'assets/images/image5.jpeg',
    'assets/images/image6.jpeg',
  ];

  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Automatically change the page every 3 seconds
    Future.delayed(Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (_currentPage < images.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _controller.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    // Repeat the auto-slide every 3 seconds
    Future.delayed(Duration(seconds: 3), _autoSlide);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lawyer Directory"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider
            _buildImageSlider(),
            SizedBox(height: 20),

            // Category Section
            Text(
              "Categories",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCategoriesSection(),
            SizedBox(height: 20),

            // Lawyer Profiles Section
            Text(
              "Lawyer Profiles",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: lawyers.length,
                itemBuilder: (context, index) {
                  final lawyer = lawyers[index];
                  return Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LawyerDetailsPage(
                              name: lawyer["name"]!,
                              category: lawyer["category"]!,
                              location: lawyer["location"]!,
                              lawsuits: lawyer["lawsuits"]!,
                              achievements: lawyer["achievements"]!,
                              experience: lawyer["experience"]!,
                              phoneNumber: lawyer["phoneNumber"]!,
                              email: lawyer["email"]!,
                              imagePath: lawyer["imagePath"]!,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(lawyer["imagePath"]!),
                            radius: 30, // Adjust the radius as needed
                          ),
                          SizedBox(height: 10),
                          Text(
                            lawyer["name"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            lawyer["category"]!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Image Slider with PageView
  Widget _buildImageSlider() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Optionally handle tap on image
                  print("Image $index tapped");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.white : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Categories Section (Horizontal ListView)
  Widget _buildCategoriesSection() {
    final List<Map<String, String>> categories = [
      {
        'title': 'Criminal Lawyer',
        'imagePath': 'assets/images/criminal_lawyer.jpeg',
      },
      {
        'title': 'Business Lawyer',
        'imagePath': 'assets/images/business_lawyer.jpeg',
      },
      {
        'title': 'Constitutional Lawyer',
        'imagePath': 'assets/images/constitutional_lawyer.jpeg',
      },
      {
        'title': 'Family Lawyer',
        'imagePath': 'assets/images/bankruptcy_lawyer.jpeg',
      },
    ];

    return Container(
      height: 120, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryTile(
            categories[index]['title']!,
            categories[index]['imagePath']!,
          );
        },
      ),
    );
  }

  Widget _buildCategoryTile(String title, String imagePath) {
    return Container(
      width: 160, // Adjust the width of each category tile
      margin: EdgeInsets.only(right: 10), // Add margin between tiles
      child: InkWell(
        onTap: () {
          // Handle the category click event, if required
        },
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
