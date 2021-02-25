package com.example.mapper;

import com.example.model.menu.Menu;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface MenuMapper {
    /**
     * 获取所有菜单
     * @return
     */
    List<Menu> all();

}
