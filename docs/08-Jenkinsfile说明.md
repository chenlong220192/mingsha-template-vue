# 🔧 Jenkinsfile 说明文档

## 📋 概述

本项目包含四个Jenkinsfile文件，分别用于不同的CI/CD场景：

- **根目录 Jenkinsfile**: 后端项目构建和打包
- **根目录 Jenkinsfile.sonar**: 后端项目代码质量分析
- **ui/Jenkinsfile**: 前端项目构建和部署
- **ui/Jenkinsfile.sonar**: 前端代码质量分析

## 🚀 根目录 Jenkinsfile

### 📖 功能说明

根目录的Jenkinsfile用于后端项目的自动化构建，主要功能包括：

- **参数化构建**: 支持不同环境和测试选项
- **脚本配置更新**: 自动更新部署脚本中的应用信息
- **Maven构建**: 使用Maven进行项目编译和打包
- **包解压**: 自动解压构建产物
- **产物归档**: 归档构建产物供后续使用
- **邮件通知**: 构建结果邮件通知

### 🔧 构建参数

| 参数名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| `BUILD_ENV` | Choice | `dev` | 构建环境 (dev/test/prod) |
| `SKIP_TESTS` | Boolean | `false` | 是否跳过测试 |

### 📋 构建阶段

#### 1. Checkout 阶段
```groovy
stage('Checkout') {
    steps {
        echo "🚀 开始构建 mingsha-template-vue 项目"
        echo "📁 工作目录: ${env.REPO_DIR}"
        echo "🏗️  构建环境: ${env.BUILD_ENV}"
        echo "🧪 跳过测试: ${env.SKIP_TESTS}"
    }
}
```

**功能**: 显示构建信息和参数

#### 2. Update Scripts 阶段
```groovy
stage('Update Scripts') {
    steps {
        script {
            // 读取应用配置
            def appName = sh(
                script: "grep 'app.name' config/app.properties | cut -d'=' -f2 | sed 's/ //'",
                returnStdout: true
            ).trim()
            
            // 更新部署脚本
            sh """
                sed -i 's/APPLICATION=[^<]*/APPLICATION=${appName}/1' deploy/deploy/debugger.sh
                sed -i 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${appJar}/1' deploy/deploy/debugger.sh
            """
        }
    }
}
```

**功能**: 
- 读取 `config/app.properties` 中的应用配置
- 自动更新部署脚本中的应用名称和JAR文件名
- 确保部署脚本与实际应用配置一致

#### 3. Build 阶段
```groovy
stage('Build') {
    steps {
        script {
            sh """
                ./mvnw --batch-mode --errors --fail-at-end --update-snapshots \
                    clean package \
                    -P ${env.BUILD_ENV} \
                    -D maven.test.skip=${env.SKIP_TESTS}
            """
        }
    }
}
```

**功能**:
- 使用Maven进行项目构建
- 支持环境配置 (`-P` 参数)
- 支持跳过测试选项
- 使用Maven Wrapper确保版本一致性

#### 4. Extract Package 阶段
```groovy
stage('Extract Package') {
    steps {
        script {
            sh "mkdir -p target/app"
            sh "tar -zxvf target/*.tar.gz -C target/app --strip-components 1"
        }
    }
}
```

**功能**:
- 创建解压目录
- 解压tar.gz构建包
- 参考Makefile中的 `package.uncompress` 命令逻辑

#### 5. Archive Artifacts 阶段
```groovy
stage('Archive Artifacts') {
    steps {
        script {
            archiveArtifacts artifacts: 'target/*.tar.gz', fingerprint: true
        }
    }
}
```

**功能**:
- 归档根目录下的tar.gz文件
- 添加指纹识别功能
- 不包含子目录中的jar/war文件

### 📧 邮件通知

构建完成后会发送邮件通知，包含以下信息：

- 项目名称和构建编号
- 构建状态（成功/失败/中止）
- Git分支和提交信息
- 构建详情链接

### 🔧 环境配置

#### 必需的环境变量
```groovy
environment {
    MAVEN_OPTS = '-Dmaven.test.failure.ignore=false'
    REPO_DIR = "${env.WORKSPACE}"
    EMAIL_RECIPIENTS = 'dev-team@example.com'
    NUM_TO_KEEP = 1
}
```

#### Jenkins工具配置
- **JDK**: 需要配置名为 `jdk17` 的JDK工具
- **Agent**: 需要Linux标签的构建节点

