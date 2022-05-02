#!/bin/sh
echo "Setting Cloud One Application Security"
export CATALINA_OPTS="-javaagent:/usr/local/tomcat/trend_app_protect-4.4.6.jar -Dcom.trend.app_protect.config.file=/usr/local/tomcat/trend_app_protect.properties"
