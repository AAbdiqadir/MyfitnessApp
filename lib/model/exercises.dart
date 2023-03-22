

class exercises{

  String type;
  String Image;
  String ExerciseAnatomy;
  String Description;
  String video;
  String name;

  exercises({

    required this.type,
    required this.Image,
    required this.ExerciseAnatomy,
    required this.Description,
    required this.video,
    required this.name

});

  Map<String,dynamic>toJon()=>{
    "type":type,
    "Image":Image,
    "ExerciseAnatomy":ExerciseAnatomy,
    "Description":Description,
    "video": video,
    "name":name

  };
  exercises.fromSnapshot(snapshot)
  :
    name = snapshot.data()["name"],
    Image = snapshot.data()["Image"],
        ExerciseAnatomy = snapshot.data()["ExerciseAnatomy"],
        Description = snapshot.data()["Description"],
        video = snapshot.data()["video"],
        type = snapshot.data()["type"];



}