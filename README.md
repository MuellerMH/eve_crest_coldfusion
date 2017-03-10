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
<cfset eveApi = new zone.crank.lib.eve.crest.Public(SESSION.token) />
<cfset alliances = eveApi.getAlliances() />
<cfdump var="#alliances" />
```

### Who do I talk to? ###

Slack: https://crankzone.slack.com/signup
* Other community or team contact

Get a Patron on Patreon https://www.patreon.com/deronkozockt
You can Donate on Paypal muellermh.media@gmail.com
