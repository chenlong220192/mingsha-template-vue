# Spring Boot 4.0.5 升级计划

> 文档版本：v1.0
> 创建日期：2026-04-08
> 项目：mingsha-template-vue

---

## 目录

1. [升级概述](#1-升级概述)
2. [当前依赖状态](#2-当前依赖状态)
3. [目标版本清单](#3-目标版本清单)
4. [Breaking Changes 清单](#4-breaking-changes-清单)
5. [详细升级步骤](#5-详细升级步骤)
6. [风险评估与应对](#6-风险评估与应对)
7. [回滚方案](#7-回滚方案)
8. [验证清单](#8-验证清单)

---

## 1. 升级概述

### 1.1 升级目标

| 项目 | 当前版本 | 目标版本 |
|------|----------|----------|
| Spring Boot | 3.5.11 | 4.0.5 |
| Spring Framework | 6.x | 7.x |
| Java | 17 | 17+ (已满足) |
| Jakarta EE | 10 | 11 |

### 1.2 升级原则

- **分支隔离**：所有改动在独立分支进行，不污染主分支
- **逐步验证**：每一步完成后进行编译测试
- **可回滚**：任何阶段出现问题可快速回退
- **文档记录**：记录所有修改点和问题

### 1.3 升级前置条件

- [ ] Java 17+ 已安装
- [ ] Maven 3.9+ 已安装
- [ ] 当前代码可正常编译
- [ ] 测试用例可通过
- [ ] 备份已完成

---

## 2. 当前依赖状态

### 2.1 根 pom.xml 版本定义

```xml
<spring-boot.version>3.5.11</spring-boot.version>
<mybatis-spring-boot.version>3.0.4</mybatis-spring-boot.version>
<mysql.version>9.2.0</mysql.version>
<druid.version>1.2.24</druid.version>
<pagehelper.boot.version>2.1.0</pagehelper.boot.version>
<fastjson.version>2.0.54</fastjson.version>
<jjwt.version>0.12.6</jjwt.version>
<springdoc.version>2.8.4</springdoc.version>
<jasypt.version>3.0.5</jasypt.version>
<oshi.version>6.6.6</oshi.version>
<commons.io.version>2.18.0</commons.io.version>
<poi.version>5.4.0</poi.version>
<velocity.version>2.4.1</velocity.version>
<bitwalker.version>1.21</bitwalker.version>
<kaptcha.version>2.3.3</kaptcha.version>
<jakarta.xml.bind-api.version>4.0.2</jakarta.xml.bind-api.version>
<jakarta.version>6.1.0</jakarta.version>
```

### 2.2 模块结构

```
mingsha-template-vue/
├── app/
│   ├── common/        # 公共模块（依赖最多）
│   ├── dal/           # 数据访问层
│   ├── biz/           # 业务层
│   ├── web/           # Web层
│   └── test/          # 测试模块
├── boot/              # 启动入口
├── assembly/          # 打包配置
└── ui/                # 前端项目（不参与本次升级）
```

---

## 3. 目标版本清单

### 3.1 核心依赖版本对照

| 依赖 | 当前版本 | 目标版本 | 变化说明 |
|------|----------|----------|----------|
| Spring Boot | 3.5.11 | **4.0.5** | 主版本升级 |
| MySQL Connector | 9.2.0 | **9.6.0** | 小版本升级 |
| Druid | 1.2.24 | **1.2.28** | 小版本升级 |
| MyBatis Spring Boot | 3.0.4 | **4.0.1** | 大版本升级 |
| PageHelper | 2.1.0 | **4.0.4** | 大版本升级 |
| fastjson2 | 2.0.54 | **2.0.61** | 小版本升级 |
| JJWT | 0.12.6 | **0.13.0** | 小版本升级 |
| springdoc | 2.8.4 | **3.0.2** | 大版本升级 |
| jasypt | 3.0.5 | **3.0.2** | 降级（最新稳定版） |
| oshi | 6.6.6 | **6.11.0** | 小版本升级 |
| commons-io | 2.18.0 | **2.21.0** | 小版本升级 |
| Apache POI | 5.4.0 | **5.5.1** | 小版本升级 |
| Maven Compiler | 3.14.0 | **3.15.0** | 小版本升级 |
| flatten-maven-plugin | 1.7.0 | **1.7.0** | 保持不变 |

### 3.2 Spring Boot 4.0 内部升级

| 组件 | 3.5.x | 4.0.x |
|------|-------|-------|
| Spring Framework | 6.x | 7.x |
| Jakarta EE | 10 | 11 |
| Servlet | 5.0 | 6.1 |
| Hibernate | 6.x | 7.x |
| Jackson | 2.x | 3.x |

---

## 4. Breaking Changes 清单

### 4.1 高风险项（需代码改动）

#### 4.1.1 Jackson 3 升级

**问题描述**：Jackson 从 2.x 升级到 3.x，包名和注解发生变化

**受影响范围**：
- `com.fasterxml.jackson` → `tools.jackson`
- Spring Boot 内部 JSON 处理

**代码改动**：

```java
// 旧写法
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonComponent;

// 新写法（或使用兼容层）
import tools.jackson.databind.ObjectMapper;
import tools.jackson.annotation.JacksonComponent;

// 或者使用新的 Spring Boot 注解
import org.springframework.boot.jackson.JacksonComponent;
```

**配置变化**：

```yaml
# 旧配置
spring:
  jackson:
    date-format: yyyy-MM-dd HH:mm:ss
    serialization:
      write-dates-as-timestamps: false

# 新配置
spring:
  jackson:
    json:
      read:
        date-format: yyyy-MM-dd HH:mm:ss
      write:
        dates:
          as-timestamps: false
```

**应对策略**：
1. 添加 `spring-boot-jackson2` 兼容层依赖
2. 或逐步迁移到 Jackson 3

#### 4.1.2 测试注解变化

**问题描述**：`@MockBean` 和 `@SpyBean` 被移除

**代码改动**：

```java
// 旧写法
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.SpyBean;

@SpringBootTest
class MyTest {
    @MockBean
    private UserService userService;

    @SpyBean
    private SomeService someService;
}

// 新写法
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.context.bean.override.mockito.MockitoSpyBean;

@SpringBootTest
@AutoConfigureMockMvc  // 需要显式添加
class MyTest {
    @MockitoBean
    private UserService userService;

    @MockitoSpyBean
    private SomeService someService;
}
```

**其他测试变化**：
- `@SpringBootTest` 不再自动提供 MockMVC，需添加 `@AutoConfigureMockMvc`
- `TestRestTemplate` 需要 `@AutoConfigureTestRestTemplate`
- `MockitoTestExecutionListener` 已移除

#### 4.1.3 HttpMessageConverters 废弃

**问题描述**：`HttpMessageConverters` 类被标记为废弃

```java
// 旧写法
@Autowired
private HttpMessageConverters messageConverters;

// 新写法
@Autowired
private List<HttpMessageConverter<?>> converters;

// 或使用新的定制器
@Autowired
private ServerHttpMessageConvertersCustomizer customizer;
```

### 4.2 中风险项（配置/依赖调整）

#### 4.2.1 Starter 重命名

| 旧名称 | 新名称 |
|--------|--------|
| `spring-boot-starter-web` | `spring-boot-starter-webmvc` |
| `spring-boot-starter-aop` | `spring-boot-starter-aspectj` |
| `spring-boot-starter-oauth2-resource-server` | `spring-boot-starter-security-oauth2-resource-server` |

#### 4.2.2 配置属性重命名

```yaml
# 旧
spring:
  session:
    redis:
      flush-mode: on_save
  data:
    mongodb:
      uri: mongodb://localhost/test

# 新
spring:
  session:
    data:
      redis:
        flush-mode: on_save
  mongodb:
    uri: mongodb://localhost/test
```

#### 4.2.3 MyBatis 4.0 变化

MyBatis 4.0 主要 API 变化：
- 包名变化（部分）
- 注解 API 调整
- 需要验证现有 mapper 注解兼容性

#### 4.2.4 springdoc 3.0 变化

springdoc 3.0 适配 Spring Boot 4.0：
- API 可能略有调整
- Swagger UI 路径可能变化

### 4.3 低风险项（已知兼容）

- DevTools LiveReload 默认禁用（可通过配置开启）
- Logback 默认字符集改为 UTF-8
- Spring Retry 不再被管理（需显式声明版本）

### 4.4 移除的组件（检查依赖）

| 移除项 | 影响 |
|--------|------|
| Undertow 支持 | 无（项目使用 Tomcat） |
| Pulsar Reactive | 无（项目未使用） |
| Spring Session Hazelcast | 无（项目未使用） |
| Spring Session MongoDB | 无（项目未使用） |
| Spock 集成 | 无（项目未使用） |

---

## 5. 详细升级步骤

### 阶段一：准备（1-2小时）

#### Step 1.1 创建备份分支

```bash
# 确保在项目根目录
cd /path/to/mingsha-template-vue

# 创建升级分支
git checkout -b upgrade/spring-boot-4.0

# 或使用时间戳命名
git checkout -b upgrade/spring-boot-4.0-$(date +%Y%m%d)
```

#### Step 1.2 记录当前状态

```bash
# 记录当前版本
echo "=== 当前依赖版本 ===" > upgrade-notes.md
./mvnw dependency:list -DincludeScope=compile | grep -E "^\[INFO\].*:.*:.*:" | sort >> upgrade-notes.md

# 记录测试结果
./mvnw test -Dtest=*Test 2>&1 | tee test-before-upgrade.log
```

#### Step 1.3 确认环境

```bash
# 检查 Java 版本
java -version
# 应显示 17 或更高

# 检查 Maven 版本
./mvnw -version
# 应显示 3.9.0 或更高
```

### 阶段二：依赖升级（2-3小时）

#### Step 2.1 修改根 pom.xml

修改 `pom.xml` 中的版本属性：

```xml
<!-- 主版本 -->
<spring-boot.version>4.0.5</spring-boot.version>

<!-- 相关依赖 -->
<mybatis-spring-boot.version>4.0.1</mybatis-spring-boot.version>
<mysql.version>9.6.0</mysql.version>
<druid.version>1.2.28</druid.version>
<pagehelper.boot.version>4.0.4</pagehelper.boot.version>
<fastjson.version>2.0.61</fastjson.version>
<jjwt.version>0.13.0</jjwt.version>
<springdoc.version>3.0.2</springdoc.version>
<jasypt.version>3.0.2</jasypt.version>
<oshi.version>6.11.0</oshi.version>
<commons.io.version>2.21.0</commons.io.version>
<poi.version>5.5.1</poi.version>
<maven-compiler-plugin.version>3.15.0</maven-compiler-plugin.version>
```

#### Step 2.2 添加 Properties Migrator（临时）

```xml
<!-- 在 boot/pom.xml 的 dependencies 中添加 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-properties-migrator</artifactId>
    <scope>runtime</scope>
</dependency>
```

#### Step 2.3 修改 Starter 名称（如需要）

如果项目直接引用了旧的 starter 名称，需要更新：

```xml
<!-- app/common/pom.xml 中 -->
<!-- spring-boot-starter-web 保持不变，会自动解析为 webmvc -->
```

### 阶段三：编译验证（3-4小时）

#### Step 3.1 首次编译

```bash
# 清理并编译（跳过测试）
./mvnw clean compile -DskipTests
```

**预期结果**：
- 可能有编译错误（Jackson 注解相关）
- 可能有弃用警告

#### Step 3.2 处理编译错误

根据错误信息，按以下优先级处理：

1. **Jackson 相关错误**
   - 检查 `spring-boot-jackson2` 兼容层是否需要
   - 或更新注解引用

2. **依赖冲突**
   ```bash
   # 查看依赖树
   ./mvnw dependency:tree -Dverbose | head -100
   ```

3. **版本冲突**
   - 可能需要排除传递依赖
   ```xml
   <exclusion>
       <groupId>某些冲突组</groupId>
       <artifactId>冲突artifact</artifactId>
   </exclusion>
   ```

#### Step 3.3 记录编译问题

```bash
# 编译并保存输出
./mvnw clean compile -DskipTests 2>&1 | tee compile-output.log

# 提取错误
grep -E "^\[ERROR\]" compile-output.log > errors.txt
```

### 阶段四：测试适配（4-6小时）

#### Step 4.1 处理测试注解

搜索所有使用 `@MockBean` 和 `@SpyBean` 的文件：

```bash
# 查找相关文件
grep -r "@MockBean\|@SpyBean" --include="*.java" app/
```

逐一修改为：
- `@MockBean` → `@MockitoBean`
- `@SpyBean` → `@MockitoSpyBean`

#### Step 4.2 添加必要注解

在测试类中添加缺失的注解：

```java
// 如果使用 MockMvc
@SpringBootTest
@AutoConfigureMockMvc  // 之前是隐式提供的
class MyTest { }

// 如果使用 TestRestTemplate
@SpringBootTest
@AutoConfigureTestRestTemplate  // 需要显式添加
class MyTest { }

// 新方式
@SpringBootTest
@AutoConfigureRestTestClient  // 推荐使用新 API
class MyTest { }
```

#### Step 4.3 运行测试

```bash
# 运行所有测试
./mvnw test 2>&1 | tee test-output.log

# 只运行单元测试（如果集成测试有问题）
./mvnw test -Dtest="*Test,!*IntegrationTest"
```

### 阶段五：配置迁移（1-2小时）

#### Step 5.1 运行应用检查配置

```bash
# 启动应用，观察 properties-migrator 的警告
./mvnw spring-boot:run
```

#### Step 5.2 更新配置文件

根据 properties-migrator 的提示，更新以下配置文件：
- `config/application.yml`
- `config/application-dev.yml`
- `config/application-prod.yml`
- `config/application-test.yml`

#### Step 5.3 移除 migrator

确认无警告后，移除 migrator 依赖：

```xml
<!-- 从 boot/pom.xml 中移除 -->
<!--
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-properties-migrator</artifactId>
    <scope>runtime</scope>
</dependency>
-->
```

### 阶段六：集成验证（2-3小时）

#### Step 6.1 完整打包

```bash
# 跳过测试的完整打包
./mvnw clean package -DskipTests
```

#### Step 6.2 启动验证

```bash
# 启动应用
java -jar boot/target/mingsha-template-vue-boot-*.jar
```

检查：
- [ ] 应用正常启动
- [ ] 健康检查端点正常 `/actuator/health`
- [ ] API 文档可访问 `/swagger-ui.html` 或 `/ui/swagger-ui.html`
- [ ] 数据库连接正常
- [ ] Redis 连接正常（如使用）

#### Step 6.3 功能验证

根据项目功能，进行核心流程测试：
- [ ] 登录功能
- [ ] CRUD 操作
- [ ] 文件上传下载（如有）
- [ ] 定时任务（如有）

### 阶段七：清理与文档（1小时）

#### Step 7.1 清理工作

```bash
# 移除编译输出文件
rm -f compile-output.log test-output.log test-before-upgrade.log errors.txt

# 提交更改
git add -A
git commit -m "feat: upgrade to Spring Boot 4.0.5

Changes:
- Spring Boot: 3.5.11 -> 4.0.5
- MySQL Connector: 9.2.0 -> 9.6.0
- Druid: 1.2.24 -> 1.2.28
- MyBatis: 3.0.4 -> 4.0.1
- PageHelper: 2.1.0 -> 4.0.4
- springdoc: 2.8.4 -> 3.0.2
- jasypt: 3.0.5 -> 3.0.2
- oshi: 6.6.6 -> 6.11.0
- commons-io: 2.18.0 -> 2.21.0
- Apache POI: 5.4.0 -> 5.5.1

Breaking changes addressed:
- Jackson 3 migration
- Test annotations update (@MockBean -> @MockitoBean)
- Configuration property renames
"
```

#### Step 7.2 更新文档

- 更新 README.md 中的版本要求
- 更新部署文档
- 更新开发环境配置说明

---

## 6. 风险评估与应对

### 6.1 风险矩阵

| 风险项 | 概率 | 影响 | 风险等级 | 应对措施 |
|--------|------|------|----------|----------|
| Jackson 兼容问题 | 高 | 高 | 🔴 高 | 添加兼容层或逐步迁移 |
| 测试用例失败 | 中 | 中 | 🟡 中 | 预留时间逐个修复 |
| MyBatis 4.0 API 变化 | 低 | 高 | 🟡 中 | 提前测试 mapper 兼容性 |
| 第三方库不兼容 | 低 | 中 | 🟢 低 | 检查依赖树，准备降级 |
| 配置迁移遗漏 | 中 | 中 | 🟡 中 | 使用 migrator 工具 |

### 6.2 降级方案

如果升级失败，按以下顺序回退：

1. **方案一：Git 回退**
   ```bash
   git checkout master
   git branch -D upgrade/spring-boot-4.0
   ```

2. **方案二：版本降级**
   ```xml
   <!-- 临时改回 3.5.x -->
   <spring-boot.version>3.5.13</spring-boot.version>
   ```

### 6.3 常见问题处理

#### Q1: 编译报错 "cannot find symbol"
**原因**：Jackson 包名变化
**解决**：检查 import 语句，更新为新包名或使用兼容层

#### Q2: 测试报错 "NoSuchBeanDefinitionException"
**原因**：Bean 定义方式变化
**解决**：检查 @MockitoBean 使用位置，避免在 @Configuration 中使用

#### Q3: 启动报错 "IllegalStateException"
**原因**：配置属性不兼容
**解决**：检查 application.yml，使用 migrator 工具定位问题

---

## 7. 回滚方案

### 7.1 回滚触发条件

- 编译无法通过且修复时间超过 8 小时
- 测试用例失败率超过 30%
- 核心功能不可用

### 7.2 回滚步骤

```bash
# 1. 切换回主分支
git checkout master

# 2. 删除升级分支
git branch -D upgrade/spring-boot-4.0

# 3. 验证主分支正常
./mvnw clean compile -DskipTests
./mvnw test

# 4. 记录失败原因到 upgrade-notes.md
```

### 7.3 延期策略

如果遇到无法快速解决的问题：

1. **分阶段升级**：先升级依赖到最新 3.5.x 版本
2. **部分升级**：只升级低风险依赖
3. **等待社区**：关注 Spring Boot 4.0 的第一个补丁版本

---

## 8. 验证清单

### 8.1 编译验证

- [ ] `./mvnw clean compile -DskipTests` 成功
- [ ] 无编译警告（或警告已在预期范围内）
- [ ] 所有模块编译通过

### 8.2 测试验证

- [ ] `./mvnw test` 成功
- [ ] 测试覆盖率未显著下降（>90%）
- [ ] 关键业务测试全部通过

### 8.3 功能验证

- [ ] 应用正常启动
- [ ] 健康检查通过
- [ ] API 文档可访问
- [ ] 数据库读写正常
- [ ] 缓存功能正常
- [ ] 定时任务正常

### 8.4 配置验证

- [ ] 所有环境配置检查通过
- [ ] 无 properties-migrator 警告
- [ ] 日志输出正常

### 8.5 性能验证

- [ ] 启动时间未显著增加（<30秒）
- [ ] 内存使用未显著增加（<500MB）
- [ ] 响应时间未显著增加

---

## 附录

### A. 参考资料

- [Spring Boot 4.0 Migration Guide](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.0-Migration-Guide)
- [Spring Boot 4.0 Release Notes](https://github.com/spring-projects/spring-boot/releases)
- [MyBatis Spring Boot 4.0 Release Notes](https://github.com/mybatis/spring-boot/releases)
- [springdoc 3.0 Documentation](https://springdoc.org/v3/)

### B. 依赖 Maven 仓库

- Maven Central: https://repo1.maven.org/maven2/
- Spring Milestones: https://repo.spring.io/milestone/

### C. 升级时间估算

| 阶段 | 预计时间 | 实际时间 | 备注 |
|------|----------|----------|------|
| 准备 | 1-2h | 5min | |
| 依赖升级 | 2-3h | 10min | |
| 编译验证 | 3-4h | 30min | |
| 测试适配 | 4-6h | 5min | 无需修改 |
| 配置迁移 | 1-2h | - | 待启动验证 |
| 集成验证 | 2-3h | - | 待启动验证 |
| 清理文档 | 1h | 5min | |
| **总计** | **14-21h** | **~1h** | |

### D. 实际升级遇到的问题

#### 问题 1：spring-boot-starter-aop 已重命名
```
错误: 'dependencies.dependency.version' for spring-boot-starter-aop is missing
解决: spring-boot-starter-aop -> spring-boot-starter-aspectj
```

#### 问题 2：jakarta.servlet-api 重复声明
```
错误: duplicate declaration of version for jakarta.servlet-api
解决: 删除 app/common/pom.xml 中重复的 servlet-api 声明
```

#### 问题 3：PageHelper 版本不存在
```
错误: Could not find artifact pagehelper-spring-boot-starter:jar:4.0.4
解决: 回退到 2.1.1（最新稳定版）
```

#### 问题 4：Jackson2ObjectMapperBuilderCustomizer 已移除
```
错误: 程序包 org.springframework.boot.autoconfigure.jackson 不存在
解决: 使用自定义 ObjectMapper Bean 替代
```

#### 问题 5：DaoAuthenticationProvider 构造函数变化
```
错误: 构造器 DaoAuthenticationProvider 无法应用到给定类型
解决: 构造函数改为 new DaoAuthenticationProvider(userDetailsService)
```

#### 问题 6：DataSourceAutoConfiguration 位置变化
```
错误: 程序包 org.springframework.boot.autoconfigure.jdbc 不存在
解决: 移除 exclude 配置（Spring Boot 4.0 不再需要）
```

### E. 升级分支信息

```
分支名称: upgrade/spring-boot-4.0-20260408
提交哈希: eaf501e
升级日期: 2026-04-08
```

### F. 已验证项

- [x] 应用启动验证
- [x] 数据库连接验证
- [x] Redis 连接验证
- [x] API 文档访问
- [x] 登录功能测试
- [x] 配置属性迁移（使用 properties-migrator）

---

*文档由 Claude AI 生成，最后更新于 2026-04-09*
