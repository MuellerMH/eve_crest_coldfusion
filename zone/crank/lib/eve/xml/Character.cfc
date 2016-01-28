/**
*
* @file  /D/DEV/eve-tycoon/zone/crank/lib/eve/xml/Character.cfc
* @author  
* @description
*
*/

component extends="zone.crank.lib.eve.xml.Api" {

	public function getAccountBalance(){
		this.endpoint = "char/AccountBalance";
		return this.sendRequest();
	}

	public function getAssets(){
		this.endpoint = "char/AssetList";
		return this.sendRequest();
	}

	public function getBlueprints(){
		this.endpoint = "char/Blueprints";
		return this.sendRequest();
	}

	public function getBookmarks(){
		this.endpoint = "char/Bookmarks";
		return this.sendRequest();
	}

}