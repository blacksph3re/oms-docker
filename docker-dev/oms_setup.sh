#!/bin/bash
# FROM: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

echo "USAGE: [sudo] bash ./oms_setup.sh [-c=? | -t=? | --push]";

# Default settings
CONTAINER=stable
PUSH=NO
TAG=dev

for i in "$@"
do
case $i in
    -c=*|--container=*)
    CONTAINER="${i#*=}"
    shift # past argument=value
    ;;
    --push)
    PUSH=YES
    shift # past argument=value
    ;;
    -t=*|--tag=*)
    TAG="${i#*=}"
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac

done
echo "CONTAINER     (-c=?)      = ${CONTAINER}"
echo "PUSH          (--push)    = ${PUSH}"
echo "TAG           (-t=?)      = ${TAG}"

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "mongoui" ]; then
    echo -e "###\n###### Building container: mongoui \n###"
    docker build -t mongoui -f ./mongoui/Dockerfile.$TAG ./mongoui
    docker tag mongoui aegee/mongoui:$TAG
    if [ "$PUSH" == "YES"]; then
        echo -e "###\n###### Pushing container: mongoui \n###"
        docker push aegee/mongoui:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "omsapplications" ]; then
    echo -e "###\n###### Building container: omsapplications \n###"
    docker build -t omsapplications -f ./omsapplications/Dockerfile.$TAG ./omsapplications
    docker tag omsapplications aegee/omsapplications:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omsapplications \n###"
        docker push aegee/omsapplications:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "omsapplications-frontend" ]; then
    echo -e "###\n###### Building container: omsapplications-frontend \n###"
    docker build -t omsapplications-frontend -f ./omsapplications-frontend/Dockerfile.$TAG ./omsapplications-frontend
    docker tag omsapplications-frontend aegee/omsapplications-frontend:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omsapplications-frontend \n###"
        docker push aegee/omsapplications-frontend:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "stable" ] || [ "$CONTAINER" == "omscore" ]; then
    echo -e "###\n###### Building container: omscore ----"
    docker build -t omscore -f ./omscore/Dockerfile.$TAG ./omscore
    docker tag omscore aegee/omscore:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omscore \n###"
        docker push aegee/omscore:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "stable" ] || [ "$CONTAINER" == "omscore-nginx" ]; then
    echo -e "###\n###### Building container: omscore-nginx \n###"
    docker build -t omscore-nginx -f ./omscore-nginx/Dockerfile.$TAG ./omscore-nginx
    docker tag omscore-nginx aegee/omscore-nginx:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omscore-nginx \n###"
        docker push aegee/omscore-nginx:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "omsevents" ]; then
    echo -e "###\n###### Building container: omsevents \n###"
    docker build -t omsevents -f ./omsevents/Dockerfile.$TAG ./omsevents
    docker tag omsevents aegee/omsevents:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omsevents \n###"
        docker push aegee/omsevents:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "omsevents-frontend" ]; then
    echo -e "###\n###### Building container: omsevents-frontend \n###"
    docker build -t omsevents-frontend -f ./omsevents-frontend/Dockerfile.$TAG ./omsevents-frontend
    docker tag omsevents-frontend aegee/omsevents-frontend:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omsevents-frontend \n###"
        docker push aegee/omsevents-frontend:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "omsserviceregistry" ]; then
    echo -e "###\n###### Building container: omsserviceregistry \n###"
    docker build -t omsserviceregistry -f ./omsserviceregistry/Dockerfile.$TAG ./omsserviceregistry
    docker tag omsserviceregistry aegee/omsserviceregistry:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: omsserviceregistry \n###"
        docker push aegee/omsserviceregistry:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "stable" ] || [ "$CONTAINER" == "php-fpm" ]; then
    echo -e "###\n###### Building container: php-fpm \n###"
    docker build -t php-fpm -f ./php-fpm/Dockerfile.$TAG ./php-fpm
    docker tag php-fpm aegee/php-fpm:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: php-fpm \n###"
        docker push aegee/php-fpm:$TAG
    fi
fi

if [ "$CONTAINER" == "all" ] || [ "$CONTAINER" == "stable" ] || [ "$CONTAINER" == "traefik" ]; then
    echo -e "###\n###### Building container: traefik \n###"
    docker build -t traefik -f ./traefik/Dockerfile.$TAG ./traefik
    docker tag traefik aegee/traefik:$TAG
    if [ "$PUSH" == "YES" ]; then
        echo -e "###\n###### Pushing container: traefik \n###"
        docker push aegee/traefik:$TAG
    fi
fi
