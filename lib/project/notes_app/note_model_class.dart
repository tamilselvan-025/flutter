
class Note{
   int? id;
   String title='No Title';
   String description='';

   Note({required this.id,required this.title,required this.description});

   factory Note.fromJson(Map<String,dynamic>json){
      if(json['id']==null) {
         throw Exception("The Id is Null...!");
      }
      if((json['title'] as String).isEmpty){
      json['title']="No Title";
      }
      return Note(id: json['id'], title:json['title'] , description: json['description']);
   }
   Map<String,dynamic> toJson(){
      return {
         'id':id,
         'title':title,
         'description':description,
      };
   }
}

