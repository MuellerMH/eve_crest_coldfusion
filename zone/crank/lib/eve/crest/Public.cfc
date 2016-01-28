/**
*
* @file  /D/DEV/eve-tycoon/zone/crank/lib/eve/crest/Public.cfc
* @author  
* @description
*
*/

component extends="zone.crank.lib.eve.crest.Api" {	

	this.EVE_SSO_HOST = "public-crest.eveonline.com";
	
	remote function getAlliances() returnFormat="JSON"{
		this.endpoint = "alliances";
		return this.sendRequest();
	}
	
	remote function getRegions() returnFormat="JSON"{
		this.endpoint = "regions";
		return this.sendRequest();
	}
	
	remote function getWars() returnFormat="JSON"{
		this.endpoint = "wars";
		return this.sendRequest();
	}
	
	remote function getIncursions() returnFormat="JSON"{
		this.endpoint = "incursions";
		return this.sendRequest();
	}
	
	remote function getTournaments() returnFormat="JSON"{
		this.endpoint = "tournaments";
		return this.sendRequest();
	}
	
	remote function getTypes() returnFormat="JSON"{
		this.endpoint = "types";
		return this.sendRequest();
	}
	
	remote function getInventoryGroups() returnFormat="JSON"{
		this.endpoint = "inventory/groups";
		return this.sendRequest();
	}
	
	remote function getInventoryCategories() returnFormat="JSON"{
		this.endpoint = "inventory/categories";
		return this.sendRequest();
	}
}