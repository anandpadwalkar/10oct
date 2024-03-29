package com.iitms.cms.transactions.service;

import java.util.List;

import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;

public interface ComplaintAllotmentService {

	public List<ComplaintRegisterEntity	> getAllComplaints();
	public boolean allotComplaints(String complaintIds, int complaintTypeId, int employeeId);
}
