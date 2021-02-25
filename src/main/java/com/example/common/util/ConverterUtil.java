package com.example.common.util;

import com.github.dozermapper.core.DozerBeanMapperBuilder;
import com.github.dozermapper.core.Mapper;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * @author song
 */
public class ConverterUtil {
    private static final Mapper MAPPER = DozerBeanMapperBuilder.buildDefault();

    public static  <T> T convert(Object o, Class<T> var2) {
        if (Objects.isNull(o)) {
            return null;
        }
        return MAPPER.map(o, var2);
    }

    public static  <T> List<T> convertList(List<?> list, Class<T> var) {
        if (CollectionUtils.isEmpty(list)) {
            return Collections.EMPTY_LIST;
        }
        List<T> resultList = new ArrayList<>(list.size());
        list.forEach(t -> {
            T vo = MAPPER.map(t, var);
            resultList.add(vo);
        });
        return resultList;
    }
}
