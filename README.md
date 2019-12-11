# trivy-output-html
Get simple output trivy ( tool for scan docker images)  in html from docker image list

# prerequisites
trivy
docker pull

# get-start
Put your image names in header of script file
```
declare -A scope=( 

["myGroup"]="
docker.elastic.co/elasticsearch/elasticsearch:7.4.0 
docker.elastic.co/kibana/kibana:7.4.0"

["myOtherGroup"]="
redis:4-alpine"  


["myOtherOtherGroup"]="
docker.elastic.co/apm/apm-server:7.1.0 
mongo:4.0 "
)
```
start script
```
chmod +x trivy-html.sh
./trivy-html.sh > output.html
```
and open output.html

example here :
http://htmlpreview.github.io/?https://github.com/thomas10-10/trivy-output-html/blob/master/myexample.html
