package com.project.dao;

import java.util.List;

import com.project.domain.ImatDTO;
import com.project.domain.PageDTO;
import com.project.domain.ProductDTO;

public interface ImatDAO {

	public List<ImatDTO> getImatbeList(PageDTO pageDTO);

	public List<ImatDTO> getIomatList(PageDTO pageDTO);


	public int getIomatCount(PageDTO pageDTO);
	public int getImatCount(PageDTO pageDTO);

	public ImatDTO getImat(String imat_cd);
	
	public ProductDTO getProd(String prod_cd);

	public void deleteList(ImatDTO imatDTO);

	public void insertImat(ImatDTO imatDTO);

	public void updateImat(ImatDTO imatDTO);

	public List<ProductDTO> getImatprodList(PageDTO pageDTO);

	public Integer getMaxCd();

//	List<ProductDTO> getImatprodList1(PageDTO pageDTO);


}
