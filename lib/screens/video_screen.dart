import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/custom_appbar.dart';
import '../component/custom_drawer.dart';
import '../component/custom_filter.dart';
import '../res/app_icons.dart';
import '../res/formatNumber.dart';
import '../video/video_lecture.dart';
import '../video/video_list.dart';
import '../video/video_model.dart';

class VideothequeScreen extends StatefulWidget {
  const VideothequeScreen({super.key});

  @override
  State<VideothequeScreen> createState() => _VideothequeScreenState();
}

class _VideothequeScreenState extends State<VideothequeScreen> {
  List <VideoModel> video = [];
  @override
  void initState() {
    // TODO: implement initState
    video.addAll(videos);
    super.initState();
  }

  affiche(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            surfaceTintColor: Colors.white,
            scrollable: true,
            actionsPadding: EdgeInsets.all(20),
            actions: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Type', style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        buildFilterLabel('Tout', context),
                        buildFilterLabel('Discours', context),
                        buildFilterLabel('Histoire', context),
                        buildFilterLabel('Lettre Ouverte', context),
                        buildFilterLabel('Extraits', context),
                        buildFilterLabel('Xassidas', context),
                        buildFilterLabel('Livres', context),
                        buildFilterLabel('Poesie', context),
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(top: 30)),
                    Row(
                      children: [
                        Text('Theme', style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),)
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        buildFilterLabel('Education', context),
                        buildFilterLabel('Tidjanya', context),
                        buildFilterLabel('Fikh', context),
                        buildFilterLabel('Jeunesse', context),
                        buildFilterLabel('Religion', context),
                        buildFilterLabel('Politique', context),
                        buildFilterLabel('Vertu', context),
                        buildFilterLabel('Spiritualite', context),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      drawer: const CustomDrawer(),
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "VideoTheque",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(51, 51, 51, 1)),
                )
              ],
            ),

          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    hintText: 'œuvre, auteur...',
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Container(
                      margin: EdgeInsets.all(5),
                      width: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(29, 117, 189, 1),
                      ),
                      //padding: const EdgeInsets.all(5.0),
                      child: const Icon(Icons.search, color: Colors.white, size: 25,),
                    ),
                  ),
                  onChanged:null
              )
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(251, 251, 251, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => affiche(context),
                    icon: SvgPicture.asset(
                      AppIcons.filterIcons,
                      width: 24,
                      height: 20,
                      color:Color.fromRGBO(119,119,119,1),
                    )),
                Text('FILTRE',
                    style:
                    TextStyle(
                      fontSize:14 ,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(119,119,119,1),
                    ))
              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(251, 251, 251, 1),
              ),
              child: ListView.builder(
                itemCount: video.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 25,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width ,
                            height: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children:[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child:Image.asset(
                                    video[index].videoImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        var route =MaterialPageRoute(builder: (BuildContext context) =>
                                            VideoLecture(
                                                videoUrl: video[index].videoUrl,
                                                title: video[index].title,
                                                views: video[index].views,
                                                likes: video[index].likes,
                                                comments: video[index].comments,
                                                videoImage: video[index].videoImage,
                                                description: video[index].description)
                                        );
                                        Navigator.of(context).push(route);

                                      },
                                      icon: Icon(Icons.play_arrow,size: 40,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(video[index].author,
                                style: TextStyle(fontSize: 16,color: Color.fromRGBO(51, 51, 51, 1)),
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(onPressed: null, icon: SvgPicture.asset(AppIcons.shareIcons,width: 24,height: 24,)),
                                  IconButton(onPressed: null, icon: SvgPicture.asset(AppIcons.favorisIcons,width: 24,height: 24,)),
                                ],
                              )

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${NumberFormatter.formatNumber(video[index].views)} vues . poste ${video[index].publicateAt}",
                                style: TextStyle(fontSize: 12,color: Color.fromRGBO(153, 153, 153, 1)),
                              )
                            ],
                          )


                        ],
                      ),
                    ),
                  );

                },
              ),
            ),
          ),


        ],
      ),
    );

  }
}