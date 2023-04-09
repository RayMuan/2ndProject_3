package com.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.LineDTO;
import com.project.domain.PageDTO;
import com.project.service.LineService;

@Controller
public class LineController {
	private LineService lineService;
	
	@Inject
	public void setLineService(LineService lineService) {
		this.lineService=lineService;
	}
	
	@RequestMapping(value = "/line/lineInfo", method = RequestMethod.GET)
	public String getLineList(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("LineController getLineInfo()");
		
		String searchLineCd=request.getParameter("modalLineCd");
		String searchLineNm=request.getParameter("modalLineNm");
		int pageSize=10;

		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);


		pageDTO=new PageDTO();
		pageDTO.setPageSize(10);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(1);
		pageDTO.setSearch(searchLineCd);
		pageDTO.setSearch2(searchLineNm);
		
		List<LineDTO> lineList=lineService.getLineList(pageDTO);
		System.out.println("라인리스트"+lineList.get(0).getLine_cd());

		int count = lineService.getLineCount(pageDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("lineList", lineList);
		model.addAttribute("pageDTO", pageDTO);

		return "line/lineInfo";
	}
	
	
}// controller
