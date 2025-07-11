package site.mingsha.biz.utils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.velocity.VelocityContext;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import site.mingsha.common.constant.GenConstants;
import site.mingsha.common.utils.DateUtils;
import site.mingsha.common.utils.StringUtils;
import site.mingsha.dal.generator.model.GenTableDO;
import site.mingsha.dal.generator.model.GenTableColumnDO;

/**
 * 模板处理工具类
 *
 * @author mingsha
 * @date 2025-07-11
 */
public class VelocityUtils {
    /** 项目空间路径 */
    private static final String PROJECT_PATH           = "main/java";

    /** mybatis空间路径 */
    private static final String MYBATIS_PATH           = "main/resources/mapper";

    /** 默认上级菜单，系统工具 */
    private static final String DEFAULT_PARENT_MENU_ID = "3";

    /**
     * 设置模板变量信息
     *
     * @return 模板列表
     */
    public static VelocityContext prepareContext(GenTableDO genTableDO) {
        String moduleName = genTableDO.getModuleName();
        String businessName = genTableDO.getBusinessName();
        String packageName = genTableDO.getPackageName();
        String tplCategory = genTableDO.getTplCategory();
        String functionName = genTableDO.getFunctionName();

        VelocityContext velocityContext = new VelocityContext();
        velocityContext.put("tplCategory", genTableDO.getTplCategory());
        velocityContext.put("tableName", genTableDO.getTableName());
        velocityContext.put("functionName", StringUtils.isNotEmpty(functionName) ? functionName : "【请填写功能名称】");
        velocityContext.put("ClassName", genTableDO.getClassName());
        velocityContext.put("className", StringUtils.uncapitalize(genTableDO.getClassName()));
        velocityContext.put("moduleName", genTableDO.getModuleName());
        velocityContext.put("BusinessName", StringUtils.capitalize(genTableDO.getBusinessName()));
        velocityContext.put("businessName", genTableDO.getBusinessName());
        velocityContext.put("basePackage", getPackagePrefix(packageName));
        velocityContext.put("packageName", packageName);
        velocityContext.put("author", genTableDO.getFunctionAuthor());
        velocityContext.put("datetime", DateUtils.getDate());
        velocityContext.put("pkColumn", genTableDO.getPkColumn());
        velocityContext.put("importList", getImportList(genTableDO));
        velocityContext.put("permissionPrefix", getPermissionPrefix(moduleName, businessName));
        velocityContext.put("columns", genTableDO.getColumns());
        velocityContext.put("table", genTableDO);
        velocityContext.put("dicts", getDicts(genTableDO));
        setMenuVelocityContext(velocityContext, genTableDO);
        if (GenConstants.TPL_TREE.equals(tplCategory)) {
            setTreeVelocityContext(velocityContext, genTableDO);
        }
        if (GenConstants.TPL_SUB.equals(tplCategory)) {
            setSubVelocityContext(velocityContext, genTableDO);
        }
        return velocityContext;
    }

    public static void setMenuVelocityContext(VelocityContext context, GenTableDO genTableDO) {
        String options = genTableDO.getOptions();
        JSONObject paramsObj = JSON.parseObject(options);
        String parentMenuId = getParentMenuId(paramsObj);
        context.put("parentMenuId", parentMenuId);
    }

    public static void setTreeVelocityContext(VelocityContext context, GenTableDO genTableDO) {
        String options = genTableDO.getOptions();
        JSONObject paramsObj = JSON.parseObject(options);
        String treeCode = getTreecode(paramsObj);
        String treeParentCode = getTreeParentCode(paramsObj);
        String treeName = getTreeName(paramsObj);

        context.put("treeCode", treeCode);
        context.put("treeParentCode", treeParentCode);
        context.put("treeName", treeName);
        context.put("expandColumn", getExpandColumn(genTableDO));
        if (paramsObj.containsKey(GenConstants.TREE_PARENT_CODE)) {
            context.put("tree_parent_code", paramsObj.getString(GenConstants.TREE_PARENT_CODE));
        }
        if (paramsObj.containsKey(GenConstants.TREE_NAME)) {
            context.put("tree_name", paramsObj.getString(GenConstants.TREE_NAME));
        }
    }

    public static void setSubVelocityContext(VelocityContext context, GenTableDO genTableDO) {
        GenTableDO subTable = genTableDO.getSubTable();
        String subTableName = genTableDO.getSubTableName();
        String subTableFkName = genTableDO.getSubTableFkName();
        String subClassName = genTableDO.getSubTable().getClassName();
        String subTableFkClassName = StringUtils.convertToCamelCase(subTableFkName);

        context.put("subTable", subTable);
        context.put("subTableName", subTableName);
        context.put("subTableFkName", subTableFkName);
        context.put("subTableFkClassName", subTableFkClassName);
        context.put("subTableFkclassName", StringUtils.uncapitalize(subTableFkClassName));
        context.put("subClassName", subClassName);
        context.put("subclassName", StringUtils.uncapitalize(subClassName));
        context.put("subImportList", getImportList(genTableDO.getSubTable()));
    }

