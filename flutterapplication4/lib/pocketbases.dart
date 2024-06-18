import 'package:pocketbase/pocketbase.dart';

void main() async {
  // Initialiser PocketBase avec l'URL du serveur
  final pb = PocketBase('http://127.0.0.1:8090/_/');

  // Lister et rechercher des enregistrements dans la collection 'example'
  final list = await pb.collection('example').getList(
    page: 1,
    perPage: 100,
    filter: 'title != "" && created > "2022-08-01"',
    sort: '-created,title',
  );
  print('Liste des enregistrements : ${list.items}');

  // Récupérer un seul enregistrement de la collection 'example'
  final record = await pb.collection('example').getOne('RECORD_ID');
  print('Enregistrement récupéré : $record');

  // Créer un nouvel enregistrement dans la collection 'example'
  final newRecord = await pb.collection('example').create(body: {
    'title': 'Lorem ipsum dolor sit amet',
  });
  print('Nouvel enregistrement créé : $newRecord');

  // Supprimer un enregistrement de la collection 'example'
  await pb.collection('example').delete('RECORD_ID');
  print('Enregistrement supprimé');

  // S'abonner aux changements dans la collection 'example'
  pb.collection('example').subscribe('*', (e) {
    print('Changement détecté dans l\'enregistrement : ${e.record}');
  });

  // Arrêter l'écoute des changements après 10 secondes (par exemple)
  await Future.delayed(Duration(seconds: 10));
  pb.collection('example').unsubscribe();
  print('Désabonnement des changements');
}
