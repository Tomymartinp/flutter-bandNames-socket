

class Band {

String id, name, votes;

Band({
required this.id,
required this.name,
required this.votes,


});


factory Band.fromMap( Map<String, dynamic> obj) 
=> Band(
id: obj['id'], 
name: obj['name'],
votes: obj['votes'],



);

}