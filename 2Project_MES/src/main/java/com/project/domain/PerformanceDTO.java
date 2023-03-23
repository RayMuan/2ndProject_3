package com.project.domain;

import java.sql.Timestamp;

public class PerformanceDTO extends InstructionDTO {
	private int perf_num;
	private String inst_cd;
	private Timestamp perf_date;
	private int perf_good;
	private int perf_err;
	private String perf_cause;
	private String perf_note;
	private String line_nm;

	public int getPerf_num() {
		return perf_num;
	}
	public void setPerf_num(int perf_num) {
		this.perf_num = perf_num;
	}
	public String getInst_cd() {
		return inst_cd;
	}
	public void setInst_cd(String inst_cd) {
		this.inst_cd = inst_cd;
	}
	public Timestamp getPerf_date() {
		return perf_date;
	}
	public void setPerf_date(Timestamp perf_date) {
		this.perf_date = perf_date;
	}
	public int getPerf_good() {
		return perf_good;
	}
	public void setPerf_good(int perf_good) {
		this.perf_good = perf_good;
	}
	public int getPerf_err() {
		return perf_err;
	}
	public void setPerf_err(int perf_err) {
		this.perf_err = perf_err;
	}
	public String getPerf_cause() {
		return perf_cause;
	}
	public void setPerf_cause(String perf_cause) {
		this.perf_cause = perf_cause;
	}
	public String getPerf_note() {
		return perf_note;
	}
	public void setPerf_note(String perf_note) {
		this.perf_note = perf_note;
	}
	public String getLine_nm() {
		return line_nm;
	}
	public void setLine_nm(String line_nm) {
		this.line_nm = line_nm;
	}
	
	
}