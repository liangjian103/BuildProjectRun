#!/bin/bash
######################################################################
# 服务启动脚本模板
# by James
# 2013-10-08
######################################################################

CUR_DIR=`pwd`
CLASSPATH="$CLASSPATH:$CUR_DIR:."
JAVA_HOME="/opt/web_app/jdk"
JAVA_OPS="-server -Xmx3048m -Xms1024m "

APP_PACKAGE_NAME="com.ctfo.hsp.HSPMain"

export "zh_CN.UTF-8"

function startServer() {
	for _jar in ./*.jar; do
		CLASSPATH="$CLASSPATH:${_jar}"
	done

	mkdir -p /logs/supp_app/BuildProjectRun
	$JAVA_HOME/bin/java $JAVA_OPS -cp $CLASSPATH $APP_PACKAGE_NAME >> /logs/supp_app/BuildProjectRun/console.log 2>&1 &
	echo "server start  successful   ^_^"
}

function usage() {
	echo "Usage: $0 [start]    @_@"
	exit 1
}

if [  $# -ne 1  ]; then
	usage
fi

case $1 in
	start) startServer;;
	*) usage;;
esac

