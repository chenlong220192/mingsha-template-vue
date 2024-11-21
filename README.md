## mingsha-template-vue
* 前后端分离的鸣沙管理平台
* forked from https://doc.ruoyi.vip/

### 配置加密解密
- 加密：`java -cp jasypt-1.9.3.jar org.jasypt.intf.cli.JasyptPBEStringEncryptionCLI input="your_sensitive_data" password="your_secret_password" algorithm=PBEWithMD5AndDES`
- 解密：`java -cp jasypt-1.9.3.jar org.jasypt.intf.cli.JasyptPBEStringDecryptionCLI input="encrypted_value" password="your_secret_password" algorithm=PBEWithMD5AndDES`
