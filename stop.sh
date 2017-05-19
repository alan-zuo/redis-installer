#
# Redis的停止脚本
#

work_dir=`pwd`

# 停止Cuttle
kill `cat $work_dir/redis.pid`
if [ $? == 0 ]; then
    echo "Redis 停止成功"
else
    echo "ERROR: Redis 停止失败"
fi
