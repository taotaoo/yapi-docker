**Yapi** 由 YMFE 开源，旨在为开发、产品、测试人员提供更优雅的接口管理服务，可以帮助开发者轻松创建、发布、维护 API。

- **权限管理**
   YApi 成熟的团队管理扁平化项目权限配置满足各类企业的需求
- **可视化接口管理**
   基于 websocket 的多人协作接口编辑功能和类 postman 测试工具，让多人协作成倍提升开发效率
- **Mock Server**
   易用的 Mock Server，再也不用担心 mock 数据的生成了
- **自动化测试**
   完善的接口自动化测试,保证数据的正确性
- **数据导入**
   支持导入 swagger, postman, har 数据格式，方便迁移旧项目
- **插件机制**
   强大的插件机制，满足各类业务需求



### 使用 Docker 构建 Yapi

**1、创建yapi本地镜像**

```shell
./build 1.5.0
```

版本号1.5.0是yapi的版本号，具体参考https://github.com/ymfe/yapi

**2、启动 MongoDB**

```shell
docker run -d --name mongo-yapi -v /opt/yapi/mongo:/data/db mongo
```

**3、初始化 Yapi 数据库索引及管理员账号**

```shell
docker run -it --rm   --link mongo-yapi:mongo   --workdir /api/vendors   xvwentao89/yapi:1.5.0   npm run install-server
```

> 自定义配置文件挂载到目录 `/api/config.json`，官方自定义配置文件 -> [传送门](https://github.com/YMFE/yapi/blob/master/config_example.json)

**4、启动 Yapi 服务**

```shell
docker run -d \
  -v /opt/yapi/yapi/:/api/vendors/ \
  --name yapi \
  --link mongo-yapi:mongo \
  --workdir /api/vendors \
  -p 3000:3000 \
  xvwentao89/yapi:1.5.0 \
  "node server/app.js"
```

登录账号 **admin@admin.com**，密码 **ymfe.org**

### 参考

https://github.com/ymfe/yapi

https://www.jianshu.com/p/a97d2efb23c5

