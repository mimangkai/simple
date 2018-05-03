package tk.mybatis.simple.model;

import tk.mybatis.simple.type.Enabled;

import java.io.Serializable;
import java.util.List;

/**
 * 角色表
 */
public class SysRole implements Serializable{
    private static final long serialVersionUID = 6320941908222932112L;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    private Long id;
    private String roleName;
    /**
     * 有效标志
     */
    private Enabled enabled;

    /**
     * 创建信息
     */
    private CreateInfo createInfo;

    /**
     *用户信息
     */
    private SysUser user;
    /**
     * 角色包含的权限列表
     */
    private List<SysPrivilege> privilegeList;

    public List<SysPrivilege> getPrivilegeList() {
        return privilegeList;
    }

    public void setPrivilegeList(List<SysPrivilege> privilegeList) {
        this.privilegeList = privilegeList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Enabled getEnabled() {
        return enabled;
    }

    public void setEnabled(Enabled enabled) {
        this.enabled = enabled;
    }

    public CreateInfo getCreateInfo() {
        return createInfo;
    }

    public void setCreateInfo(CreateInfo createInfo) {
        this.createInfo = createInfo;
    }
}
