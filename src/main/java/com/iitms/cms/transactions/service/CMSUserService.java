package com.iitms.cms.transactions.service;

import java.util.List;

import org.springframework.web.bind.annotation.ResponseBody;

import com.iitms.cms.transactions.entity.ComplaintRepairEmployee;
import com.iitms.cms.transactions.entity.Employee;

public interface CMSUserService {

	public List<Employee> getEmployeeOfDept(int deptId);
	public boolean addEmployeeOfDept(ComplaintRepairEmployee employee);
	public boolean editEmployeeOfDept(int id, String status);
	public boolean deleteEmployeeOfDept(int id);
	public List<ComplaintRepairEmployee> getComplaintRepairEmployee();
	public List<Employee> getEmployee();
	
}
