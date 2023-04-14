package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.InstructionDTO;
import com.project.domain.PageDTO;

@Repository
public class InstructionDAOImpl implements InstructionDAO{
	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.project.mappers.instructionMapper";

	@Override
	public List<InstructionDTO> getInstList(PageDTO pageDTO) {
		System.out.println("InstDAOImpl getInstList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getInstList", pageDTO);
	}


	@Override
	public int getInstCount(PageDTO pageDTO) {
		System.out.println("InstDAOImpl getInstCount()");
		System.out.println(sqlSession.selectOne(namespace+".getInstCount"));
		return sqlSession.selectOne(namespace+".getInstCount", pageDTO);
	}


	@Override
	public void insertInst(InstructionDTO instructionDTO) {
		System.out.println("InstDAOImpl insertInst()");
		sqlSession.insert(namespace+".insertInst", instructionDTO);
	}


	@Override
	public Integer getMaxInst() {
		System.out.println("InstDAOImpl getMaxInst()");
		return sqlSession.selectOne(namespace+".getMaxInst");
	}

	@Override
	public void updateInst(InstructionDTO instructionDTO) {
		System.out.println("InstDAOImpl updateInstPro()");
		System.out.println(instructionDTO);
		sqlSession.update(namespace+".updateInst", instructionDTO);
	}


	@Override
	public InstructionDTO getInst(String inst_cd) {
		System.out.println("InstDAOImpl getInst()");

		return sqlSession.selectOne(namespace+".getInst", inst_cd);
	}


	@Override
	public void deletInst(String inst_cd) {
		System.out.println("InstDAOImpl deleteInst()");
		
		sqlSession.delete(namespace+".deleteInst", inst_cd);
	}


	@Override
	public void fcountupdate(InstructionDTO instructionDTO) {
		System.out.println("InstDAOImpl fcountupdate()");
		System.out.println(instructionDTO.getInst_count());
		System.out.println(instructionDTO.getInst_fcount());
		System.out.println(instructionDTO.getInst_st());
		
		sqlSession.update(namespace+".fcoutUpdate", instructionDTO);
		System.out.println(instructionDTO.getInst_count());
		System.out.println(instructionDTO.getInst_fcount());
	}
	
	
	

}
