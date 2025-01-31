import 'package:flutter/material.dart';

class SearchHsCodeListComponent extends StatelessWidget {
  const SearchHsCodeListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              key: ValueKey(index),
              contentPadding: const EdgeInsets.only(left: 10, right: 0),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '리스트 아이템',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '부제목',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              title: const Center(
                child: Text(
                  '116506105616516',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    print('fewfew');
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 20,
                  )),
              dense: true,
            ),
          );
        },
      ),
    );
  }
}


class SearchHsCodeListUIModel {

}