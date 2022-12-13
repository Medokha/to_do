class taskedate{
  String id;
  String titel;
  String description;
  int date;
  bool isdone;
  taskedate({this.id="",
    required this.titel,
    required this.description,
    required this.date,
    this.isdone=false});

  Map<String,dynamic> toFirestore(){
    return{
      "id" : id,
      "titel" : titel,
      "description" : description,
      "date" : date,
      "isdone" : isdone,

    };
  }
  taskedate.fromFirestore (Map<String,dynamic> json):this(
      id : json["id"],
      titel : json['titel'],
      description : json['description'],
      date : json['date'],
      isdone :json[ 'isdone']
  );
}

