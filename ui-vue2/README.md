# 🎨 鸣沙管理平台 - 前端项目

**基于 Vue 2 + Element UI 的现代化前端管理系统**

## 📋 项目简介

鸣沙管理平台是一个基于 Vue.js 和 Element UI 构建的现代化前端管理系统，提供完整的后台管理解决方案。项目采用模块化设计，支持权限管理、用户管理、系统监控等核心功能。

## ✨ 功能特性

### 🔐 权限管理
- 基于角色的访问控制 (RBAC)
- 动态路由权限控制
- 菜单权限管理
- 按钮级权限控制

### 👥 用户管理
- 用户信息管理
- 角色分配
- 部门管理
- 用户状态控制

### 📊 系统监控
- 在线用户监控
- 系统日志查看
- 操作日志记录
- 服务器状态监控

### 🛠️ 系统工具
- 代码生成器
- 数据字典管理
- 系统配置管理
- 定时任务管理

### 🎨 界面特性
- 响应式设计，支持多端适配
- 主题切换功能
- 国际化支持
- 面包屑导航
- 标签页管理

## 🛠️ 技术栈

### 核心框架
- **Vue.js 2.x**: 渐进式 JavaScript 框架
- **Element UI**: 基于 Vue 2.0 的桌面端组件库
- **Vue Router**: Vue.js 官方路由管理器
- **Vuex**: Vue.js 的状态管理模式

### 构建工具
- **Webpack**: 模块打包工具
- **Babel**: JavaScript 编译器
- **ESLint**: 代码质量检查工具
- **Prettier**: 代码格式化工具

### 开发工具
- **Axios**: HTTP 客户端
- **ECharts**: 数据可视化图表库
- **js-cookie**: Cookie 操作库
- **nprogress**: 进度条组件

## 🚀 快速开始

### 环境要求

- **Node.js**: 16+
- **npm**: 8+
- **Git**: 2.0+

### 开发环境

```bash
# 进入项目目录
cd ui

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npmmirror.com

# 启动开发服务器
npm run dev
```

浏览器访问 http://localhost:8080

### 构建发布

```bash
# 构建开发环境
npm run build:dev

# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```

## 📦 项目结构

```
ui/
├── src/                    # 源代码
│   ├── api/               # API 接口
│   │   ├── login.js       # 登录相关接口
│   │   ├── menu.js        # 菜单相关接口
│   │   ├── monitor/       # 监控相关接口
│   │   ├── system/        # 系统管理接口
│   │   └── tool/          # 工具相关接口
│   ├── assets/            # 静态资源
│   │   ├── icons/         # 图标资源
│   │   ├── images/        # 图片资源
│   │   └── styles/        # 样式文件
│   ├── components/        # 公共组件
│   │   ├── Breadcrumb/    # 面包屑组件
│   │   ├── DictData/      # 字典数据组件
│   │   ├── FileUpload/    # 文件上传组件
│   │   ├── Pagination/    # 分页组件
│   │   └── SvgIcon/       # SVG 图标组件
│   ├── directive/         # 自定义指令
│   │   ├── dialog/        # 对话框指令
│   │   ├── module/        # 模块指令
│   │   └── permission/    # 权限指令
│   ├── layout/            # 布局组件
│   │   ├── components/    # 布局子组件
│   │   └── mixin/         # 布局混入
│   ├── plugins/           # 插件
│   │   ├── auth.js        # 认证插件
│   │   ├── cache.js       # 缓存插件
│   │   └── download.js    # 下载插件
│   ├── router/            # 路由配置
│   │   └── index.js       # 路由主文件
│   ├── store/             # Vuex 状态管理
│   │   ├── modules/       # 状态模块
│   │   ├── getters.js     # 全局 getters
│   │   └── index.js       # store 入口
│   ├── utils/             # 工具函数
│   │   ├── auth.js        # 认证工具
│   │   ├── dict/          # 字典工具
│   │   ├── generator/     # 代码生成工具
│   │   └── index.js       # 工具入口
│   └── views/             # 页面组件
│       ├── dashboard/     # 仪表板页面
│       ├── error/         # 错误页面
│       ├── login.vue      # 登录页面
│       ├── monitor/       # 监控页面
│       ├── system/        # 系统管理页面
│       └── tool/          # 工具页面
├── public/                # 静态资源
├── build/                 # 构建配置
├── deploy/                # 部署配置
└── package.json           # 依赖配置
```