    /**
     * 获取模板信息
     * @param tplCategory 生成的模板
     * @param tplWebType 前端类型
     * @return 模板列表
     */
    public static List<String> getTemplateList(String tplCategory, String tplWebType) {
        String useWebType = "vm/vue";
        if ("element-plus".equals(tplWebType)) {
            useWebType = "vm/vue/v3";
        }
        List<String> templates = new ArrayList<String>();
        templates.add("vm/java/model.java.vm");
        templates.add("vm/java/dao.java.vm");
        templates.add("vm/java/service.java.vm");
        templates.add("vm/java/serviceImpl.java.vm");
        templates.add("vm/java/controller.java.vm");
        templates.add("vm/xml/dao.xml.vm");
        templates.add("vm/sql/sql.vm");
        templates.add("vm/js/api.js.vm");
        if (GenConstants.TPL_CRUD.equals(tplCategory)) {
            templates.add(useWebType + "/index.vue.vm");
        } else if (GenConstants.TPL_TREE.equals(tplCategory)) {
            templates.add(useWebType + "/index-tree.vue.vm");
        } else if (GenConstants.TPL_SUB.equals(tplCategory)) {
            templates.add(useWebType + "/index.vue.vm");
            templates.add("vm/java/sub-model.java.vm");
        }
        return templates;
    }

    /**
     * 获取文件名
     */
    public static String getFileName(String template, GenTableDO genTableDO) {
        // 文件名称
        String fileName = "";
        // 包路径
        String packageName = genTableDO.getPackageName();
        // 模块名
        String moduleName = genTableDO.getModuleName();
        // 大写类名
        String className = genTableDO.getClassName();
        // 业务名称
        String businessName = genTableDO.getBusinessName();

        // 根据模块化结构生成不同的路径
        String dalJavaPath = "app/dal/src/main/java/site/mingsha/dal/" + moduleName;
        String bizJavaPath = "app/biz/src/main/java/site/mingsha/biz";
        String webJavaPath = "app/web/src/main/java/site/mingsha/web/controller/" + moduleName;
        String mybatisPath = "app/dal/src/main/resources/mapper/" + moduleName;
        String vuePath = "ui/src";

        if (template.contains("model.java.vm")) {
            fileName = StringUtils.format("{}/model/{}DO.java", dalJavaPath, className);
        }
        if (template.contains("sub-model.java.vm") && StringUtils.equals(GenConstants.TPL_SUB, genTableDO.getTplCategory())) {
            fileName = StringUtils.format("{}/model/{}DO.java", dalJavaPath, genTableDO.getSubTable().getClassName());
        } else if (template.contains("dao.java.vm")) {
            fileName = StringUtils.format("{}/dao/{}DAO.java", dalJavaPath, className);
        } else if (template.contains("service.java.vm")) {
            fileName = StringUtils.format("{}/service/I{}Service.java", bizJavaPath, className);
        } else if (template.contains("serviceImpl.java.vm")) {
            fileName = StringUtils.format("{}/service/impl/{}ServiceImpl.java", bizJavaPath, className);
        } else if (template.contains("controller.java.vm")) {
            fileName = StringUtils.format("{}/{}Controller.java", webJavaPath, className);
        } else if (template.contains("dao.xml.vm")) {
            fileName = StringUtils.format("{}/{}DAO.xml", mybatisPath, className);
        } else if (template.contains("sql.vm")) {
            fileName = businessName + "Menu.sql";
        } else if (template.contains("api.js.vm")) {
            fileName = StringUtils.format("{}/api/{}/{}.js", vuePath, moduleName, businessName);
        } else if (template.contains("index.vue.vm")) {
            fileName = StringUtils.format("{}/views/{}/{}/index.vue", vuePath, moduleName, businessName);
        } else if (template.contains("index-tree.vue.vm")) {
            fileName = StringUtils.format("{}/views/{}/{}/index.vue", vuePath, moduleName, businessName);
        }
        return fileName;
    }

    /**
     * 获取包前缀
     *
     * @param packageName 包名称
     * @return 包前缀名称
     */
    public static String getPackagePrefix(String packageName) {
        int lastIndex = packageName.lastIndexOf(".");
        return StringUtils.substring(packageName, 0, lastIndex);
    }

