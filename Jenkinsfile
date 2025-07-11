pipeline {
    agent { label 'linux' }

    tools {
        jdk 'jdk17'
    }

    environment {
        MAVEN_OPTS = '-Dmaven.test.failure.ignore=false'
        REPO_DIR = "${env.WORKSPACE}"
        EMAIL_RECIPIENTS = 'dev-team@example.com' // 收件人
        EMAIL_SUBJECT = '[构建通知] mingsha-template-vue #${BUILD_NUMBER} - ${BUILD_STATUS}'
        EMAIL_BODY = '''
            <h3>Jenkins 构建通知</h3>
            <ul>
                <li>项目: mingsha-template-vue</li>
                <li>构建编号: ${BUILD_NUMBER}</li>
                <li>状态: ${BUILD_STATUS}</li>
                <li>分支: ${GIT_BRANCH}</li>
                <li>提交: ${GIT_COMMIT}</li>
                <li>详情: <a href="${BUILD_URL}">${BUILD_URL}</a></li>
            </ul>
        '''
        // 只保留1个归档版本
        NUM_TO_KEEP = 1
        // 构建环境，可通过参数指定
        BUILD_ENV = "${params.BUILD_ENV ?: 'dev'}"
        // 是否跳过测试
        SKIP_TESTS = "${params.SKIP_TESTS ?: 'false'}"
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: env.NUM_TO_KEEP))
        // 添加构建参数
        parameters([
            choice(
                name: 'BUILD_ENV',
                choices: ['dev', 'test', 'prod'],
                description: '选择构建环境'
            ),
            booleanParam(
                name: 'SKIP_TESTS',
                defaultValue: false,
                description: '是否跳过测试'
            )
        ])
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🚀 开始构建 mingsha-template-vue 项目"
                echo "📁 工作目录: ${env.REPO_DIR}"
                echo "🏗️  构建环境: ${env.BUILD_ENV}"
                echo "🧪 跳过测试: ${env.SKIP_TESTS}"
            }
        }

        stage('Update Scripts') {
            steps {
                script {
                    echo "⚙️  更新部署脚本配置..."
                    
                    // 读取应用配置
                    def appName = sh(
                        script: "grep 'app.name' config/app.properties | cut -d'=' -f2 | sed 's/ //'",
                        returnStdout: true
                    ).trim()
                    
                    def appVersion = sh(
                        script: "grep 'app.version' config/app.properties | cut -d'=' -f2 | sed 's/ //'",
                        returnStdout: true
                    ).trim()
                    
                    def appJar = "${appName}-${appVersion}.jar"
                    
                    echo "📦 应用名称: ${appName}"
                    echo "📦 应用版本: ${appVersion}"
                    echo "📦 JAR文件名: ${appJar}"
                    
                    // 更新部署脚本
                    sh """
                        # 更新 debugger.sh
                        sed -i 's/APPLICATION=[^<]*/APPLICATION=${appName}/1' deploy/deploy/debugger.sh
                        sed -i 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${appJar}/1' deploy/deploy/debugger.sh
                        
                        # 更新 startup.sh
                        sed -i 's/APPLICATION=[^<]*/APPLICATION=${appName}/1' deploy/deploy/startup.sh
                        sed -i 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${appJar}/1' deploy/deploy/startup.sh
                        
                        # 更新 shutdown.sh
                        sed -i 's/APPLICATION=[^<]*/APPLICATION=${appName}/1' deploy/deploy/shutdown.sh
                        sed -i 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${appJar}/1' deploy/deploy/shutdown.sh
                        
                        # 更新 restart.sh
                        sed -i 's/APPLICATION=[^<]*/APPLICATION=${appName}/1' deploy/deploy/restart.sh
                        sed -i 's/APPLICATION_JAR=[^<]*/APPLICATION_JAR=${appJar}/1' deploy/deploy/restart.sh
                    """
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    echo "📦 开始构建应用包 (环境: ${env.BUILD_ENV})..."
                    
                    // 使用 Maven 命令构建，参考 Makefile 中的 package 命令
                    sh """
                        ./mvnw --batch-mode --errors --fail-at-end --update-snapshots \
                            clean package \
                            -P ${env.BUILD_ENV} \
                            -D maven.test.skip=${env.SKIP_TESTS}
                    """
                    
                    echo "✅ 构建完成！"
                }
            }
        }

        stage('Extract Package') {
            steps {
                script {
                    echo "📂 解压构建包..."
                    
                    // 创建解压目录
                    sh "mkdir -p target/app"
                    
                    // 解压 tar.gz 包，参考 Makefile 中的 package.uncompress 命令
                    sh "tar -zxvf target/*.tar.gz -C target/app --strip-components 1"
                    
                    echo "✅ 解压完成！"
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                script {
                    echo "📦 归档构建产物..."
                    
                    // 只归档根目录下的 tar.gz 文件，不包含子目录
                    archiveArtifacts artifacts: 'target/*.tar.gz', fingerprint: true
                    
                    echo "✅ 归档完成！"
                }
            }
        }
    }

    post {
        always {
            script {
                echo "🧹 清理工作空间..."
                cleanWs()
            }
        }
        
        success {
            script {
                echo "🎉 构建成功！"
                emailext(
                    to: env.EMAIL_RECIPIENTS,
                    subject: env.EMAIL_SUBJECT.replace('${BUILD_STATUS}', '成功'),
                    body: env.EMAIL_BODY.replace('${BUILD_STATUS}', '成功'),
                    mimeType: 'text/html'
                )
            }
        }
        
        failure {
            script {
                echo "❌ 构建失败！"
                emailext(
                    to: env.EMAIL_RECIPIENTS,
                    subject: env.EMAIL_SUBJECT.replace('${BUILD_STATUS}', '失败'),
                    body: env.EMAIL_BODY.replace('${BUILD_STATUS}', '失败'),
                    mimeType: 'text/html'
                )
            }
        }
        
        aborted {
            script {
                echo "⏹️  构建被中止！"
                emailext(
                    to: env.EMAIL_RECIPIENTS,
                    subject: env.EMAIL_SUBJECT.replace('${BUILD_STATUS}', '中止'),
                    body: env.EMAIL_BODY.replace('${BUILD_STATUS}', '中止'),
                    mimeType: 'text/html'
                )
            }
        }
    }
}
