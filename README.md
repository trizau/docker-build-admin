快速搭建 buildAdmin 环境, 镜像指令参考 [PHP官方镜像](https://hub.docker.com/_/php)

# 快速使用

## 使用环境

```shell
# 这是默认的配置，也可以在不同目录或者在当前目录，只需修改 .env 即可
npx degit trizau/docker-build-admin .
git clone https://github.com/build-admin/buildAdmin

```

## 安装/开发

0. `docker compose build`
1. 修改根目录下 `.env` 文件 *BA_PROJECT_PATH* 为 buildAdmin 项目文件夹名称
2. 安装依赖
    - `docker compose up ba-php-install`
3. 开启 php 开发服务
    - `docker compose up ba-php-dev`
4. 访问 **http://localhost:8000** 根据 [BA安装引导](https://doc.buildadmin.com/guide/install/webInstallGuide.html) 进行安装, 数据库地址为 **mysql**
4. 开启前端开发服务, 需要先安装前端依赖，在网页安装引导中已经自动安装, 如果尚未安装需要执行
    - `docker compose up ba-web-install`
5. 同时开启前后端服务
    - `docker compose up ba-php-dev ba-web-dev`

## 扩展

可根据项目需要重新修改 *docker/php.Dockerfile* 安装扩展或修改配置后打包镜像。修改 **.env** 中的 **BA_IMAGE** 为新的镜像地址

## 部署

- 部署到 nginx
    - `docker compose up web -d`
- 生成证书, 必须在安装完成后
    1. 修改 .env 文件中提示的配置
    2. 执行 docker compose up certbot
    3. 重新执行一次 docker compose up web -d

## 清理容器

`docker container prune`