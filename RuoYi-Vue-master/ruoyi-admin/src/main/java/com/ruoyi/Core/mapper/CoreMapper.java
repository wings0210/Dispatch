package com.ruoyi.Core.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CoreMapper {


    public void WarnOrders(int RestrictTime);
}
