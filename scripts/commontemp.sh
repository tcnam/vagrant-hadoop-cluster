#!/bin/bash
tr -d '\r' < "/vagrant/scripts/commontemp.sh" > "/vagrant/scripts/common.sh"
#java
JAVA_ARCHIVE=jdk-8u45-linux-x64.tar.gz
#hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-3.2.4
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=https://dlcdn.apache.org/hadoop/common/hadoop-3.2.4/hadoop-3.2.4.tar.gz
HADOOP_RES_DIR=/vagrant/resources/hadoop
#spark
SPARK_VERSION=spark-3.2.4 #Change this for new version
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop3.2.tgz #Change this for new version
SPARK_DIR=$SPARK_VERSION-bin-hadoop3.2 #Change this for new version
SPARK_MIRROR_DOWNLOAD=https://dlcdn.apache.org/spark/spark-3.2.4/spark-3.2.4-bin-hadoop3.2.tgz
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

#Pig
PIG_VERSION=pig-0.16.0
PIG_ARCHIVE=$PIG_VERSION.tar.gz
PIG_MIRROR_DOWNLOAD=https://dlcdn.apache.org/pig/pig-0.16.0/pig-0.16.0.tar.gz
PIG_RES_DIR=/vagrant/resources/pig
PIG_CONF_DIR=/usr/local/pig/conf

#HIVE
HIVE_VERSION=apache-hive-3.1.2-bin
HIVE_ARCHIVE=$HIVE_VERSION.tar.gz
HIVE_MIRROR_DOWNLOAD=https://dlcdn.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_CONF_DIR=/usr/local/hive/conf

#ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

#echo "common loaded"
