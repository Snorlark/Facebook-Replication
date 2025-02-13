import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myapp/widgets/custom_dialogs.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    List<String> photoUrls = [
      'https://aphrodite.gmanetwork.com/entertainment/photos/photo/in_photos__the_best_dingdong_dantes_memes_kingkong_dantes_1578367048.jpg',
      'https://themindanaolife.com/wp-content/uploads/2020/01/20200107-PAGEONE-Dingdong-Puns-1.jpg',
      'https://www.wheninmanila.com/wp-content/uploads/2020/01/dingdong-dantes.png',
      'assets/images/fakebook.png', // Example local image
    ];

    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: photoUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              customShowImageDialog(context, imageUrl: photoUrls[index]);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWidget(photoUrls[index]), // Uses dynamic image handler
            ),
          );
        },
      ),
    );
  }
}


class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return imageUrl.startsWith('http')
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : Image.asset(imageUrl, fit: BoxFit.cover);
  }
}
