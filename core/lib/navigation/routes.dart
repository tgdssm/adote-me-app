enum Routes {
  initial(path: "/"),
  login(path: "/login"),
  home(path: "/home");

  const Routes({required this.path});
  final String path;

  String moduleNavigate(String module) {
    final newModule = module.substring(0, module.length - 1);
    return "$newModule$path";
  }
}
