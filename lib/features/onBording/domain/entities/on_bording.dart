import '../../../../gen/assets.gen.dart';

class OnBording {
  final String title;
  final String subTitle;
  final String imageSrc;
  OnBording({
    required this.title,
    required this.subTitle,
    required this.imageSrc,
  });
}

final List<OnBording> onBordingList = [
  OnBording(
    title: 'Get The Freshest Fruit Salad Combo',
    subTitle:
        "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
    imageSrc: Assets.images.splash.welcome1.path,
  ),
  OnBording(
    title: 'Dsdf Dfrfr GRrgsd Gsdfas',
    subTitle:
        "Sjfhioehfwe jnklsdaskl fjaaijd ioahas jknna wapwe ifroutty sdcns knciasdhcwe???",
    imageSrc: Assets.images.splash.welcome2.path,
  ),
];
