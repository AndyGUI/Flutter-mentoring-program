import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/task.dart';

part 'retrofit_style_client.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/tasks")
  Future<List<Task>> getTasks();

  @GET("/tasks")
  Future<Task> getTasksWithHeader(@Header("Content-Type") String contentType);

  @GET("/tasks/{id}")
  Future<Task> getTask(@Path("id") String id);

  @PATCH("/tasks/{id}")
  Future<Task> updateTaskPart(
      @Path() String id, @Body() Map<String, dynamic> map);

  @PUT("/tasks/{id}")
  Future<Task> updateTask(@Path() String id, @Body() Task task);

  @DELETE("/tasks/{id}")
  Future<void> deleteTask(@Path() String id);

  @POST("/tasks")
  Future<Task> createTask(@Body() Task task);
}
