package com.payrent.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.payrent.domain.YearPay;


@Repository("iyearpaydao")
public interface IYearPayDao {
	public void add(YearPay yearpay);
	public List<YearPay> findByTelephone(String telephone);
}
