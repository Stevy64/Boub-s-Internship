import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


void main() {
  runApp(MachinesUtilisees());
}

class MachinesUtilisees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machines utilisées',
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



final String presentationText = "Au pôle de tri, certaines machines et outils sont utilisés pour réaliser de nombreuses tâches differentes et coordonnées. "
    "Le pôle tri est lui même partitionné en plusieurs sous compartiments. Et chaque section du pôle tri utilise ses propres outils...\n\n"
    "Pendant mon stage, j'ai eu à utiliser : les MTIs GF, la machine du Brin de rejet et bien d'autres.\n";

final String machineTriText = "Concernant la Machine de Tri Industriel Grand format (MTI GF), elle traite un type de courrier"
    "selon un certain nombre de caractéristiques.\n\n"
    "En effet, contrairement aux machines de type MTI PF, ces machines sont adaptées au courrier de grande taille et/ou plus lourd.\n\n"
    "Elles sont dotées de 2 écrans aux interfaces simples et intuitives pour piloter l’ensemble de l’activité de la ligne";

final String brinRejetText = "Après le dépilage au grand format, la deuxième tâche sur laquelle j’ai le plus travaillé durant mon stage est le brin de rejet.\n\n"
    "La gestion de l'activité du brin de réjets peut se résumer ainsi :\n\n"
    "-> Organisation de l’activité du brin de rejet\n"
    "-> Rangement des caissettes dans des CE30 selon leurs destinations\n"
    "-> Puis rangement des CE30 selon leurs destinations.";

final String autreOutilsText = "En plus de ces deux missions principales, j’ai aussi été affecté à d’autres missions ponctuelles."
    " À savoir, la dépiaute et la presse dont l’objectif est de dépaqueter du courrier contenu dans des Kubs.\n\n"
    "Je participais aussi quotidiennement au nettoyage et au débogage des machines de tri à la fin de l’activité.\n\n"
    "J’ai également piloté quelques engins de déplacement des Kubs à la demande soit des référents, soit d’autres ouvriers expérimentés.";

final String leSaviezVousText = " Le Brin de rejet était mon poste favori. Pour 2 raisons :\n\n"
    "\t 1) Le travail est léger\n"
    "\t 2) Le temps passe très vite\n\n"
    "Mais parfois c'était très chaud hein... surtout les samedis ";

final sampleItems = <IntroItem>[
  new IntroItem(title: presentationText, category: 'PRESENTATION', imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtipf1.jpg',),
  new IntroItem(title: machineTriText, category: "LES MTI GF", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtigf2.jpg',),
  new IntroItem(title: brinRejetText, category: "BRIN DE REJET", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/brin.png',),
  new IntroItem(title: autreOutilsText, category: "AUTRES OUTILS", imageUrl: 'assets/LaPosteImages/STAGE/MachinesUtilisees/bak.jpg',),
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