## 🔧 开发指南

### 代码规范

- 遵循 Vue.js 官方风格指南
- 使用 ESLint 进行代码检查
- 使用 Prettier 进行代码格式化
- 组件命名采用 PascalCase
- 文件名采用 kebab-case

### 组件开发规范

```vue
<template>
  <!-- 模板内容 -->
</template>

<script>
export default {
  name: 'ComponentName',
  props: {
    // 属性定义
  },
  data() {
    return {
      // 数据定义
    }
  },
  computed: {
    // 计算属性
  },
  methods: {
    // 方法定义
  }
}
</script>

<style lang="scss" scoped>
/* 样式定义 */
</style>
```

### API 接口规范

```javascript
// 接口定义示例
import request from '@/utils/request'

// 获取用户列表
export function listUser(query) {
  return request({
    url: '/system/user/list',
    method: 'get',
    params: query
  })
}

// 新增用户
export function addUser(data) {
  return request({
    url: '/system/user',
    method: 'post',
    data: data
  })
}
```

### 路由配置规范

```javascript
// 路由配置示例
{
  path: '/system/user',
  component: Layout,
  redirect: '/system/user/index',
  name: 'User',
  meta: {
    title: '用户管理',
    icon: 'user',
    roles: ['admin']
  },
  children: [
    {
      path: 'index',
      component: () => import('@/views/system/user/index'),
      name: 'UserList',
      meta: { title: '用户列表', icon: 'list' }
    }
  ]
}
```

## 🐳 Docker 部署

### 构建镜像

```bash
# 构建开发环境镜像
docker build -f deploy/docker/Dockerfile-ui-dev -t mingsha-vue2-ui:dev .

# 构建生产环境镜像
docker build -f deploy/docker/Dockerfile-ui-prod -t mingsha-vue2-ui:prod .
```

### 运行容器

```bash
# 运行开发环境容器
docker run -d -p 8080:80 mingsha-vue2-ui:dev

# 运行生产环境容器
docker run -d -p 80:80 mingsha-vue2-ui:prod
```

### Docker Compose

```yaml
version: '3.8'
services:
  mingsha-vue2-ui:
    image: mingsha-vue2-ui:latest
    ports:
      - "80:80"
    environment:
      - NODE_ENV=production
    restart: unless-stopped
```

## 📊 构建分析

项目使用 Jenkins 进行自动化构建和部署：

- **Jenkinsfile**: 标准构建流程
- **Jenkinsfile.sonar**: 代码质量分析

### 构建参数

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `BUILD_ENV` | 构建环境 | `dev` |
| `SKIP_TESTS` | 跳过测试 | `false` |
| `DOCKER_BUILD` | 构建Docker镜像 | `false` |
| `DEPLOY` | 自动部署 | `false` |

### 环境配置

项目支持多环境配置：

- **开发环境**: `npm run dev`
- **测试环境**: `npm run build:stage`
- **生产环境**: `npm run build:prod`

### 性能优化

- 路由懒加载
- 组件按需加载
- 图片压缩优化
- Gzip 压缩
- CDN 加速

## 🔍 常见问题

### 1. 依赖安装失败

```bash
# 清除 npm 缓存
npm cache clean --force

# 删除 node_modules 和 package-lock.json
rm -rf node_modules package-lock.json

# 重新安装依赖
npm install
```

### 2. 开发服务器启动失败

检查端口是否被占用：
```bash
# 查看端口占用
lsof -i :8080

# 杀死占用进程
kill -9 <PID>
```

### 3. 构建失败

检查 Node.js 版本是否符合要求：
```bash
node --version
```

### 4. 权限问题

确保用户具有相应目录的读写权限：
```bash
sudo chown -R $USER:$USER ui/
```