## 🔍 根目录 Jenkinsfile.sonar

### 📖 功能说明

根目录的Jenkinsfile.sonar用于后端项目的代码质量分析，主要功能包括：

- **SonarQube扫描**: 使用Maven SonarQube插件进行代码质量分析
- **质量门禁**: 代码质量门禁检查
- **邮件通知**: 分析结果邮件通知
- **工作空间清理**: 自动清理构建工作空间

### 🔧 构建参数

| 参数名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| `ANALYSIS_TYPE` | Choice | `full` | 分析类型 (full/incremental) |
| `FAIL_ON_QUALITY_GATE` | Boolean | `true` | 质量门禁失败时停止构建 |

### 📋 构建阶段

#### 1. SonarQube Scan 阶段
```groovy
stage('SonarQube Scan') {
    steps {
        echo "Repository directory: ${env.REPO_DIR}"

        sh '''
            cd $REPO_DIR && ./mvnw sonar:sonar \
            -Dsonar.projectKey=$SONAR_PROJECT_KEY \
            -Dsonar.projectName=$SONAR_PROJECT_NAME \
            -Dsonar.host.url=$SONAR_HOST_URL \
            -Dsonar.login=$SONAR_TOKEN
        '''
    }
}
```

**功能**:
- 使用Maven SonarQube插件执行代码质量分析
- 配置项目密钥、名称和SonarQube服务器地址
- 使用凭据进行身份验证

### 🔧 环境配置

#### 环境变量
```groovy
environment {
    MAVEN_OPTS = '-Dmaven.test.failure.ignore=false'
    REPO_DIR = "${env.WORKSPACE}"
    SONAR_TOKEN = credentials('sonar-token')
    SONAR_PROJECT_KEY = 'mingsha-template-uve'
    SONAR_PROJECT_NAME = 'mingsha-template-uve'
    SONAR_HOST_URL = 'http://your-sonarqube-server:9000'
    EMAIL_RECIPIENTS = 'dev-team@example.com'
    EMAIL_SUBJECT = '[SonarQube扫描通知] mingsha-template-uve #${BUILD_NUMBER} - ${BUILD_STATUS}'
    EMAIL_BODY = '''
        <h3>SonarQube 扫描通知</h3>
        <ul>
            <li>项目: mingsha-template-uve</li>
            <li>构建编号: ${BUILD_NUMBER}</li>
            <li>状态: ${BUILD_STATUS}</li>
            <li>分支: ${GIT_BRANCH}</li>
            <li>提交: ${GIT_COMMIT}</li>
            <li>详情: <a href="${BUILD_URL}">${BUILD_URL}</a></li>
        </ul>
    '''
}
```

#### Jenkins凭据配置
- **sonar-token**: SonarQube访问令牌

### 📧 邮件通知

分析完成后会发送HTML格式的邮件通知，包含：

- 项目信息
- 构建编号和状态
- Git分支和提交信息
- 构建详情链接

## 🎨 ui/Jenkinsfile

### 📖 功能说明

前端项目的Jenkinsfile用于Vue.js项目的自动化构建和部署，主要功能包括：

- **Node.js环境管理**: 自动安装和配置Node.js
- **依赖管理**: 使用国内镜像安装npm依赖
- **代码质量检查**: ESLint代码检查
- **单元测试**: 执行单元测试
- **多环境构建**: 支持dev/test/prod环境
- **Docker构建**: 可选的Docker镜像构建
- **自动部署**: 可选的自动部署功能

### 🔧 构建参数

| 参数名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| `BUILD_ENV` | Choice | `dev` | 构建环境 (dev/test/prod) |
| `SKIP_TESTS` | Boolean | `false` | 跳过测试 |
| `DOCKER_BUILD` | Boolean | `false` | 构建Docker镜像 |
| `DEPLOY` | Boolean | `false` | 自动部署 |

### 📋 构建阶段

#### 1. 环境准备
```groovy
stage('环境准备') {
    steps {
        script {
            echo "🚀 开始构建前端项目 - 环境: ${BUILD_ENV}"
        }
        
        cleanWs()
        checkout scm
        
        dir('ui') {
            sh """
                curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
                export NVM_DIR="\$HOME/.nvm"
                [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
                nvm install ${NODE_VERSION}
                nvm use ${NODE_VERSION}
            """
        }
    }
}
```

**功能**:
- 清理工作空间
- 检出代码
- 安装和配置Node.js环境

