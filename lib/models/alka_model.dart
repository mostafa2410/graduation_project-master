class AlkaModelData{
  String ?energy;
  String?steal ;
  String ?broutine ;
 

  AlkaModelData(
    {required this.energy,
    required this.steal,
    required this.broutine,
    
    }
    );
  AlkaModelData.fromJson(Map<String,dynamic>?json){
    energy=json!['energy'];
    steal=json['steal'];
    broutine=json['broutine'];
 
  }
  Map<String,dynamic> toMap(){
    return{
      'energy':energy,
      'steal':steal,
      'broutine':broutine,
     
    };
  }

}
