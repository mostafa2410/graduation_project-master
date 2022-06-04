class AlekaModel{
  String? alekaName;
  String? season;
  String? casse;
  List<String?>? ingredients;
  String? alekaPrice;

  AlekaModel(this.alekaName,this.season,this.casse,this.ingredients,this.alekaPrice);
  AlekaModel.fromJson(Map<String,dynamic>? json){
    alekaName   =json!['alekaName'];
    season   =json['season'];
    casse   =json['casse'];
    alekaPrice  =json['alekaPrice'];
    ingredients=json['ingredients'].cast<String>() ;
  }
  Map<String,dynamic> toMap(){
    return
      {
        'alekaName':alekaName,
        'season':season,
        'casse':casse,
        'alekaPrice':alekaPrice,
        'ingredients':ingredients,
        };
  }
}