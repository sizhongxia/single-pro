package com.single.pro.service.impl;

import com.single.pro.entity.Company;
import com.single.pro.mapper.CompanyDao;
import com.single.pro.service.CompanyService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 公司、企业基础信息表 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class CompanyServiceImpl extends ServiceImpl<CompanyDao, Company> implements CompanyService {

}
