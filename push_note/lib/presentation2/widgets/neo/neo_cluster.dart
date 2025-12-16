import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/presentation2/widgets/base/app_cluster.dart';

class NeoCluster extends AppCluster {
  final Widget child;
  final bool isCard;
  const NeoCluster({required this.child, this.isCard = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isCard ? 0 : 18.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(24)),
          depth: 8,
          lightSource: LightSource.bottomRight,
          color: AppColors.grey,
        ),
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
