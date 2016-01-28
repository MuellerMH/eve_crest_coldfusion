component  extends="zone.crank.lib.eve.crest.Api"  {
    remote function getMotd(string type="eve")  returnFormat="JSON"{
    	switch(arguments.type){
	        case "dust":
	            this.endpoint = "http://newsfeed.eveonline.com/articles/71";
	        	break;

	        case "eve":
	            this.endpoint = "http://client.eveonline.com/motd/";
	        	break;

	        case "server":
	            this.endpoint = "http://client.eveonline.com/motd/";
	        	break;
    	}
    	return this.sendRequestByHref(this.endpoint);
    }


    remote function getCorporationRoles()  returnFormat="JSON"{
       	this.endpoint = "corporations/roles";
    	return this.sendRequest();
    }

    remote function getConstellations()  returnFormat="JSON"{
       this.endpoint = "constellations";
       return this.sendRequest();
    }

    remote function getItemGroups()  returnFormat="JSON"{
       this.endpoint = "inventory/groups";
       return this.sendRequest();
    }

    remote function getChannels()  returnFormat="JSON"{
       this.endpoint = "chat/channels";
       return this.sendRequest();
    }

    remote function getCorporations()  returnFormat="JSON"{
       this.endpoint = "corporations";
       return this.sendRequest();
    }

    remote function getAlliances()  returnFormat="JSON"{
       this.endpoint = "alliances";
       return this.sendRequest();
    }

    remote function getBattleTheatres()  returnFormat="JSON"{
       this.endpoint = "battles/theatres";
       return this.sendRequest();
    }

    remote function getMarketPrices()  returnFormat="JSON"{
       this.endpoint = "market/prices";
       return this.sendRequest();
    }

    remote function getItemCategories()  returnFormat="JSON"{
       this.endpoint = "inventory/categories";
       return this.sendRequest();
    }

    remote function getRegions()  returnFormat="JSON"{
       this.endpoint = "regions";
       return this.sendRequest();
    }

    remote function getBloodlines()  returnFormat="JSON"{
       this.endpoint = "bloodlines";
       return this.sendRequest();
    }

    remote function getMarketGroups()  returnFormat="JSON"{
       this.endpoint = "market/groups";
       return this.sendRequest();
    }

    remote function getSystems()  returnFormat="JSON"{
       this.endpoint = "solarsystems";
       return this.sendRequest();
    }

    remote function getSovereignty(string type="campaigns")  returnFormat="JSON"{
    	switch (arguments.type) {
	        case 'campaigns':
	           this.endpoint = "sovereignty/campaigns";
	           break;

	        case 'structures':
	           this.endpoint = "sovereignty/structures";
	           break;
        }
        return this.sendRequest();
    }

    remote function getMap()  returnFormat="JSON"{
       this.endpoint = "map";
       return this.sendRequest();
    }

    remote function getWars()  returnFormat="JSON"{
       this.endpoint = "wars";
       return this.sendRequest();
    }

    remote function getIncursions()  returnFormat="JSON"{
       this.endpoint = "incursions";
       return this.sendRequest();
    }

    remote function getDogma(string type="facilities")  returnFormat="JSON"{
    	switch(arguments.type) {
	       case 'attributes':
	           this.endpoint = "dogma/attributes";
	           break;

	       case 'effects':
	           this.endpoint = "dogma/effects";
	           break;
    	}
        return this.sendRequest();    	
    }

    remote function getRaces()  returnFormat="JSON"{
       this.endpoint = "races";
       return this.sendRequest();
    }


    remote function getTournaments()  returnFormat="JSON"{
       this.endpoint = "tournaments";
       return this.sendRequest();
    }

    remote function getIndustry(string type="facilities")  returnFormat="JSON"{
    	switch(arguments.type){
	        case 'facilities': 
	           this.endpoint = "industry/facilities";
	           break;
	        case 'systems': 
	           this.endpoint = "industry/systems";
	           break;
    	}
    }

    remote function getTime()  returnFormat="JSON"{
       this.endpoint = "time";
       return this.sendRequest();
    }

    remote function getMarketTypes()  returnFormat="JSON"{
       this.endpoint = "market/types";
       return this.sendRequest();
    }

    remote function getItemTypes()  returnFormat="JSON"{
       this.endpoint = "types";
       return this.sendRequest();
    }
}