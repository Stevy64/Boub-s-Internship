import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


void main() {
  runApp(JourneeType());
}

class JourneeType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Une Journée Type',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPageView(),
    );
  }
}


class IntroPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);

                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}


class IntroPageItem extends StatelessWidget {
  IntroPageItem({
    @required this.item,
    @required this.pageVisibility,
  });

  final IntroItem item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: Text(
        item.category,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 14.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

    var titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          item.title,
          style: textTheme.title
              .copyWith(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          categoryText,
          titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      item.imageUrl,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            image,
            imageOverlayGradient,
            _buildTextContainer(context),
          ],
        ),
      ),
    );
  }
}

/*
  ICI ON CHANGE LES IMAGES ET LES TEXTES RESPECTIFS ...
 */
class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}


final String travailText = "Pendant tout mon mois de stage, j’ai principalement travaillé sur la Machine de Tri Industriel"
    " Grand Format (MTI GF) et sur le Brin de rejets Grand Format.\n\n"
    "Ci-après, une journée typique de mon séjour à Lyon pendant mes jours de travail.\n\n"
    "Allez ! Viens avec moi ... ";

final String reveilText = "( IL EST 4h00 ) \n\n\n"
    "Mon réveil sonne une première fois ... puis une deuxième fois.\n\n"
    "Je me lève enfin, je m’apprête et prends mon petit déjeuné car la journée va être musclée.\n";

final String metroText = "( IL EST 5h00 ) \n\n\n"
    "Je me rends à la station - Monplaisir Lumière - pour attendre le métro D qui passe à 5h15 en direction de la Gare de Vénissieux.\n";

final String busText = "( IL EST 5h23 ) \n\n\n"
    "Après une attente de 2 minutes, je prends le bus qui me laisse à 5 minutes à pieds du site.\n";

final String arriveeText = "( IL EST 5h35 ) \n\n\n"
    "Arrivé au vestiaire hommes, je porte mon uniforme de travail"
    " et me rends au pôle Tri GF pour voir mes tâches du jour.\n\n"
    " Sur un tableau, on y voit les noms des ouvriers et leurs tâches de la journée.\n\n"
    "D'ailleurs d'après le tableau, aujourd’hui je vais commencer sur la MTI-GF 12. C’est-à-dire sur le dépileur N°2 de la ligne N°1.\n";

final String pause1Text = "( IL EST 7h30 ) \n\n\n"
    "cela fait plus d'une heure que j'ai commencé. Il est temps pour moi de prendre une pause de 10 minutes avant de revenir continuer le dépilage.\n\n"
    "Ah ! J'ai oublié de vous dire, parfois c'est fatiguant le tri GF.\n";

final String pause2Text = "( IL EST 9h30 ) \n\n\n"
    "Je prends une pause de 30 minutes. J’ai assez de temps pour m’alimenter, me reposer et discuter avec mes collègues.\n\n"
    "Et en anglais bien sûr ... car certains de mes - Team mates - stagiaires étaient des étudiants étrangers.";

final String reunionText = "( IL EST 10h00 ) \n\n\n"
    "Une petite réunion de débriefe d’environ 5 minutes est organisée pour nous édifier sur nos performances de la journée précédente et sur les objectifs du jour.\n";

final String finiText = "( YOUU OUHHH ) \n\n"
    "Après les 5 minutes de réunion, je consulte à nouveau le tableau pour voir la suite de ma journée de travail.\n\n"
    " Il m’indique qu’après la pause de 9h30, je quitte le dépilage pour rejoindre un autre stagiaire au Brin de rejets.\n\n"
    " je vais y passer le reste la journée ; c’est à dire jusqu’à 13h30.\n";

final String leSaviezVousText = "En fait ... Vous savez déjà beaucoup sur mon stage !\n\n"
    "Je dirais même que vous savez tout ... ou presque.";

