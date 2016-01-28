/**
*
* @file  /D/DEV/eve-tycoon/zone/crank/lib/EVEApi.cfc
* @author  
* @description
*
*/

component {
	this.eveToken = "";
	this.endpoint = "regions";
	this.EVE_SSO_HOST = "public-crest.eveonline.com";
	this.EVE_SSO_CLIENTID = "XXXXXXXXXXXXXXXXXXXXXX";
	this.MY_USER_AGENT = "MyApp 1.0.0, eveAuth 0.0.1, EVE client_id " & this.EVE_SSO_CLIENTID;

	public function init(string eveToken=""){
		this.eveToken = arguments.eveToken;
		return this;
	}


	private function sendRequest(){
		var h = new http( url = "https://#this.EVE_SSO_HOST#/#this.endpoint#/", method = "get" );
		h.addParam( type = "header", name = "Authorization", value = "Bearer  #this.eveToken#" );
		var p = h.send().getPrefix();
		if(p.status_code == 200)
			return deserializeJSON(p.filecontent);
	}

	private function sendRequestByHref(string href){
		var h = new http( url = arguments.href, method = "get" );
		h.addParam( type = "header", name = "Authorization", value = "Bearer  #this.eveToken#" );
		var p = h.send().getPrefix();
		if(p.status_code == 200)
			return deserializeJSON(p.filecontent);
	}

}