
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/taskes.dart';

CollectionReference<taskedate> gettaskcollection(){
  return   FirebaseFirestore.instance.collection('taske').
  withConverter<taskedate>(
      fromFirestore: (Snapshot,_)=>taskedate.fromFirestore(Snapshot.data()!),
      toFirestore: (task,_)=>task.toFirestore());
}

Future<void> addtaskFirebaseFirestore(taskedate taskedate){
  var collection =gettaskcollection();
  var dcoref =collection.doc();
  taskedate.id= dcoref.id;
  return dcoref.set(taskedate);

}

Stream<QuerySnapshot<taskedate>> gettaskFirebaseFirestore(DateTime dateTime){
  return gettaskcollection().where('date',
      isEqualTo:DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).snapshots();
}


Future<void> deletetaskFirebase(String id){
  return gettaskcollection().doc(id).delete();
}
Future<void> updateiconFirebase(String id){
  return gettaskcollection().doc(id).update({
    "isdone" : true
  });
}
Future<void> updatedataFirebase(String id,taskedate taskedate){
  var taskmap = taskedate.toFirestore();
  return gettaskcollection().doc(id).update(taskmap);
}