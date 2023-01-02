import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// @class : get_binding_view
/// @date : 2023-01-02 19:43
/// @name : wangzs
/// @description : 基类,用于绑定Controller
abstract class GetBindingView<T extends GetxController> extends StatefulWidget {
  const GetBindingView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @protected
  Widget build(BuildContext context);

  @protected
  Bindings? binding();

  @override
  AutoDisposeState createState() => AutoDisposeState<T>();
}

/// @class : AutoDisposeState
/// @name : wangzs
/// @description :基类,可自动装载的状态管理
class AutoDisposeState<S extends GetxController> extends State<GetBindingView> {
  AutoDisposeState();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<S>(builder: (controller) {
      return widget.build(context);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.binding()?.dependencies();
  }

  @override
  void dispose() {
    Get.delete<S>();
    super.dispose();
  }
}
