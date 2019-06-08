package com.hh.ssm.mapper.authority;

import com.hh.ssm.domain.authority.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysMenuMapper {

    /**通过ID获取其子一级菜单
     * @param parentId
     * @return
     */
    List<SysMenu> listSubMenuByParentIdAndType(@Param("menuType") String menuType, @Param("parentId")Integer parentId);

}
