
img_cnt=$(docker images | grep "ubuntu20.04-dev" | wc -l)
if [ $img_cnt -eq 0 ]; then
	docker build . -t ubuntu20.04-dev
else
	docker rmi ubuntu20.04-dev
	docker build . -t ubuntu20.04-dev
fi
