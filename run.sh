docker build . -t mfashby/soundjack \
	--build-arg uid=$(id -u $USER) \
	--build-arg gid=$(id -g $USER) \
	--build-arg user=$USER
docker run \
	--rm -it \
	--user=$(id -u $USER):$(id -g $USER) \
	--env="DISPLAY" \
	--privileged \
	--volume="/dev/snd:/dev/snd" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--cpu-rt-runtime=950000 \
        --ulimit rtprio=99 \
	--ulimit memlock=65536:65536 \
	-p "1234:1234" \
	-p "50050:50050" \
	mfashby/soundjack ${@}
#	--device="/dev/snd:/dev/snd" \
#       --cap-add=sys_nice \
