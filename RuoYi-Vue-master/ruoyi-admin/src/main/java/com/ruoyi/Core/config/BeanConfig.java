package com.ruoyi.Core.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.ruoyi.Core.mapper.CoreMapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
/*
@Configuration
@ComponentScan("com.ruoyi.Core")
@MapperScan("com.ruoyi.Core.mapper")
public class BeanConfig {
    @Value("${spring.datasource.druid.master.url}")
    private String url;

    @Value("${spring.datasource.druid.master.username}")
    private String username;

    @Value("${spring.datasource.druid.master.password}")
    private String password;

    @Bean
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean
    public SqlSessionFactory CoreSqlSessionFactory(DataSource dataSource) throws Exception {

        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        return factoryBean.getObject();
    }
    @Bean
    public SqlSessionTemplate CoreSqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}*/
