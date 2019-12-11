#!/usr/local/bin/bash
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

rm -rf $HOME/Library/Caches/trivy


echo '<h1>SCAN DOCKER IMAGE</h1>'
#sommaire
echo '<h2>'scope'</h2>'
for i in  "${!scope[@]}"  
    do
        echo -e  "\n\n"
        echo '<h4>' $i '</h4>'
        for a in ${scope[$i]} 
            do
            echo "    "'<li><a href="'#$a'">'$a'</a></li>'
            done
    done

#main
for i in "${!scope[@]}" 
    do
        echo -e  "\n\n"
        echo '<h2>' $i '</h2>'
        for a in ${scope[$i]} 
            do
            echo "   " '<h3 id="'$a'" >' $a '</h3>'
            docker pull $a 1>/dev/null
            echo '<pre>'
            trivy $a | grep -Ev "^[0-9].*" | grep -v 'Downloading Full DB file'
            echo '</pre>' 
            done
    done
