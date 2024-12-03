git clone https://github.com/mell-o-tron/MellOs
cp ./A_Setup/setup-gcc-debian.sh ./
docker build -t build_env_for_i386 .
rm -rf MellOs ./setup-gcc-debian.sh
