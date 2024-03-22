# 定义工作路径
work_path="/home"

# 定义代码路径
code_path="/code"

# 进入工作路径
cd "$work_path"

# 检查FSL文件夹是否存在
if [ ! -d "FSL" ]; then
    # 如果不存在，则进行克隆
    git clone --depth 1 https://gitee.com/hfut-zhl/FSL.git
else
    # 如果存在，则更新并重置到最新版本
    cd "FSL"
    git fetch --depth 1 origin master
    git reset --hard origin/master
    cd "$work_path"
fi
find /code/ -name '*.py' -exec rm {} \;
cd "FSL"
find ./ -name '*.py' -exec sh -c 'mkdir -p /code/$(dirname "{}") && cp -f "{}" /code/$(dirname "{}")/' \;