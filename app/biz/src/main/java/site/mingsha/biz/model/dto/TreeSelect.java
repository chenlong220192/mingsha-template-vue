package site.mingsha.biz.model.dto;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;
import com.fasterxml.jackson.annotation.JsonInclude;
import site.mingsha.dal.system.model.SysDeptDO;
import site.mingsha.dal.system.model.SysMenuDO;

/**
 * Treeselect树结构实体类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class TreeSelect implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private Long              id;

    /** 节点名称 */
    private String            label;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<TreeSelect>  children;

    public TreeSelect() {

    }

    public TreeSelect(SysDeptDO dept) {
        this.id = dept.getDeptId();
        this.label = dept.getDeptName();
        this.children = dept.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public TreeSelect(SysMenuDO menu) {
        this.id = menu.getMenuId();
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<TreeSelect> getChildren() {
        return children;
    }

    public void setChildren(List<TreeSelect> children) {
        this.children = children;
    }
}
