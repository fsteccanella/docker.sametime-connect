# docker.sametime-connect

Usage
-------

    docker run -it --rm \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ~/ibm/Sametime:/home/sametime/ibm/Sametime \
	-v ~/Documents/SametimeTranscripts:/home/sametime/Documents/SametimeTranscripts \
	-e DISPLAY=$DISPLAY  \
	--net host \
	--name sametime \
	sametime:latest
