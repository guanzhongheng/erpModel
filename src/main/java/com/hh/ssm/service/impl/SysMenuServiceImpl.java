package com.hh.ssm.service.impl;

import com.hh.ssm.domain.authority.SysMenu;
import com.hh.ssm.mapper.authority.SysMenuMapper;
import com.hh.ssm.mapper.authority.SysPermissionMapperCustom;
import com.hh.ssm.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class SysMenuServiceImpl implements SysMenuService {

    @Autowired
    SysMenuMapper sysMenuMapper;

    @Autowired
    private SysPermissionMapperCustom sysPermissionMapperCustom;

    @Override
    public List<SysMenu> listAllMenuQx(String menuType, Integer menuId, String userId) throws Exception {
        // 查处所有菜单
        List<SysMenu> menuList = sysMenuMapper.listSubMenuByParentIdAndType(menuType,menuId);
        for(int i=0;i<menuList.size();i++){
            SysMenu menu = menuList.get(i);
            if(!StringUtils.isEmpty(userId) && menu.getPARENT_ID() > 0){
                String permission = this.sysPermissionMapperCustom.findPermissionByUserId(userId);
                if(permission == null || permission.indexOf(menu.getMENU_ID() + ",") < 0){
                    menuList.remove(i);
                    i--;
                    continue;
                }
            }
            List<SysMenu> menus = this.listAllMenuQx(menuType,menu.getMENU_ID(),userId);
            menu.setHasMenu(true);
            menu.setSubMenu(menus);
            menu.setTarget("treeFrame");
        }
        return menuList;

    }
}
