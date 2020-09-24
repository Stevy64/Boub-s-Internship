import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


void main() {
  runApp(GroupeLaPoste());
}

class GroupeLaPoste extends StatelessWidget {
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


final String histoireText = "Dans la génèse, La Poste a été créée au XVème siècle pour transporter les messages qu’envoyait le roi ​Louis XI. Ce n’est "
    "qu’en 1576 que le courrier a pu être envoyé de particuliers à particuliers.\n\n"
    "Les décennies 1990 et surtout 2000 sont marquées par le phénomène de baisse continue des volumes de courriers et l'ouverture à la concurrence des marchés postaux.\n"
    "La Poste a ainsi perdu progressivement le monopole de l’acheminement et de la distribution du courrier en France. Ce qui a favorisé la diversification du groupe vers d’autres secteurs d’activités.";

final String avant91Text = "La Poste est issue des​​ relais de poste​ créés par​ ​Louis XI​ en​ ​1477​ pour le transport des messages royaux et surtout des offices de messagers royaux créés en​​ 1576​ qui étaient "
    "autorisés à transporter le courrier des particuliers.\n\n"
    "C'est au début du XVII​ e​ siècle que date l'origine de l'administration des postes en France, avec la création de la « poste aux lettres ».";

final String avant2k10Text = "Les décennies 1990 et surtout 2000 sont marquées par la baisse continue des volumes de "
    "courrier, dans un contexte d’ouverture à la concurrence des marchés postaux à l’échelle européenne.\n\n"
    "Ainsi La Poste perd progressivement le monopole de l’acheminement et de la distribution du courrier en France.\n"
    "Depuis les​ ​années 2000​ la Poste s'agrandit et propose "
    "à ses clients d'autres services, car désormais en concurrence sur l'ensemble du marché du courrier en vertu de son changement de statut, en 2010.";

final String avant2k15Text = "La loi postale visait à préparer l’augmentation de capital en transformant La Poste en société anonyme à capitaux 100 % publics en mars 2010. "
    "Elle avait également pour objet de prévoir l’ouverture totale du marché du courrier, en 2011.\n\n"
    "En juin​ ​ 2014​, la Poste annonce qu'elle arrêtera l'exploitation des​ ​TGV postaux​ en 2015. Elle prévoit toutefois de continuer à utiliser le rail notamment avec le​ ​transport "
    "combiné​ 15​. Les TGV postaux effectuent leurs derniers services commerciaux le 27 juin 2015.";

final String laposteAvenirText = "En janvier 2014,​ ​Philippe Wahl​, devenu​ PDG​ du groupe La Poste en "
    "2013, dévoile son plan stratégique à l'horizon 2020.\n"
    "L'enjeu est de pallier l'impossibilité pour l'activité courrier historique de couvrir les coûts du​ service universel postal​ dès 2020.\n\n"
    "Le plan comprend cinq projets à développer, dans les secteurs suivants : la transition "
    "énergétique, la logistique urbaine, le commerce électronique, la connaissance des clients et la modernisation de l'action publique.";

final String laposteEnChiffreText = "Depuis 2010, la Poste est devenu une société anonyme à capitaux 100% publics.\n"
    "On ne dénombre pas moins de 17 000 points de contacts dans le monde, avec un effectif de 266 618 employés en 2012.\n\n"
    "La Poste a réalisé en 2012 en chiffre d’affaire de 21 658 millions d’euros malgré une forte dette de 2903 millions en juin 2013.";

final String secteurActiviteText = "Dans son élan multisectoriel, la poste organise son activité sous 5 branches pour répondre aux enjeux d’aujourd’hui et de demain : "
    "Services Courrier Colis : pour la logistique, la livraison et les services de proximité.\n\n"
    "1 - GeoPost : Pour la livraison express de colis à l’international.\n"
    "2 - La Banque Postale : Banque et citoyenne.\n"
    "3 - Réseau La Poste Réseau multi-activités à priorité bancaire.\n"
    "4 - Branche numérique : Transformation numérique du Groupe et de la société";

final String laPosteTechText = "Pour accompagner son plan stratégique, le Groupe La Poste crée, en 2014, une branche numérique dont "
    "la mission est d'accompagner la numérisation du Groupe La Poste et de ses activités ainsi "
    "que de soutenir l'innovation ouverte et à des fins de services publics.\n\n"
    "Pour remplir cette mission, l'​ incubateur de start-ups​ (Start'In Post) est lancé la même année.\n"
    "En 2015, La Poste lance également un programme dédié à soutenir le développement de l'​internet des objets en France, FrenchIoT.";

final String leSaviezVousText = " Saviez - vous que depuis son changement de statut en 2010, Le Groupe La Poste est en plein essort de digitalisation de son activité.\n\n"
    "Chez La Poste, vous 'simplifier la vie' est notre priorité.";

final sampleItems = <IntroItem>[
  new IntroItem(title: histoireText, category: 'HISTOIRE DE LA POSTE', imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/histoire1.jpg',),
  new IntroItem(title: avant91Text, category: "LA POSTE AVANT 1991", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/avant91.jpg',),
  new IntroItem(title: avant2k10Text, category: "LA POSTE DE 1991 À 2010", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/laposte2010.jpg',),
  new IntroItem(title: avant2k15Text, category: "LA POSTE DE 2010 À 2015", imageUrl: 'assets/LaPosteImages/tgvpostal.jpg',),
  new IntroItem(title: laposteAvenirText, category: "LA POSTE ET L'AVENIR", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/avenir2.png',),
  new IntroItem(title: laposteEnChiffreText, category: "LA POSTE EN CHIFFRES", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/chiffres.jpg',),
  new IntroItem(title: secteurActiviteText, category: "SECTEURS D'ACTIVITÉ", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/activite.jpg',),
  new IntroItem(title: laPosteTechText, category: "LA POSTE & TECH", imageUrl: 'assets/LaPosteImages/POSTE/GroupeLaPoste/avenir3.jpg',),
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
