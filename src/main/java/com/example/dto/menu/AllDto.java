package com.example.dto.menu;


import com.example.model.menu.Menu;
import lombok.*;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode()
@Component
public class AllDto implements Serializable {
    private int id;
    private int parentId;
    private String menuName;
    private String url;
    private int type;
    private String auth;
    private String icon;
    private int sort;

    /**
     * 子菜单
     */
    private List<AllDto> children;
}
