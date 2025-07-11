# 代码生成模板优化说明

## 优化内容

### 1. 包路径调整
- **Model类**: `site.mingsha.dal.{moduleName}.model` - 数据模型层
- **DAO接口**: `site.mingsha.dal.{moduleName}.dao` - 数据访问层
- **Service接口**: `site.mingsha.biz.service` - 业务服务层
- **Service实现**: `site.mingsha.biz.service.impl` - 业务服务实现层
- **Controller**: `site.mingsha.web.controller.{moduleName}` - Web控制层

### 2. 文件路径调整
- **Model文件**: `app/dal/src/main/java/site/mingsha/dal/{moduleName}/model/`
- **DAO文件**: `app/dal/src/main/java/site/mingsha/dal/{moduleName}/dao/`
- **Service文件**: `app/biz/src/main/java/site/mingsha/biz/service/`
- **Controller文件**: `app/web/src/main/java/site/mingsha/web/controller/{moduleName}/`
- **Mapper文件**: `app/dal/src/main/resources/mapper/{moduleName}/`
- **前端文件**: `ui/src/`

### 3. 配置修改
- 修改 `generator.yml` 中的 `packageName` 为 `site.mingsha`
- 更新 `VelocityUtils.java` 中的文件路径生成逻辑

## 使用说明

1. 在代码生成器中配置表信息时，确保：
   - **包路径**: `site.mingsha`
   - **模块名**: 根据业务模块填写（如：system、monitor、tool等）
   - **业务名**: 具体的业务名称

2. 生成的代码将按照模块化结构自动放置到正确的目录中

3. 生成的代码包含完整的CRUD功能，包括：
   - 数据模型（DO类）
   - 数据访问层（DAO接口和XML）
   - 业务服务层（Service接口和实现）
   - Web控制层（Controller）
   - 前端页面和API

## 注意事项

- 确保数据库表结构符合项目规范
- 生成的代码需要根据具体业务需求进行调整
- 前端模板基于Vue 2 + Element UI，如需升级到Vue 3需要相应调整
- XML模板中的namespace和resultMap类型已更新为模块化路径
- SQL模板生成标准的菜单数据，无需修改 