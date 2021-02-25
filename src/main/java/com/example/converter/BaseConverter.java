package com.example.converter;

import com.github.dozermapper.core.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * 转换器
 * @author song
 */
@Component
public class BaseConverter {
    @Autowired
    private Mapper mapper;

    public <T> T convert(Object o, Class<T> var2) {
        if (Objects.isNull(o)) {
            return null;
        }
        return this.mapper.map(o, var2);
    }

    public <T> List<T> convertList(List<?> list, Class<T> var) {
        if (CollectionUtils.isEmpty(list)) {
            return Collections.EMPTY_LIST;
        }
        List<T> resultList = new ArrayList<>(list.size());
        list.forEach(t -> {
            T vo = this.mapper.map(t, var);
            resultList.add(vo);
        });
        return resultList;
    }

}
