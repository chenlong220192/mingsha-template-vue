#! /bin/bash

#======================================================================
# shell脚本
# 通过项目名称查找到PID
# 然后kill -9 pid
#
# author: chenlong
# date: 2024-04-27
#======================================================================

# 项目名称
APPLICATION=mingsha-template-vue
# 项目启动jar包名称
APPLICATION_JAR=mingsha-template-vue-boot-v1.0.0.jar

PID=$(ps -eo user,pid,tty,args | grep "${APPLICATION_JAR}" | grep -v grep | awk '{ print $2 }')
if [[ -z "$PID" ]]
then
    echo ${APPLICATION} is already stopped
else
    echo "kill -9 ${PID}"
    kill ${PID}
    if [[ $? -eq 0 ]]
  	then
    	echo "${APPLICATION} stopped successfully"
  	else
    	echo "${APPLICATION} stopped Failure"
    	exit 1
  	fi
fi
