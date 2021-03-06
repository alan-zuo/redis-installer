#
# Redis的安装脚本
#

# 参数说明
# $1 要安装的目录，必选
# $2 Redis端口号，必选

if [ $# != 2 ]; then
    echo "ERROR: Param error"
    echo "Usage: $0 PREFIX [PORT]"
    exit
fi

prefix=$1
port=$2

if [ ! -f "redis-3.2.8.tar.gz" ]; then
    wget http://download.redis.io/releases/redis-3.2.8.tar.gz
fi
tar -zxvf redis-3.2.8.tar.gz
cd redis-3.2.8
make
make PREFIX=$prefix install
cd ..
cp redis.conf $prefix/redis.conf.template
cp start.sh stop.sh restart.sh $prefix

cd $prefix

mkdir data

sed "s:__WORK_DIR__:$prefix:g" redis.conf.template |
sed "s:__PORT__:$port:g" > redis.conf

rm -rf redis.conf.template

echo "安装完成"
