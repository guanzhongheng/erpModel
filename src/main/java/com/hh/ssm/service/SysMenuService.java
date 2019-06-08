package com.hh.ssm.service;


import com.hh.ssm.domain.authority.SysMenu;

import java.util.List;

public interface SysMenuService {

    /**获取所有菜单并填充每个菜单的子菜单列表(系统菜单列表)
     * @param menuType,menuId
     * @return
     * @throws Exception
     */
    public List<SysMenu> listAllMenuQx(String menuType,Integer menuId,String userId) throws Exception;
}