#### 2. 依赖安装
```groovy
stage('依赖安装') {
    steps {
        dir('ui') {
            sh """
                export NVM_DIR="\$HOME/.nvm"
                [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
                nvm use ${NODE_VERSION}
                
                npm config set registry ${NPM_REGISTRY}
                npm install --verbose
            """
        }
    }
}
```

**功能**:
- 使用国内镜像安装npm依赖
- 显示详细的安装日志

#### 3. 代码检查
```groovy
stage('代码检查') {
    when {
        expression { params.SKIP_TESTS == 'false' }
    }
    steps {
        dir('ui') {
            sh """
                npm run lint
            """
        }
    }
}
```

**功能**:
- 执行ESLint代码检查
- 条件执行（可跳过）

#### 4. 单元测试
```groovy
stage('单元测试') {
    when {
        expression { params.SKIP_TESTS == 'false' }
    }
    steps {
        dir('ui') {
            sh """
                npm run test:unit
            """
        }
    }
}
```

**功能**:
- 执行单元测试
- 条件执行（可跳过）

#### 5. 构建项目
```groovy
stage('构建项目') {
    steps {
        dir('ui') {
            sh """
                if [ "${BUILD_ENV}" = "prod" ]; then
                    npm run build:prod
                elif [ "${BUILD_ENV}" = "test" ]; then
                    npm run build:stage
                else
                    npm run build:dev
                fi
            """
        }
    }
}
```

**功能**:
- 根据环境选择构建命令
- 生成对应的构建产物

#### 6. 构建Docker镜像
```groovy
stage('构建Docker镜像') {
    when {
        expression { params.DOCKER_BUILD == 'true' }
    }
    steps {
        dir('ui') {
            sh """
                docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
                docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:${BUILD_ENV}
            """
        }
    }
}
```

**功能**:
- 构建Docker镜像
- 打标签（构建号和环境标签）
- 条件执行

#### 7. 部署
```groovy
stage('部署') {
    when {
        expression { params.DEPLOY == 'true' }
    }
    steps {
        script {
            if (params.DOCKER_BUILD == 'true') {
                // Docker部署
                sh """
                    docker stop mingsha-template-vue-ui-${BUILD_ENV} || true
                    docker rm mingsha-template-vue-ui-${BUILD_ENV} || true
                    docker run -d \\
                        --name mingsha-template-vue-ui-${BUILD_ENV} \\
                        -p 80:80 \\
                        ${DOCKER_IMAGE}:${DOCKER_TAG}
                """
            } else {
                // 直接部署
                sh """
                    sudo mkdir -p /var/www/mingsha-template-vue-ui-${BUILD_ENV}
                    sudo cp -r ui/dist/* /var/www/mingsha-template-vue-ui-${BUILD_ENV}/
                """
            }
        }
    }
}
```

**功能**:
- 支持Docker部署和直接部署两种方式
- 自动停止和启动容器
- 条件执行

### 🔧 环境配置

#### 环境变量
```groovy
environment {
    NODE_VERSION = '16'
    NPM_REGISTRY = 'https://registry.npmmirror.com'
    BUILD_ENV = "${params.BUILD_ENV ?: 'dev'}"
    DOCKER_IMAGE = 'mingsha-template-vue-ui'
    DOCKER_TAG = "${BUILD_ENV}-${BUILD_NUMBER}"
}
```

## 🔍 ui/Jenkinsfile.sonar

### 📖 功能说明

SonarQube代码质量分析的Jenkinsfile，用于前端项目的代码质量检查，主要功能包括：

- **代码质量分析**: 使用SonarQube进行静态代码分析
- **测试覆盖率**: 收集和上报测试覆盖率
- **质量门禁**: 质量门禁检查
- **报告生成**: 生成质量报告和覆盖率报告
- **邮件通知**: 分析结果邮件通知

### 🔧 构建参数

| 参数名 | 类型 | 默认值 | 说明 |
|--------|------|--------|------|
| `ANALYSIS_TYPE` | Choice | `full` | 分析类型 (full/incremental) |
| `FAIL_ON_QUALITY_GATE` | Boolean | `true` | 质量门禁失败时停止构建 |

### 📋 构建阶段

