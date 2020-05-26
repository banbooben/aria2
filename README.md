<!--
 * @Author: shangyameng
 * @Email: shangyameng@aliyun.com
 * @Date: 2020-04-23 10:44:58
 * @LastEditTime: 2020-04-23 10:46:36
 * @FilePath: /aria2/README.md
 -->

### 使用说明
- 直接执行脚本构建镜像

    - 在build_image.sh文件目录下执行。`sh build_image.sh`，即可构建出镜像

    - 使用`docker-compose up -d`启动镜像

    - 访问

        - 访问本机ip，设置RPC授权令牌，IP，端口即可
        - 使用aria2 for chrome插件，设置RPC授权令牌，IP，端口即可

    - 默认参数

        ```shell
        
        # aria2.conf
        
        # 容器内文件的保存路径(可使用绝对路径或相对路径), ：：：：：不要修改（修改后docker-compose.yml文件中相应位置也要修改）
        dir=/data
        
        ## RPC相关设置 ##
        # RPC监听端口, 端口被占用时可以修改, 默认:6800
        rpc-listen-port=6800
        # 设置的RPC授权令牌, v1.18.4新增功能, 取代 --rpc-user 和 --rpc-passwd 选项
        rpc-secret=test
        
        
        # docker-compose.yml
        version: "3"
        services: 
            aria2:
                image: aria
                volumes: 
                    - ./data:/data
                    - ./html:/var/www/html
                restart: always
                ports: 
                    - 6800:6800
                    - 80:80
        ```

        > 更多参数查看`./aria2/aria2.conf`和`./docker-compose.yml`

- 自定义设置

    - Docker-compose.yml文件中默认映射当前路径下的data路径到容器内的aria2文件下载路径`/data`
        - 容器内aria2文件下载路径`/data`由`./aria2/aria2.conf`文件指定，修改该目录时需要同时修改Dockerfile文件中的第9行`&& mkdir /data \`，创建文件下载位置
        - 可以使用绝对路径修改文件映射本机位置
            - 修改`docker-compose.yml`文件中的`- ./data:/data` ，修改为`- /your_download_path:/data`

#### 待更新

- 整合frp穿透，配合google的`aria2 for chrome`使用

