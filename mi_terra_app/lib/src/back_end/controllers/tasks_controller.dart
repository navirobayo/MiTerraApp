import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_terra_app/src/back_end/repositories/user_repository.dart';

class TasksController extends GetxController {
  static TasksController get instance => Get.find();

  TextEditingController taskNote = TextEditingController();

  Future<void> createTask() async {
    final String taskNoteValue = taskNote.text;
    try {
      await UserRepository.instance.saveTask(taskNoteValue);
      Get.snackbar('Listo', 'Nueva tarea añadida');
    } catch (error) {
      Get.snackbar('Ups', 'No se ha podido guardar esta tarea: $error');
      print("error: $error");
    }
  }
}