#### 1. 环境准备
```groovy
stage('环境准备') {
    steps {
        script {
            echo "🔍 开始代码质量分析"
            echo "📊 分析类型: ${ANALYSIS_TYPE}"
        }
        
        cleanWs()
        checkout scm
        
        dir('ui') {
            sh """
                curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
                export NVM_DIR="\$HOME/.nvm"
                [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
                nvm install ${NODE_VERSION}
                nvm use ${NODE_VERSION}
            """
        }
    }
}
```

#### 2. 依赖安装
```groovy
stage('依赖安装') {
    steps {
        dir('ui') {
            sh """
                npm config set registry ${NPM_REGISTRY}
                npm install --verbose
                npm install -g sonarqube-scanner
            """
        }
    }
}
```

**功能**:
- 安装项目依赖
- 安装SonarQube Scanner

#### 3. 代码检查
```groovy
stage('代码检查') {
    steps {
        dir('ui') {
            sh """
                npm run lint
            """
        }
    }
}
```

#### 4. 单元测试
```groovy
stage('单元测试') {
    steps {
        dir('ui') {
            sh """
                npm run test:unit -- --coverage
            """
        }
    }
}
```

**功能**:
- 执行单元测试并生成覆盖率报告

#### 5. 构建项目
```groovy
stage('构建项目') {
    steps {
        dir('ui') {
            sh """
                npm run build:prod
            """
        }
    }
}
```

#### 6. SonarQube分析
```groovy
stage('SonarQube分析') {
    steps {
        dir('ui') {
            script {
                // 准备SonarQube配置文件
                writeFile file: 'sonar-project.properties', text: """
                    sonar.projectKey=${PROJECT_KEY}
                    sonar.projectName=${PROJECT_NAME}
                    sonar.projectVersion=${env.BUILD_NUMBER}
                    sonar.sources=src
                    sonar.tests=src
                    sonar.exclusions=**/node_modules/**,**/dist/**,**/coverage/**
                    sonar.javascript.lcov.reportPaths=coverage/lcov.info
                    sonar.host.url=${SONAR_HOST_URL}
                    sonar.login=${SONAR_TOKEN}
                """
                
                // 执行SonarQube分析
                sh """
                    sonar-scanner -Dsonar.projectKey=${PROJECT_KEY} \\
                        -Dsonar.sources=src \\
                        -Dsonar.tests=src \\
                        -Dsonar.javascript.lcov.reportPaths=coverage/lcov.info \\
                        -Dsonar.host.url=${SONAR_HOST_URL} \\
                        -Dsonar.login=${SONAR_TOKEN}
                """
            }
        }
    }
}
```

**功能**:
- 生成SonarQube配置文件
- 执行代码质量分析
- 上报测试覆盖率

#### 7. 质量门禁检查
```groovy
stage('质量门禁检查') {
    when {
        expression { params.FAIL_ON_QUALITY_GATE == 'true' }
    }
    steps {
        script {
            timeout(time: 5, unit: 'MINUTES') {
                script {
                    def qualityGate = waitForQualityGate()
                    if (qualityGate.status != 'OK') {
                        error "质量门禁未通过: ${qualityGate.status}"
                    }
                }
            }
        }
    }
}
```

**功能**:
- 等待SonarQube分析完成
- 检查质量门禁状态
- 失败时停止构建

#### 8. 生成报告
```groovy
stage('生成报告') {
    steps {
        script {
            // 归档测试覆盖率报告
            dir('ui') {
                archiveArtifacts artifacts: 'coverage/**/*', fingerprint: true
            }
            
            // 发布SonarQube报告
            publishHTML([
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'ui/coverage/lcov-report',
                reportFiles: 'index.html',
                reportName: '测试覆盖率报告'
            ])
        }
    }
}
```

**功能**:
- 归档覆盖率报告
- 发布HTML格式的覆盖率报告

### 🔧 环境配置

#### 环境变量
```groovy
environment {
    NODE_VERSION = '16'
    NPM_REGISTRY = 'https://registry.npmmirror.com'
    SONAR_HOST_URL = 'http://sonarqube:9000'
    SONAR_TOKEN = credentials('sonar-token')
    PROJECT_KEY = 'mingsha-ui'
    PROJECT_NAME = '鸣沙管理平台-前端'
}
```

#### Jenkins凭据配置
- **sonar-token**: SonarQube访问令牌

## 🚀 使用方法

### 1. Jenkins配置

#### 后端项目配置
1. 创建新的Pipeline项目
2. 配置Git仓库地址
3. 设置Pipeline脚本路径为 `Jenkinsfile`
4. 配置JDK工具（名称为 `jdk17`）
5. 配置邮件通知

