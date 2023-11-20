@echo off
rem /**
rem  * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
rem  * No deletion without permission, or be held responsible to law.
rem  *
rem  * Author: ThinkGem@163.com
rem  */
echo.
echo [信息] 打包Web工程，编译Docker镜像
echo.

%~d0
cd %~dp0

cd ..
call mvn clean package docker:remove docker:build -Dmaven.test.skip=true -U

echo.
echo.
echo 参考下面的脚本，拷贝到 Docker 服务器上运行：
echo.
echo "docker run --name jeesite-web -p 8980:8980 -d --restart unless-stopped -v ~:/data thinkgem/jeesite-web && docker logs -f jeesite-web"
echo.
echo 启动完成后，访问项目：http://127.0.0.1:8980/js/a/login   用户名：system   密码：admin
echo.

cd bin
pause