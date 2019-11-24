import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/dio/client/provider.dart';
import 'package:flutter_mentoring_programm/dio/model/task.dart';

class TaskPage extends StatelessWidget {
  final httpService = ApiClient().provideRestClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getTasks(),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            List<Task> taskList = snapshot.data;
            return ListView(
              children: taskList
                  .map(
                    (Task task) => ListTile(
                      leading: FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      title: Text(task.name ?? task.id),
                      subtitle: Text("${task.createdAt}"),
                      onTap: () {},
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
