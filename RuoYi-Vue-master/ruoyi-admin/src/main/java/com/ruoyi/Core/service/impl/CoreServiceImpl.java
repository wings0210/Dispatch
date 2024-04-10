package com.ruoyi.Core.service.impl;

import com.ruoyi.Core.mapper.CoreMapper;
import com.ruoyi.Core.service.ICoreService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CoreServiceImpl implements ICoreService {

    @Autowired

    private CoreMapper coreMapper;

    @Override
    public void WarnOrders(int RestrictTime){
        coreMapper.WarnOrders(RestrictTime);
    }
};
