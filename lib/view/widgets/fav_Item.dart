import 'package:flutter/material.dart';
import 'package:task_etisalat/model/search_model.dart';
import 'package:task_etisalat/view/widgets/fav_icon.dart';

Widget buildFavItem(context, index, MainModel model) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.lightGreen,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            "${model.search![index].owner!.avatarUrl}",
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 30,
      ),
      Text(
        "${model.search![index].name}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      const Spacer(),
      addOrDeleteFav(context, model),
    ],
  );
}
