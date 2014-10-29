@echo off

SET _TARGET_PATH=.\*.jar
SET SUBDIR=/s 
FOR /f "delims=" %%i IN ('dir "%_TARGET_PATH%" /a-d /b %SUBDIR% ') DO (
    ECHO %%i
    CALL :APPENDCP %%i
)
GOTO :ENDCP

:APPENDCP
set CLASSPATH=%1;%CLASSPATH%
GOTO :eof

:ENDCP 
ECHO %CLASSPATH%
@REM pause>nul

set CLASSPATH=%1;%CLASSPATH%;./bin;


rem set JAVA_OPTS=-server -Xss256k -Xms4g -Xmx4g -Xmn1g -XX:PermSize=128m -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true
rem set JPDA_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,address=8888,server=y,suspend=y
rem set JAVA_GC=-XX:+DisableExplicitGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/jvm.hprof -XX:+PrintClassHistogram -Xloggc:/tmp/gc.log -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintHeapAtGC

java %JAVA_OPTS% %JPDA_OPTS% -classpath %CLASSPATH% com.lj.test.Hello

:begin

ping 127.0.0.1 -n 3 -w 3000

goto begin

pause