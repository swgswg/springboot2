package com.example.converter;

import com.example.dto.menu.AllDto;
import com.example.model.menu.Menu;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public class MenuConverter extends BaseConverter {
    public AllDto convert(Menu menu) {
        return this.convert(menu, AllDto.class);
    }

    public List<AllDto> convert(List<Menu> menus) {
        return this.convertList(menus, AllDto.class);
    }
}
