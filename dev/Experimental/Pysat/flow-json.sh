#!/bin/bash

NM=comp
PORT=8090
INPUTVOL=equalizerInputVol
OUTPUTVOL=equalizerOutputVol
ROUTE=""
SHOWGLOBALROUTES=""
SMALL=""
SCRIPT=""
STARTVIEWER="NO"
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -n|--block)
    NM="$2"
    shift
    shift
    ;;
    -s|--script)
    SCRIPT="$2"
    shift
    shift
    ;;
    -p|--port)
    PORT="$2"
    shift
    shift
    ;;
    -iv|--inputvolume)
    INPUTVOL="$2"
    shift
    shift
    ;;
    -ov|--outputvolume)
    OUTPUTVOL="$2"
    shift
    shift
    ;;
    -sgr|--show_global_routes)
    SHOWGLOBALROUTES=" --show_global_routes"
    shift
    ;;
    -sar|--skipactualrouting)
    ROUTE=" -sar"
    shift
    ;;
    -sv|--startviewer)
    STARTVIEWER="YES"
    shift
    ;;
    --small)
    SMALL=" --small"
    shift
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
echo "SCRIPT=${SCRIPT}"
echo "INPUTVOL=${INPUTVOL}"
echo "OUTPUTVOL=${OUTPUTVOL}"
echo "BLOCK=${BLOCK}"

if [ -f "INPUT/${NM}_global_router_out.json" ]; then
    (cd INPUT && tar cvf - ${NM}_global_router_out.json) | docker run --rm --mount source=${INPUTVOL},target=/INPUT -i ubuntu /bin/bash -c "cd /INPUT && tar xvf -"
    if [ $? -ne 0 ]; then
	echo "ERROR: Failed to store global router INPUT"
	exit $?
    fi
fi	

if [ -f "INPUT/${NM}_placer_out_scaled.json" ]; then
    (cd INPUT && tar cvf - ${NM}_placer_out_scaled.json) | docker run --rm --mount source=${INPUTVOL},target=/INPUT -i ubuntu /bin/bash -c "cd /INPUT && tar xvf -"
    if [ $? -ne 0 ]; then
	echo "ERROR: Failed to store ${NM}_placer_out_scaled.json in INPUT"
	exit $?
    fi
fi	

if [ "${SCRIPT}" != "" ]; then
  echo "Running python script ${SCRIPT} in container satplacer with volume ${INPUTVOL} mounted at /scripts/INPUT"

  (tar cvf - *.py) | docker run --rm --mount source=${INPUTVOL},target=/INPUT -i ubuntu /bin/bash -c "cd /INPUT && tar xvf -"
  if [ $? -ne 0 ]; then
      echo "ERROR: Failed to store placer script INPUT"
      exit $?
  fi
  docker run --rm --mount source=${INPUTVOL},target=/scripts/INPUT satplacer_image bash -c "source /general/bin/activate && cd /scripts && python INPUT/${SCRIPT} && ls -ltr INPUT"
  if [ $? -ne 0 ]; then
      echo "ERROR: Failed to run satplacer"
      exit $?
  fi
fi

cd ../Cktgen

# -sar -sgr -smt 
STARTVIEWER=${STARTVIEWER} ./flow.sh ${SMALL}${SHOWGLOBALROUTES}${ROUTE} -p ${PORT} -iv ${INPUTVOL} -ov ${OUTPUTVOL} -s "-m cktgen.cktgen_from_json" -src ${NM} -td ../DetailedRouter/DR_COLLATERAL_Generator/strawman1_ota --placer_json INPUT/${NM}_placer_out_scaled.json
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to run core routing flow"
    exit $?
fi

# DAK: the viewer is startable by flow.sh
#if [ ${STARTVIEWER} = "YES" ]; then
#    echo "trying to start viewer"
#    docker run --mount source=${INPUTVOL},target=/public/INPUT --rm -d -p ${PORT}:8000 viewer_image bash -c "source /sympy/bin/activate && cd /public && python -m http.server"
#fi
