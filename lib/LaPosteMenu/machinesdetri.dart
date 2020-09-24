import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


void main() {
  runApp(MachinesPIC());
}

class MachinesPIC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machines de tri',
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


final String presentationText = "Les machines de tri industrielles (MTI) sont des machines de tri automatique qui peuvent "
    "atteindre des performances de 40000 lettres triées par heure.\n\n"
    "Ces machines sont dotées de lecteurs optiques et communiquent avec un système d’information central (Unité de "
    "Reconnaissance d’Adresse, URA) pour identifier et en ensuite imprimer la destination numérique du courrier.";

final String mtiGFText = "La PIC de Saint-Priest dispose de 2 machines de tri industrielles "
    "grand format (MTI GF) d’une valeur d’environ 4 millions d’euros chacune.\n\n"
    " - Débit : 32 000 plis à l’heure\n"
    " - Tri du courrier grand format : jusqu’à 32 mm d’épaisseur\n"
    " - 480 séparations";

final String mtiPFText = "La PIC de Saint-Priest dispose de 9 machines de tri industrielles petit format (MTI PF) "
    "d’une valeur d’environ 1,5 million d’euros l’unité.\n\n"
    " - Débit : 40 000 plis à l’heure\n"
    " - Tri du courrier petit format jusqu’à 80 g.\n"
    " - 256 séparations réparties de chaque côté sur 2 niveaux.";

final String autreMachineText = "Au brin de rejet, il y a aussi une autre machine qui achémine les bacs à trier.\n"
    "Ces bacs contiennent des courriers de la région et de toute la France.\n\n"
    "Il s'agit descriptivement d'un tapis de cylindres métalliques sur lesquels roulent les bacs.\n"
    "Ce dispositif est doté de capteurs permettant de stopper automatiquement le trafic en cas de saturation.";

final String lesKubsText = " Kub : Contenant pour les produits marketing et plis du courrier industriel.";

final String lesKe7Text = " Ké7 : Contenant orange pour les plis Petit Format.";

final String lesBaksText = " Bak : Contenant gris pour les plis Grand Format.";

final String lesCV300Text = " CV300 : Chariot à fond rétractable permettant le trasnport des encombrants (plis dépssant les dimensions, par ex).";

final String lesCE30Text = " CE30 : Chariot d'empilage permettant le transport de bak et ké7.";

final String lesDiedresText = " Dièdres : Chariot transportant le Grand Format.";

final String leSaviezVousText = " Le Saviez - vous ? Les Machines de Tri industrielles sont faciles à fabriquer. Je compte d'ailleurs en "
    "fabriquer une... La recette ?\n\n"
    "Des capteurs, des caméras optiques et de la ferraille. Je crois que c'est tout !\n\n"
    "Hey ... vous m'avez cru ???    :-)";


final sampleItems = <IntroItem>[
  new IntroItem(title: presentationText, category: "QU'EST-CE QU'UNE MTI ?", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/bacs1.jpg',),
  new IntroItem(title: mtiGFText, category: "MTI GF", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtigf2.jpg',),
  new IntroItem(title: mtiPFText, category: "MTI PF", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtipf1.jpg',),
  new IntroItem(title: autreMachineText, category: "AUTRE MACHINE", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/brin.png',),
  new IntroItem(title: lesKubsText, category: "LES KUBs", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/kub.jpg',),
  new IntroItem(title: lesKe7Text, category: "LES KÉ7", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/ke7.jpg',),
  new IntroItem(title: lesBaksText, category: "LES BAKs", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/bak.jpg',),
  new IntroItem(title: lesCV300Text, category: "LES CV300", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/cv300.png',),
  new IntroItem(title: lesCE30Text, category: "LES CE30", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/ce30.png',),
  new IntroItem(title: lesDiedresText, category: "LES DIÈDRES", imageUrl: 'assets/laposte4.jpg',),
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
