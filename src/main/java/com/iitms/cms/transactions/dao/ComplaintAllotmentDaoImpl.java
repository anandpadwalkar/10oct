package com.iitms.cms.transactions.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.cms.transactions.entity.ComplaintAllotmentEntity;
import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;


@Repository
public class ComplaintAllotmentDaoImpl implements ComplaintAllotmentDao{

	private static final Logger logger = LoggerFactory.getLogger(ComplaintAllotmentDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ComplaintRegisterEntity> getAllComplaintsAllotment() {
		Session session = this.sessionFactory.getCurrentSession();
		ProjectionList  projectionList = Projections.projectionList();
		projectionList.add(Projections.property("id").as("id"));
		projectionList.add(Projections.property("complaintDate").as("complaintDate"));
		projectionList.add(Projections.property("complaintDetails").as("complaintDetails"));
		projectionList.add(Projections.property("complaintDepartment.deptName").as("deptName"));
		projectionList.add(Projections.property("complaintStatusEntity.statusName").as("statusName"));
		
		List<ComplaintRegisterEntity> list = session.createCriteria(ComplaintRegisterEntity.class)
		.createAlias("complaintDepartment", "complaintDepartment", JoinType.LEFT_OUTER_JOIN)
		.createAlias("complaintStatusEntity", "complaintStatusEntity", JoinType.LEFT_OUTER_JOIN)
		.setProjection(projectionList)
		.add(Restrictions.eq("complaintStatusId", 1))
		.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		.list();
		
		return list;
	}


	@Override
	public boolean allotComplaints(String complaintIds, int complaintTypeId, int employeeId) {
		Session session= this.sessionFactory.getCurrentSession();
		ComplaintAllotmentEntity entity;
		List<Integer> list = new ArrayList<Integer>();
		for(String complaintId : complaintIds.split(",")){
			entity = new ComplaintAllotmentEntity();
			entity.setComplaintId(Integer.parseInt(complaintId));
			entity.setComplaintTypeId(complaintTypeId);
			entity.setEmployeeId(employeeId);
			session.save(entity);
			list.add(entity.getComplaintId());
		}
		int count = session.createQuery("Update ComplaintRegisterEntity entity set complaintStatusId = 2 where id in :ids")
		.setParameterList("ids", list)
		.executeUpdate();
		logger.info("Update count : " + count);
		return true;
	}


	
	
	
}
