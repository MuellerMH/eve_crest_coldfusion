# eve_crest_coldfusion
Api to Call the EVE CRest Api in ColdFusion

# example
- index.cfm -
```
<cfset eveAuth = new zone.crank.lib.eve.crest.Auth(redirectUrl="https://mysite.com/auth.cfm") />
<a href="#eveAuth.redirect()#">Login</a>
```
- auth.cfm -
```
<cfset eveAuth = new zone.crank.lib.eve.crest.Auth(redirectUrl="https://mysite.com/auth.cfm") />
<cfset eveAuth.getToken(#URL.code) />
<cfset user = eveAuth.getUser() />
<cfset SESSION.token = eveAuth.getToken() />
<cfdump var="#user" />
```
- some page -
```
<cfset eveAuth = new zone.crank.lib.eve.crest.Public(SESSION.token) />
<cfset alliances = eveAuth.getAlliances() />
<cfdump var="#alliances" />
```