#
# Redis的启动脚本
#

work_dir=`pwd`

$work_dir/bin/redis-server $work_dir/redis.conf
if [ $? == 0 ]; then
    echo "Redis启动成功"
else
    echo "ERROR: Redis启动失败"
fi
