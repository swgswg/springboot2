package com.example.repository.impl;

import com.example.constant.ErrorCode;
import com.example.converter.MenuConverter;
import com.example.dto.menu.AllDto;
import com.example.exception.work.MenuException;
import com.example.mapper.MenuMapper;
import com.example.model.menu.Menu;
import com.example.repository.MenuRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author song
 */
@Service
public class MenuRepoImpl implements MenuRepo {
    @Autowired
    MenuMapper menuMapper;

    @Autowired
    MenuConverter menuConverter;

    /**
     * 获取所有菜单
     * @return
     */
    @Override
    public List<Menu> all() {
        try {
            return menuMapper.all();
        } catch (Exception e) {
            throw new MenuException(ErrorCode.MENU_SELECT_ERROR);
        }
    }

    @Override
    public List<AllDto> all2() {
        return menuConverter.convert(this.all());
    }


    /**
     * 层级目录树
     * @return
     */
    @Override
    public List<Menu> menuTree() {
        return levelTree(0, this.all());
    }

    @Override
    public List<AllDto> menuTree2() {
        return menuConverter.convert(levelTree(0, this.all()));
    }



    /**
     * 菜单层级树
     * @param pid
     * @param menus
     * @return
     */
    private List<Menu> levelTree(int pid, List<Menu> menus) {
        List<Menu> menuTree = new ArrayList<>();
        for (Menu menu: menus) {
            if (menu.getParentId() == pid) {
                menu.setChildren(this.levelTree(menu.getId(), menus));
                menuTree.add(menu);
            }
        }
        return menuTree;
    }
}
