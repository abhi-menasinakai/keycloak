KEYCLOAK server configuration using DOCKER COMPOSE
=======
1. Docker compose file
   
    Docker-compose file explains the configurations for keycloak server along with it’s dependencies.
  In this case we have used keycloak 24.0 version for our use case. 
  This docker-compose file exposes ports 8080:8080 , 8443:8443 on container as well as on host.
  Mount the folders in keycloak container by mentioning them in docker-compose file.
  Since we have dependency on mysql server for keycloak so in compose file we have mentioned keycloak server dependency.


2. Keycloak configuration file
   
    In my case I am using keycloak.conf file as default config file for keycloak. 
  In order to make things easier I have mounted keycloak.conf file inside keycloak container. So that config file modifications will become smooth.


3. Providers
   
    This particular folder used to add custom plugins/extensions in the keycloak server.
  In my case I have used one of the custom plugin which is available in the github.
  (For more details https://github.com/sventorben/keycloak-restrict-client-auth). For easy maintainance I have mounted it as a folder.
  Go throgh the docker compose file for better understanding.


4. Custom script
   
    I have used shell script and  use it as a entryscript for keycloak container. So that whenever keycloak container kills and starts again, It will fetch the scripts from the        mouneted file and runs all of them during startup. Which helps keycloak server to fetch the changes done in the mounted directories. As I mentioned earlier mounting the files      like this will make configurational changes much easier. 

5. nginx configuration

   To host keycloak server I have used nginx server with self signed certificates. I have also used cipher suits to imporve security. Go throgh the nginx server config file for better understanding. Keycloak server will receive traffic from nginx using the reverse proxy mode.

6. Mysql server:

   I have used mysql server for database management. In case you want to migrate existing keycloak database. You may find errors due change in the migration policies. So please be careful on that one. Else you migrate the database tables one by one manually. In my case I have used default keycloak database itself and Imported all user and realm specific data manually.

   I hope this works for you guys....! Thanks a ton for your valuable time, Cheers!!




 




