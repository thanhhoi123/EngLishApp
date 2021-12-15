import 'package:english_app/values/app_assets.dart';
import 'package:english_app/values/app_colors.dart';
import 'package:english_app/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({ Key? key }) : super(key: key);

  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  int _currentIndex = 0;
  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Text('English today', style: AppStyles.h3.copyWith(color: AppColors.textColor),),
        leading: InkWell(
          onTap: () {

          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(AppAssets.menu),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: size.height / 10,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                '"It is amazing how complete is the delusion that beauty is goodness"',
                style: AppStyles.h5.copyWith(color: AppColors.textColor),)),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index){
                  setState(() {
                    _currentIndex = index;
                  });                  
                },
                itemCount: 5,
                itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),                    
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(3,6),
                          blurRadius: 8                        
                        )
                      ]
                    ),
                    child: Column(                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          margin: const EdgeInsets.all(16),                        
                          alignment: Alignment.centerRight,
                          child: Image.asset(AppAssets.heart, width: 50, height: 50,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(                          
                            maxLines: 1, //Giới hạn 1 dòng
                            overflow: TextOverflow.ellipsis, //Khi qúa 1 dòng sẽ ...
                            textAlign: TextAlign.start,
                            text: TextSpan(                                                     
                              text: 'B',
                              style: TextStyle(
                                fontFamily: FontFamily.sen, 
                                fontSize: 90, 
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(3,6),
                                    blurRadius: 6
                                  )
                                ]), 
                              children: [
                                TextSpan(
                                  text: 'eautiful',
                                  style: TextStyle(                                
                                    fontFamily: FontFamily.sen, 
                                    fontSize: 56, 
                                    fontWeight: FontWeight.bold,
                                    shadows: [ // Đổ bóng
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(3,6),
                                        blurRadius: 6)
                                    ]   
                                  )
                                )
                              ]
                            )
                          ),
                        ),
                        Padding(                          
                          padding: const EdgeInsets.fromLTRB(10,24,10,10),                          
                          child: Text(
                            '"Think of all the beauty still left around you and be happy."',
                            style: AppStyles.h4.copyWith(
                              letterSpacing: 1, //Giãn dòng
                              color: AppColors.textColor
                            ),),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 12,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index){
                  return  buildIndicator(index == _currentIndex, size);
                },
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {

        },
        child: Image.asset(AppAssets.exchange),),
    );
  }

  Widget buildIndicator(bool isActive, Size size){    
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: isActive? size.width / 5 : 24, 
        decoration: BoxDecoration(
          color: isActive? AppColors.lightBlue : AppColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2,3),
              blurRadius: 3
            )
          ]  
        ),
    );
  }
}