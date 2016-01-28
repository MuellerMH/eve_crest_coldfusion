/**
*
* @file  /D/DEV/eve-tycoon/zone/crank/lib/eve/xml/Api.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {
	this.host = "https://api.eveonline.com/";
	this.key = "";
	this.vCode = "";
	public function init(){
		return this;
	}

	private function sendRequest(){
		if(!len(this.key) OR !len(this.vCode)){
			user = this.queryDatabase("SELECT * FROM user WHERE characterid=:charid",{charid:SESSION.user.characterid});
			this.key = user.api_key_char;
			this.vCode = user.api_vcode_char;
		}
		var h = new http( url = this.host & this.endpoint & '.xml.aspx?keyID=#this.key#&vCode=#this.vcode#&characterID=#SESSION.user.characterid#&flat=1', method = "get" );
		var p = h.send().getPrefix();
		if(p.status_code == 200)
			return xmlparse(p.filecontent);
	}


	private function queryDatabase(string sqlString, struct data) {
		myQry = new Query(); // new query object     
	    myQry.setSQL(arguments.sqlString); //set query
	    for(value in data){
		    myQry.addParam(name="#value#",value="#data[value]#",CFSQLTYPE="CF_SQL_VARCHAR"); // add query param
	    }
	    qryRes = myQry.execute(); // execute query
	    return qryRes.getResult();
	}
}