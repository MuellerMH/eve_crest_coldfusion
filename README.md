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
<cfset eveAuth.getToken() />
<cfset user = eveAuth.getUser() />
<cfdump var="#user" />
```