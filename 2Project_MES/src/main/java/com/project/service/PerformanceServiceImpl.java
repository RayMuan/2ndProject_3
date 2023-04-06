package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.PerformanceDAO;
import com.project.domain.PageDTO;
import com.project.domain.PerformanceDTO;
import com.project.domain.ProductDTO;

@Service
public class PerformanceServiceImpl implements PerformanceService {

	@Inject
	private PerformanceDAO performanceDAO;

	@Override
	public List<PerformanceDTO> performanceCurrentInfo(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl performanceCurrentInfo()");
		// 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return performanceDAO.performanceCurrentInfo(pageDTO);
	}

	// 검색어
	@Override
	public int performanceCurrentCount(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl performanceCurrentCount()");

		return performanceDAO.performanceCurrentCount(pageDTO);
	}

	@Override
	public List<PerformanceDTO> perfCurrJsonList(String prod_cd) {
		System.out.println("PerformanceServiceImpl perfCurrJsonList()");

		return performanceDAO.perfCurrJsonList(prod_cd);
	}

	@Override
	public List<ProductDTO> getProductInfo(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl getProductInfo()");
		// 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);

		return performanceDAO.getProductInfo(pageDTO);
	}

	@Override
	public int getProductCount(PageDTO pageDTO) {
		System.out.println("PerformanceServiceImpl getProductCount()");

		return performanceDAO.getProductCount(pageDTO);
	}
}
