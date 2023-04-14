package com.project.dao;

import java.util.List;

import com.project.domain.OmatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface OmatDAO {

	public List<OmatDTO> getOmatbeList(PageDTO pageDTO);

	public int getOmatCount(PageDTO pageDTO);

	
	public Integer getMaxCd();
	
	public OmatDTO getOmat(String omat_cd);
	
	public ProductDTO getProd(String prod_cd);

	public void deleteList(OmatDTO omatDTO);

	public void insertOmat(OmatDTO omatDTO);

	public void updateOmat(OmatDTO omatDTO);

	public List<ProductDTO> getOmatprodList(PageDTO pageDTO);


}
