package com.project.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ClientDTO;
import com.project.domain.EmployeeDTO;
import com.project.domain.OrderDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ClientService;
import com.project.service.EmployeeService;
import com.project.service.OrderService;
import com.project.service.ProductService;

@Controller
public class OrderController {
	
		@Inject
		private OrderService orderService;
		
		@Inject
		private EmployeeService employeeService;

		@Inject
		private ClientService clientService;

		@Inject
		private ProductService productService;
		
		@RequestMapping(value = "/order/orderInsert", method = RequestMethod.GET)
		public String insert(HttpServletRequest request, Model model) {
			String cli=(String)request.getParameter("cli");
			String emp=(String)request.getParameter("emp");
			String ord_date=(String)request.getParameter("ord_date");
			String ord_date_end=(String)request.getParameter("ord_date_end");
			String ord_d_date=(String)request.getParameter("ord_d_date");
			String ord_d_date_end=(String)request.getParameter("ord_d_date_end");
			
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) pageNum="1";
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setSearch(cli);
			pageDTO.setSearch2(emp);
			pageDTO.setSearch3(ord_date);
			pageDTO.setSearch4(ord_date_end);
			pageDTO.setSearch5(ord_d_date);
			pageDTO.setSearch6(ord_d_date_end);
			
			List<OrderDTO> orderInsertList=orderService.getOrderInsertList(pageDTO);
			
			int count=orderService.getOrderCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			SimpleDateFormat dfm=new SimpleDateFormat("yyyy-MM-dd");
			
			String ord_cd=(String)request.getParameter("ord_cd");
			if(ord_cd!=null) {
				OrderDTO orderDTO=orderService.getOrderInsert(ord_cd);
				String ord_dateD=dfm.format(orderDTO.getOrd_date());
				String ord_d_dateD=dfm.format(orderDTO.getOrd_d_date());
				model.addAttribute("ord_date", ord_dateD);
				model.addAttribute("ord_d_date", ord_d_dateD);
				model.addAttribute("orderDTO", orderDTO);
			}

			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderInsertList", orderInsertList);
			return "order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderInsertPro", method = RequestMethod.POST)
		public String insertPro(HttpServletRequest request, Model model) {
			String ord_cd=(String)request.getParameter("ord_cd");
			String cli_cd=(String)request.getParameter("cli_cd");
			String emp_cd=(String)request.getParameter("emp_cd");
			String prod_cd=(String)request.getParameter("prod_cd");
			int ord_count=Integer.parseInt(request.getParameter("ord_count"));
			Timestamp ord_date=Timestamp.valueOf((String)request.getParameter("ord_date")+" 23:59:59");
			Timestamp ord_d_date=Timestamp.valueOf((String)request.getParameter("ord_d_date")+" 23:59:59");

			OrderDTO orderDTO=new OrderDTO();
			orderDTO.setOrd_cd(ord_cd);
			orderDTO.setCli_cd(cli_cd);
			orderDTO.setEmp_cd(emp_cd);
			orderDTO.setProd_cd(prod_cd);
			orderDTO.setOrd_count(ord_count);
			orderDTO.setOrd_date(ord_date);
			orderDTO.setOrd_d_date(ord_d_date);
			
			String btn_add=(String)request.getParameter("btn_add");
			String btn_edit=(String)request.getParameter("btn_edit");
			String btn_del=(String)request.getParameter("btn_del");
			
			if(btn_add!=null) {
				orderService.orderAdd(orderDTO);
			}else if(btn_edit!=null) {
				orderService.orderEdit(orderDTO);
			}else if(btn_del!=null){
				orderService.orderDel(orderDTO);
			}
			
//			model.addAttribute("orderDTO", orderDTO);
			return "redirect:/order/orderInsert";
		}
		
		@RequestMapping(value = "/order/orderPop", method = RequestMethod.GET)
		public String orderPop(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			String pop=(String)request.getParameter("pop");

			int count=0;
			if(pop.equals("cli")) {
				List<ClientDTO> popList=clientService.getClientInfo(pageDTO);
				model.addAttribute("popList", popList);
				count=clientService.getClientCount();
			}else if(pop.equals("emp")) {
				List<EmployeeDTO> popList=employeeService.getEmployeeList(pageDTO);
				model.addAttribute("popList", popList);
				count=employeeService.getEmployeeCount(pageDTO);
			}else {
				List<ProductDTO> popList=productService.getProductList(pageDTO);
				model.addAttribute("popList", popList);
				count=productService.getProductCount(pageDTO);
			}
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("pop", pop);
			model.addAttribute("pageDTO", pageDTO);
			return "order/orderPop";
		}
		
		@RequestMapping(value = "/order/orderInfo", method = RequestMethod.GET)
		public String info(HttpServletRequest request, Model model) {
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currentPage=Integer.valueOf(pageNum);
			
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			List<OrderDTO> orderList=orderService.getOrderList(pageDTO);
			
			int count=orderService.getOrderCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage>pageCount) {
				endPage=pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("orderList", orderList);
			return "order/orderInfo";
		}

}