// Card(
// child: ListTile(
// title: Text(snapshot.data!.docs[index].get('name')),
// subtitle: IconButton(
// icon: Icon(Icons.thumb_down_alt_rounded),
// onPressed: (){
// FirebaseFirestore.instance.collection('cart').doc(snapshot.data!.docs[index].id).delete();
// Navigator.pushReplacementNamed(context, '/ThisItem');
//
// }
// ),
// )
// );