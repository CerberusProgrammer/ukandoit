import 'package:get/get.dart';
import 'package:ukandoit/projects/project.model.dart';

class ProjectController extends GetxController {
  var projects = <Project>[].obs;

  void removeProject(Project project) {
    projects.remove(project);
    update();
  }

  void patchProject({
    required Project oldProject,
    required Project newProject,
  }) {
    final index = projects.indexWhere((p) => p == oldProject);

    if (index != -1) {
      projects[index] = newProject;
      update();
    } else {
      throw Exception('Not found project.');
    }
  }
}
