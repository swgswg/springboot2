package com.example.repository;

import com.example.dto.menu.AllDto;
import com.example.model.menu.Menu;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface MenuRepo {
    /**
     * 获取所有菜单
     * @return
     */
    List<Menu> all();

    /**
     * 菜单层级树
     * @return
     */
    List<Menu> menuTree();

    List<AllDto> all2();

    public List<AllDto> menuTree2();
}
