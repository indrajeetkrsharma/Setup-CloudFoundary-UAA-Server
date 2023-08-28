@ECHO OFF

call uaac target http://localhost:8181/uaa

call uaac token client get admin -s adminsecret

call uaac client add webappclient -s webappclientsecret --name WebAppClient --scope resource.read,resource.write,openid,profile,email,address,phone --authorized_grant_types authorization_code,refresh_token,client_credentials,password --authorities uaa.resource --redirect_uri http://localhost:5055/**

call uaac user add appuser -p appusersecret --emails appuser@acme.com

call uaac group add resource.read

call uaac group add resource.write

call uaac member add resource.read appuser

call uaac member add resource.write appuser