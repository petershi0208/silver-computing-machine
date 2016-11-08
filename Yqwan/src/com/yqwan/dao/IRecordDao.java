package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Record;

@Repository("recorddao")
public interface IRecordDao {
	public List<Record> listRecordnum(int n);
	public Record getrecordbyid(int id);
	
	
	/**
	 * 后台
	 */
	public List<Record> listRecord();
	public int add(Record record);
	public int update(Record record);
	public Record findById(int id);
}
