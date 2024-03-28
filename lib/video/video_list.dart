import '../res/app_image.dart';
import '../res/app_video.dart';
import '../video/video_model.dart';

List <VideoModel> videos = [
  VideoModel(
      videoUrl: AppVideo.video1,
      author: "Mame Cheikh",
      videoImage: AppImage.photo,
      title: "Doua",
      views: 513,
      likes: 1024,
      comments: 235,
      description:
      "React native Skeleton Content, a simple yet fully customizable component made to achieve loading animation in a Skeleton-style. Works in both iOS and Android.",
      publicateAt: "06/06/2024",
      theme: "Al adabe",
      type: 'Religion'),
  VideoModel(
      videoUrl: AppVideo.video2,
      author: "Duffy Duck",
      videoImage: AppImage.photo,
      title: "Chanson",
      views: 513,
      likes: 124,
      comments: 235,
      description:
      "React native Skeleton Content, a simple yet fully customizable component made to achieve loading animation in a Skeleton-style. Works in both iOS and Android.",
      publicateAt: "06/06/2024",
      theme: "chanson",
      type: 'Divertissemets'),

];