final sampleItems = <IntroItem>[
  new IntroItem(title: travailText, category: 'INTRODUCTION', imageUrl: 'assets/LaPosteImages/STAGE/JourneeType/intro.jpg',),
  new IntroItem(title: reveilText, category: "REVEIL", imageUrl: 'assets/LaPosteImages/STAGE/JourneeType/reveil.jpg',),
  new IntroItem(title: metroText, category: "MÉTRO", imageUrl: 'assets/LaPosteImages/STAGE/JourneeType/metro.jpg',),
  new IntroItem(title: busText, category: "BUS", imageUrl: 'assets/LaPosteImages/STAGE/JourneeType/bus.jpg',),
  new IntroItem(title: arriveeText, category: "AU SEIN DE LA PIC", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/pic_site.png',),
  new IntroItem(title: pause1Text, category: "PREMIERE PAUSE", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtigf2.jpg',),
  new IntroItem(title: pause2Text, category: "DEUXIEME PAUSE", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/brin.png',),
  new IntroItem(title: reunionText, category: "RÉUNION", imageUrl: 'assets/LaPosteImages/STAGE/JourneeType/reunion.jpg',),
  new IntroItem(title: finiText, category: "JE RENTRE CHEZ MOI !", imageUrl: 'assets/LaPosteImages/STAGE/JourneeType/friday.jpg',),
  new IntroItem(title: leSaviezVousText, category: "LE SAVIEZ-VOUS ?", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/lesaviezvous1.jpg',),
];





/*
  /////////////////////////////  ZONE INTERDITE  /////////////////////////////////
 */





/*
  NE PAS TOUCHER À CECI, CAR C'EST ICI TOUTE LA MANIPULATION DES EFFETS
 */

/// A function that builds a [PageView] lazily.
typedef PageView PageViewBuilder(
    BuildContext context, PageVisibilityResolver visibilityResolver);

/// A class that can be used to compute visibility information about
/// the current page.
class PageVisibilityResolver {
  PageVisibilityResolver({
    ScrollMetrics metrics,
    double viewPortFraction,
  }) : this._pageMetrics = metrics,
        this._viewPortFraction = viewPortFraction;

  final ScrollMetrics _pageMetrics;
  final double _viewPortFraction;

  /// Calculates visibility information for the page at [pageIndex].
  /// Used inside PageViews' itemBuilder, but can be also used in a
  /// simple PageView that simply has an array of children passed to it.
  PageVisibility resolvePageVisibility(int pageIndex) {
    final double pagePosition = _calculatePagePosition(pageIndex);
    final double visiblePageFraction =
    _calculateVisiblePageFraction(pageIndex, pagePosition);

    return PageVisibility(
      visibleFraction: visiblePageFraction,
      pagePosition: pagePosition,
    );
  }

  double _calculateVisiblePageFraction(int index, double pagePosition) {
    if (pagePosition > -1.0 && pagePosition <= 1.0) {
      return 1.0 - pagePosition.abs();
    }

    return 0.0;
  }

  double _calculatePagePosition(int index) {
    final double viewPortFraction = _viewPortFraction ?? 1.0;
    final double pageViewWidth =
        (_pageMetrics?.viewportDimension ?? 1.0) * viewPortFraction;
    final double pageX = pageViewWidth * index;
    final double scrollX = (_pageMetrics?.pixels ?? 0.0);
    final double pagePosition = (pageX - scrollX) / pageViewWidth;
    final double safePagePosition = !pagePosition.isNaN ? pagePosition : 0.0;

    if (safePagePosition > 1.0) {
      return 1.0;
    } else if (safePagePosition < -1.0) {
      return -1.0;
    }

    return safePagePosition;
  }
}

/// A class that contains visibility information about the current page.
class PageVisibility {
  PageVisibility({
    @required this.visibleFraction,
    @required this.pagePosition,
  });

  /// How much of the page is currently visible, between 0.0 and 1.0.
  ///
  /// For example, if only the half of the page is visible, the
  /// value of this is going to be 0.5.
  ///
  /// This doesn't contain information about where the page is
  /// disappearing to or appearing from. For that, see [pagePosition].
  final double visibleFraction;

  /// Tells the position of this page, relative to being visible in
  /// a "non-dragging" position, between -1.0 and 1.0.
  ///
  /// For example, if the page is fully visible, this value equals 0.0.
  ///
  /// If the page is fully out of view on the right, this value is
  /// going to be 1.0.
  ///
  /// Likewise, if the page is fully out of view, on the left, this
  /// value is going to be -1.0.
  final double pagePosition;
}

/// A widget for getting useful information about a pages' position
/// and how much of it is visible in a PageView.
///
/// Note: Does not transform pages in any way, but provides the means
/// to easily do it, in the form of [PageVisibility].
class PageTransformer extends StatefulWidget {
  PageTransformer({
    @required this.pageViewBuilder,
  });

  final PageViewBuilder pageViewBuilder;

  @override
  _PageTransformerState createState() => _PageTransformerState();
}

class _PageTransformerState extends State<PageTransformer> {
  PageVisibilityResolver _visibilityResolver;

  @override
  Widget build(BuildContext context) {
    final pageView = widget.pageViewBuilder(
        context, _visibilityResolver ?? PageVisibilityResolver());

    final controller = pageView.controller;
    final viewPortFraction = controller.viewportFraction;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        setState(() {
          _visibilityResolver = PageVisibilityResolver(
            metrics: notification.metrics,
            viewPortFraction: viewPortFraction,
          );
        });
      },
      child: pageView,
    );
  }
}
