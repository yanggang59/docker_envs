
img_cnt=$(docker images | grep "ubuntu12.04-dev" | wc -l)
if [ $img_cnt -eq 0 ]; then
	docker build . -t ubuntu12.04-dev
else
	docker rmi ubuntu12.04-dev
	docker build . -t ubuntu12.04-dev
fi
