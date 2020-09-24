import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


void main() {
  runApp(SaintPriestPIC());
}

class SaintPriestPIC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groupe La Poste',
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


final String presentationText = "La PIC de Saint-Priest est le centre de tri postal et de distribution du courrier de La Poste regroupant d'anciens centres de tri de deux "
    "départements : le Rhône et l'Ain. \nLa mécanisation a permis de réaliser des gains de productivité : l'effectif, qui était de 1.200 personnes "
    "sur les centres de tri d'origine, est d'environ 650 personnes sur le nouveau site.\n\n"
    "La PIC de Lyon Saint-Priest c’est 4 millions de plis traités par jour, 9 millions de plis en"
    "transit et environ 620 agents. Elle est ouverte du dimanche 18h00 au samedi 20h00.";

final String planSiteText = "Concernant le pôle tri, il est divisé en deux parties : le tri petit format pour trier les petits courriers à l’aide de machines de tri industrielles dits petit format (MTI PF)"
    " et le tri grand format pour trier les grands courriers et colis à l’aide de machines de tri industrielles grand format (MTI GF).\n\n"
    "L'ensemble des courriers et colis transite d'un pôle à l'autre pendant le traitement.\n\n";

final String poleLogistiqueText = "N’ayant pas été affecté au pôle logistique, je n’ai pas eu assez de détails sur ce pôle.\n\n"
    "Mais grossièrement, le pôle logistique réceptionne "
    "du courrier dans des véhicules, l’achemine dans une PIC pour ensuite (après traitement) le ventiler dans toute la France et vers l’international.\n\n"
    "Après cela, direction le pôle tri (Grand ou Petit format).";

final String poleTriText = "Concernant le pôle tri, il est divisé en trois : \n\n"
    "\t - Le tri manuel qui reçoit les courriers et les colis à trier à la main.\n\n"
    "\t - Le tri petit format pour trier les petits courriers à l’aide des MTI PF.\n\n"
    "\t - Le tri grand format pour trier les grands courriers, à l'aide des MTI GF";

final String triGrandFormatText = "La PIC de Saint-Priest dispose de 2 machines de tri industrielles "
    "grand format (MTI GF) d’une valeur d’environ 4 millions d’euros chacune.\n\n"
    " - Débit : 32 000 plis à l’heure\n\n"
    " - Tri du courrier grand format : jusqu’à 32 mm d’épaisseur\n\n"
    " - 480 séparations";

final String triPetitFormatText = "La PIC de Saint-Priest dispose de 9 machines de tri industrielles petit format (MTI PF) "
    "d’une valeur d’environ 1,5 million d’euros l’unité.\n\n"
    " - Débit : 40 000 plis à l’heure\n\n"
    " - Tri du courrier petit format jusqu’à 80 g.\n\n"
    " - 256 séparations réparties de chaque côté sur 2 niveaux.";

final String triManuelText = "L’ensemble du courrier ne peut être traité par les machines."
    " Une partie du trafic est donc traitée manuellement ; notamment les expéditions, les recommandés et les objets signalés.\n\n"
    " Le tri manuel est effectué par des agents expérimentés.\n\n"
    "En substance, ils trient le courrier que les machines ne peuvent pas traiter pour diverses raisons : dimesions trop grandes ou trop petites, type de courrier etc.";

final String acheminementCourrierText = "Les courriers des particuliers et des entreprises sont récupérés dans des PDC en partance pour les PPDC,"
    " puis vers les PIC pour le tri et la redistribution vers une PPDC ou une autre PIC.\n\n"
    "PDC : La Plateforme de Distribution du Courrier, est un centre où le courrier est trié puis distribué ; elle est approvisionnée par la PPDC.\n"
    "PPDC : La Plateforme de Préparation et de Distribution du Courrier concentre du courrier sur une zone géographique et alimente plusieurs PDC. C’est un relais entre les PDC et la PIC.\n"
    "PIC : La Plateforme Industrielle du Courrier est au sommet de l’acheminement du courrier, et a pour fonction de recevoir et relayer les envois des PPDC et d’autres PIC. Une PIC alimente plusieurs PPDC qui à leur tour alimentent plusieurs PDC.";

final String leSaviezVousText = "\nOuverte le 17 décembre 2007, la PIC de Saint-Priest s’étale sur une superficie de 30 000 m2 "
    "et a mobilisé 62,3 millions d’€ d’investissement ; dont 50% pour la construction des bâtiments et 50% pour le parc machine.";

final sampleItems = <IntroItem>[
  new IntroItem(title: presentationText, category: 'PRÉSENTATION', imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/pic_site.png',),
  new IntroItem(title: planSiteText, category: "PLAN DU SITE", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/pic_plan1.png',),
  new IntroItem(title: poleLogistiqueText, category: "POLE LOGISTIQUE", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/logistique.jpg',),
  new IntroItem(title: poleTriText, category: "POLE TRI", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtigf1.jpg',),
  new IntroItem(title: triGrandFormatText, category: "TRI GF", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtigf2.jpg',),
  new IntroItem(title: triPetitFormatText, category: "TRI PF", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/mtipf1.jpg',),
  new IntroItem(title: triManuelText, category: "TRI MANUEL", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/manuel.jpg',),
  new IntroItem(title: acheminementCourrierText, category: "ACHEMINEMENT D'UN COURRIER", imageUrl: 'assets/LaPosteImages/POSTE/PicSaintPriest/parcours.png',),
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