    /**
     * 根据列类型获取导入包
     *
     * @param genTableDO 业务表对象
     * @return 返回需要导入的包列表
     */
    public static HashSet<String> getImportList(GenTableDO genTableDO) {
        List<GenTableColumnDO> columns = genTableDO.getColumns();
        GenTableDO subGenTableDO = genTableDO.getSubTable();
        HashSet<String> importList = new HashSet<String>();
        if (StringUtils.isNotNull(subGenTableDO)) {
            importList.add("java.util.List");
        }
        for (GenTableColumnDO column : columns) {
            if (!column.isSuperColumn() && GenConstants.TYPE_DATE.equals(column.getJavaType())) {
                importList.add("java.util.Date");
                importList.add("com.fasterxml.jackson.annotation.JsonFormat");
            } else if (!column.isSuperColumn() && GenConstants.TYPE_BIGDECIMAL.equals(column.getJavaType())) {
                importList.add("java.math.BigDecimal");
            }
        }
        return importList;
    }

    /**
     * 根据列类型获取字典组
     *
     * @param genTableDO 业务表对象
     * @return 返回字典组
     */
    public static String getDicts(GenTableDO genTableDO) {
        List<GenTableColumnDO> columns = genTableDO.getColumns();
        Set<String> dicts = new HashSet<String>();
        addDicts(dicts, columns);
        if (StringUtils.isNotNull(genTableDO.getSubTable())) {
            List<GenTableColumnDO> subColumns = genTableDO.getSubTable().getColumns();
            addDicts(dicts, subColumns);
        }
        return StringUtils.join(dicts, ", ");
    }

    /**
     * 添加字典列表
     *
     * @param dicts 字典列表
     * @param columns 列集合
     */
    public static void addDicts(Set<String> dicts, List<GenTableColumnDO> columns) {
        for (GenTableColumnDO column : columns) {
            if (!column.isSuperColumn() && StringUtils.isNotEmpty(column.getDictType())
                && StringUtils.equalsAny(column.getHtmlType(), new String[] { GenConstants.HTML_SELECT, GenConstants.HTML_RADIO, GenConstants.HTML_CHECKBOX })) {
                dicts.add("'" + column.getDictType() + "'");
            }
        }
    }

    /**
     * 获取权限前缀
     *
     * @param moduleName 模块名称
     * @param businessName 业务名称
     * @return 返回权限前缀
     */
    public static String getPermissionPrefix(String moduleName, String businessName) {
        return StringUtils.format("{}:{}", moduleName, businessName);
    }

    /**
     * 获取上级菜单ID字段
     *
     * @param paramsObj 生成其他选项
     * @return 上级菜单ID字段
     */
    public static String getParentMenuId(JSONObject paramsObj) {
        if (StringUtils.isNotEmpty(paramsObj) && paramsObj.containsKey(GenConstants.PARENT_MENU_ID) && StringUtils.isNotEmpty(paramsObj.getString(GenConstants.PARENT_MENU_ID))) {
            return paramsObj.getString(GenConstants.PARENT_MENU_ID);
        }
        return DEFAULT_PARENT_MENU_ID;
    }

    /**
     * 获取树编码
     *
     * @param paramsObj 生成其他选项
     * @return 树编码
     */
    public static String getTreecode(JSONObject paramsObj) {
        if (paramsObj.containsKey(GenConstants.TREE_CODE)) {
            return StringUtils.toCamelCase(paramsObj.getString(GenConstants.TREE_CODE));
        }
        return StringUtils.EMPTY;
    }

    /**
     * 获取树父编码
     *
     * @param paramsObj 生成其他选项
     * @return 树父编码
     */
    public static String getTreeParentCode(JSONObject paramsObj) {
        if (paramsObj.containsKey(GenConstants.TREE_PARENT_CODE)) {
            return StringUtils.toCamelCase(paramsObj.getString(GenConstants.TREE_PARENT_CODE));
        }
        return StringUtils.EMPTY;
    }

    /**
     * 获取树名称
     *
     * @param paramsObj 生成其他选项
     * @return 树名称
     */
    public static String getTreeName(JSONObject paramsObj) {
        if (paramsObj.containsKey(GenConstants.TREE_NAME)) {
            return StringUtils.toCamelCase(paramsObj.getString(GenConstants.TREE_NAME));
        }
        return StringUtils.EMPTY;
    }

    /**
     * 获取需要在哪一列上面显示展开按钮
     *
     * @param genTableDO 业务表对象
     * @return 展开按钮列序号
     */
    public static int getExpandColumn(GenTableDO genTableDO) {
        String options = genTableDO.getOptions();
        JSONObject paramsObj = JSON.parseObject(options);
        String treeName = paramsObj.getString(GenConstants.TREE_NAME);
        int num = 0;
        for (GenTableColumnDO column : genTableDO.getColumns()) {
            if (column.isList()) {
                num++;
                String columnName = column.getColumnName();
                if (columnName.equals(treeName)) {
                    break;
                }
            }
        }
        return num;
    }
}
