package com.iitms.cms.transactions.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.cms.transactions.dao.ComplaintAllotmentDao;
import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;

@Service
public class ComplaintAllotmentServiceImpl implements ComplaintAllotmentService{

	@Autowired
	public ComplaintAllotmentDao complaintAllotmentDao; 
	
	@Override
	@Transactional
	public List<ComplaintRegisterEntity> getAllComplaints() {
		return complaintAllotmentDao.getAllComplaintsAllotment();
	}

	@Override
	@Transactional
	public boolean allotComplaints(String complaintIds, int complaintTypeId, int employeeId) {
		return complaintAllotmentDao.allotComplaints(complaintIds, complaintTypeId, employeeId);
	}
	
	
}
