import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({
    super.key,
    required this.post,
  });

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  bool isHeartAnimating = false;
  bool isLiked = false;
  late int likeCount = widget.post.like;

  @override
  Widget build(BuildContext context) {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final color = isLiked ? Colors.red : Colors.white;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Post headings
          _PostHeader(post: widget.post),
          const SizedBox(
            height: 5.0,
          ),
          //posts

          GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(widget.post.imageUrl),
                Opacity(
                  opacity: isHeartAnimating ? 1 : 0,
                  child: HeartAnimationWidget(
                    isAnimating: isHeartAnimating,
                    duration: const Duration(milliseconds: 700),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 100,
                    ),
                    onEnd: () => setState(
                      () => isHeartAnimating = false,
                    ),
                  ),
                ),
              ],
            ),
            onDoubleTap: () {
              setState(() {
                isHeartAnimating = true;
                isLiked = true;
                likeCount += isLiked ? 1 : -1;
              });
            },
          ),
          //buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    HeartAnimationWidget(
                      alwaysAnimate: true,
                      isAnimating: isLiked,
                      child: IconButton(
                        icon: Icon(
                          icon,
                          color: color,
                          size: 27,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                            likeCount += isLiked ? 1 : -1;
                          });
                        },
                      ),
                    ),
                    Buttons(
                      icons: const Icon(MdiIcons.commentProcessingOutline),
                      onPressed: () {},
                    ),
                    Buttons(
                      icons: const Icon(MdiIcons.sendOutline),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Buttons(
                    icons: const Icon(MdiIcons.bookmarkOutline),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          //Post staus
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${likeCount.toString()} likes',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                RichText(
                  text: TextSpan(
                    text: widget.post.authorName,
                    style: const TextStyle(
                        height: 1.3,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: ' ${widget.post.captions}',
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Text(
                  'View all ${widget.post.comments} comments',
                  style: const TextStyle(
                    height: 1.4,
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  ' ${widget.post.timeAgo}utes ago',
                  style: const TextStyle(
                    height: 1.4,
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
        ProfileImg(imageUrl: post.authorImageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.authorName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                post.address,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.black,
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 37, 37, 37),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        height: 5.0,
                        width: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share_outlined,
                                        size: 23,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.link_outlined,
                                        size: 23,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
                                  'Link',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.bookmark_border,
                                        size: 23,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                      Column(
                        children: const [
                          ListTile(
                            leading: Icon(
                              Icons.star_border_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Add to favourites",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              MdiIcons.accountMinusOutline,
                              size: 25,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Unfollow",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.info_outline_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Why you're seeing this post",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(
                          MdiIcons.eyeOffOutline,
                          size: 25,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Hide",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                        title: Text(
                          "About this account",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(
                          MdiIcons.commentAlertOutline,
                          size: 25,
                          color: Colors.red,
                        ),
                        title: Text(
                          "report",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
