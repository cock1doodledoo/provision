#!/usr/bin/env bash

LOGDIR=${HOME}/log
LOGFILE=${LOGDIR}/`date '+%Y%m%d_%H%M%S'`.log
if [ ! -d ${LOGDIR} ]; then
  mkdir ${LOGDIR}
fi
script -a -q -f ${LOGFILE}
exit