#### 后端SonarQube配置
1. 创建新的Pipeline项目
2. 配置Git仓库地址
3. 设置Pipeline脚本路径为 `Jenkinsfile.sonar`
4. 配置SonarQube凭据（sonar-token）
5. 配置邮件通知

#### 前端项目配置
1. 创建新的Pipeline项目
2. 配置Git仓库地址
3. 设置Pipeline脚本路径为 `ui/Jenkinsfile`
4. 配置Node.js环境（如果需要）

#### 前端SonarQube项目配置
1. 创建新的Pipeline项目
2. 配置Git仓库地址
3. 设置Pipeline脚本路径为 `ui/Jenkinsfile.sonar`
4. 配置SonarQube凭据（sonar-token）

### 2. 触发构建

#### 手动触发
```bash
# 后端构建
curl -X POST "http://jenkins-url/job/backend-job/buildWithParameters?BUILD_ENV=prod&SKIP_TESTS=false"

# 后端代码质量分析
curl -X POST "http://jenkins-url/job/backend-sonar-job/buildWithParameters?ANALYSIS_TYPE=full&FAIL_ON_QUALITY_GATE=true"

# 前端构建
curl -X POST "http://jenkins-url/job/frontend-job/buildWithParameters?BUILD_ENV=prod&DOCKER_BUILD=true&DEPLOY=true"

# 前端代码质量分析
curl -X POST "http://jenkins-url/job/frontend-sonar-job/buildWithParameters?ANALYSIS_TYPE=full&FAIL_ON_QUALITY_GATE=true"
```

#### 自动触发
- 配置Git Webhook
- 设置定时构建
- 配置上游项目触发

### 3. 构建产物

#### 后端构建产物
- `target/*.tar.gz`: 应用打包文件
- 部署脚本已更新应用信息

#### 后端SonarQube分析产物
- SonarQube仪表板链接
- 代码质量报告

#### 前端构建产物
- `ui/dist/`: 构建后的静态文件
- Docker镜像（如果启用）

#### 前端SonarQube分析产物
- 代码质量报告
- 测试覆盖率报告
- SonarQube仪表板链接

## 🔧 故障排除

### 常见问题

#### 1. Maven构建失败
```bash
# 检查JDK版本
java -version

# 检查Maven配置
./mvnw --version

# 清理并重新构建
./mvnw clean package
```

#### 2. SonarQube连接问题
```bash
# 检查SonarQube服务状态
curl http://sonarqube:9000/api/system/status

# 检查凭据配置
# 在Jenkins中验证sonar-token凭据

# 检查项目配置
# 确认SONAR_PROJECT_KEY和SONAR_PROJECT_NAME正确
```

#### 3. Node.js环境问题
```bash
# 检查Node.js版本
node --version
npm --version

# 清理npm缓存
npm cache clean --force

# 重新安装依赖
rm -rf node_modules package-lock.json
npm install
```

#### 4. Docker构建问题
```bash
# 检查Docker服务状态
docker info

# 检查Dockerfile
docker build --no-cache -t test-image .

# 检查镜像
docker images | grep mingsha-template-vue-ui
```

### 日志分析

#### 构建日志位置
- Jenkins构建页面 → Console Output
- 工作空间日志文件
- 邮件通知中的日志链接

#### 关键日志信息
- 构建阶段开始和结束信息
- 错误信息和堆栈跟踪
- 构建产物信息
- 部署状态信息
- SonarQube分析结果

### 性能优化建议

#### 1. 构建优化
- 使用Maven本地仓库缓存
- 配置npm缓存
- 使用并行构建
- 优化Docker镜像层

#### 2. 资源优化
- 定期清理工作空间
- 限制构建历史保留数量
- 使用轻量级基础镜像
- 优化网络配置

#### 3. 监控优化
- 设置构建超时时间
- 配置资源使用监控
- 定期检查磁盘空间
- 监控构建队列状态

## 📊 最佳实践

### 1. 分支策略
- 使用Git Flow工作流
- 主分支保护
- 代码审查流程
- 自动化测试

### 2. 环境管理
- 环境隔离
- 配置管理
- 数据备份
- 回滚策略

### 3. 安全实践
- 凭据管理
- 访问控制
- 日志审计
- 漏洞扫描

### 4. 监控告警
- 构建状态监控
- 质量门禁监控
- 性能指标监控
- 异常告警
