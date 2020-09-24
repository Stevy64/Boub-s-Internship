import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


void main() {
  runApp(EvolutionSlogan());
}

class EvolutionSlogan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evolution des slogans',
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


final String presentationText = "Le slogan de la Poste a beaucoup évolué tout au long de son histoire.\n"
    "En effet, au cours de ses six siècles d'existance, le Groupe La Poste a su s'adapter à son temps.\n\n"
    "Si le logo est une vitrine des valeurs d'une entreprise, La Poste a toujours proné la proximité et la confiance.";

final String slogan86Text = "SLOGAN : << Bougez avec La Poste >>";

final String slogan90Text = "SLOGAN : << Pas de problème, La Poste est là >>";

final String slogan95Text = "SLOGAN : << La Poste, on a tous à y gagner >>";

final String slogan01Text = "SLOGAN : << Ce que l’avenir vous promet, La Poste vous l’apporte >>";

final String slogan03Text = "SLOGAN : << La confiance a de l'avenir >>";

final String slogan05Text = "SLOGAN : << Et la confiance grandit >>";

final String slogan06Text = "SLOGAN : << Faire grandir la confiance, c’est donner des ailes à chacun >>";

final String slogan08Text = "SLOGAN : << La confiance donne de l'avance >>";

final String slogan13Text = "SLOGAN : << Développons la confiance >>";

final String slogan17Text = "SLOGAN : << Simplifier la vie >>";

final String leSaviezVous = "Le saviez - vous ? La Poste bla bla bla bla...";


final sampleItems = <IntroItem>[
  new IntroItem(title: presentationText, category: "SLOGAN", imageUrl: 'assets/laposte1.jpg',),
  new IntroItem(title: slogan86Text, category: "LA POSTE 1986", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/avant91.jpg',),
  new IntroItem(title: slogan90Text, category: "LA POSTE 1990", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/histoire1.jpg',),
  new IntroItem(title: slogan95Text, category: "LA POSTE 1995", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/manuel.jpg',),
  new IntroItem(title: slogan01Text, category: "LA POSTE 2001", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/posteaero.jpg',),
  new IntroItem(title: slogan03Text, category: "LA POSTE 2003", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/laposte2010.jpg',),
  new IntroItem(title: slogan05Text, category: "LA POSTE 2005", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/laposte2015.jpg',),
  new IntroItem(title: slogan06Text, category: "LA POSTE 2006", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/avenir2.png',),
  new IntroItem(title: slogan08Text, category: "LA POSTE 2008", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/activite.jpg',),
  new IntroItem(title: slogan13Text, category: "LA POSTE 2013", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/avenir3.jpg',),
  new IntroItem(title: slogan17Text, category: "LA POSTE 2017", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/chiffres.jpg',),
  new IntroItem(title: leSaviezVous, category: "LE SAVIEZ - VOUS ?", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/lesaviezvous1.jpg',),
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
