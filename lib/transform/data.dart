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

final sampleItems = <IntroItem>[
  new IntroItem(title: "Avec un passé historique riche et glorieux, le groupe La Poste n'est plus à présenter", category: 'GROUPE LA POSTE', imageUrl: 'assets/laposte1.jpg',),
  new IntroItem(title: 'Situé au coeur de la région du Rhone Alpes ...', category: 'PIC SAINT-PRIEST', imageUrl: 'assets/laposte2.jpg',),
  new IntroItem(title: 'Le saviez-vous ? découvrez les news ...', category: 'BRIN DE REJET', imageUrl: 'assets/laposte3.jpg',),
];