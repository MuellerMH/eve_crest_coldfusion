/**
*
* @file  /D/dev/cf/zone/crank/lib/EVEAuth.cfc
* @author  
* @description
*
*/

component {

	this.APP_CALLBACK = "http://xxxxxxxxxxxxxx.xxx/xxxxxxxx";
	this.EVE_SSO_HOST = "login.eveonline.com";
	this.EVE_SSO_CLIENTID = "XXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	this.EVE_SSO_SECRET = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	this.MY_USER_AGENT = "EVE-Tycoon 1.0.0, eveAuth 0.0.1, EVE client_id " & this.EVE_SSO_CLIENTID;

	this.code = "";
	this.token = "";

	public function init(){
		return this;
	}

	
	/**
	 * First Step to Redirect to the EVEOnline Login Page.
	 * @return {[type]} string [description] Redirect URL to use in Frontend Login Button
	 */
	public function redirect() {
		return "https://" 
		& this.EVE_SSO_HOST 
		& "/oauth/authorize?response_type=code&client_id="&this.EVE_SSO_CLIENTID&"&state=" 
		& createUUID()
		& "&redirect_uri=" 
		& this.APP_CALLBACK;
	}

	/**
	 * Second Step to Auth with EVEOnline this code must procesed on the Redirect URL 
	 * @return {[type]} struct [description] contains the Logged User Information
	 * @param  {[type]} string code         [description] this is the code form EVEOnline send too your redirect URL in URL Param &code 
	 */
	public function getToken(string code=="") {

		if(len(arguments.code)) this.code = arguments.code;

		var h = new http( url = "https://#this.EVE_SSO_HOST#/oauth/token", method = "post" );
		h.addParam( type = "header", name = "Authorization", value = "Basic #ToBase64(this.EVE_SSO_CLIENTID&":"&this.EVE_SSO_SECRET)#" );
		h.addParam( type = "formField", name = "grant_type", value = "authorization_code" );
		h.addParam( type = "formField", name = "code", value = this.code );
		var p = h.send().getPrefix();
		if(p.status_code == 200) {
			this.token = deserializeJSON(p.filecontent).access_token;
			return this.setUser();
		}
	}

	/**
	 * Get the Current User Information from EVEOnline
	 * @return {[type]} struct [description] contains the Logged User Information
	 */
	public function getUser() {
		var h = new http( url = "https://#this.EVE_SSO_HOST#/oauth/verify", method = "get" );
		h.addParam( type = "header", name = "Authorization", value = "Bearer #this.token#" );
		var p = h.send().getPrefix();
		if(p.status_code == 200) {
			data = deserializeJSON(p.filecontent);			
			return data;
		}
	}

	/**
	 * To update a outdate token use this Method
	 * @param  {[type]} string token         [description] 
	 */
	public function refreshToken() {
		var h = new http( url = "https://#this.EVE_SSO_HOST#/oauth/token", method = "post" );
		h.addParam( type = "header", name = "Authorization", value = "Basic #ToBase64(this.EVE_SSO_CLIENTID&":"&this.EVE_SSO_SECRET)#" );
		h.addParam( type = "formField", name = "grant_type", value = "refresh_token" );
		h.addParam( type = "formField", name = "refresh_token", value = this.token );
		var p = h.send().getPrefix();
		if(p.status_code == 200)
			this.token = deserializeJSON(p.filecontent).access_token;
	}

	public function getToken() {
		return this.token;
	}
}