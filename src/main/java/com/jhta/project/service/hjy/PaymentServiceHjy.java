package com.jhta.project.service.hjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.admin.PaymentMapperHjy;
import com.jhta.project.vo.hjy.PaymentVo;

@Service
public class PaymentServiceHjy {
	@Autowired PaymentMapperHjy mapper;
	public int monthlySales() {
		return mapper.monthlySales();
	};
	public int annualSales() {
		return mapper.annualSales();
	};
	public List<PaymentVo> payType() {
		return mapper.payType();
	};
	public int month() {
		return mapper.month();
	};
	public int year() {
		return mapper.year();
	};
}
