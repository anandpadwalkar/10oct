<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 <!-- code start here  -->
      <div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1  class="page-header">Complaint Department</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<button onclick="document.getElementById('popup').style.display=''" style="margin-bottom: 5px" type="button"
						class="btn btn-success btn-sm" data-toggle="tooltip"  data-original-title="Add New Department">
						<i class="fa fa-plus"></i> &nbsp;&nbsp;&nbsp; ADD
					</button>
				</div>
				<div class="col-lg-3 col-md-6"></div>
				<div class="col-lg-3 col-md-6"></div>

			</div>



			<!--Table Start Here  -->
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div  id="table_panel_header" class="panel-heading"> </div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Action
											<th>Serial Number</th>
											<th>Department Name</th>
											
										</tr>
									</thead>
									<tbody>
										
										
										<c:set var="count" value="1" />
										<c:forEach items="${list}" var="dept">
											<c:if test="${count%2 eq 0 }">
												<tr class="even gradeC">
											<td>
												<button type="button" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#myModal" onclick="setDeptId(${dept.deptId})">
													<i class="fa fa-times fa-fw" data-toggle="tooltip"  data-original-title="Delete"></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle" id="update-item" 
												onclick="updateDept(${dept.deptId}, '${dept.deptName}' )" data-toggle="tooltip" title="" data-original-title="Edit">
													<i class="fa fa-edit fa-fw" ></i>
												</button>
											</td>
											<td>${dept.deptId }</td>
											
											<td>${dept.deptName }</td>
										
										</tr>
											</c:if>
											
											<c:if test="${count%2 ne 0 }">
												<tr class="odd gradeX">
											<td>
												<button type="button" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#myModal" onclick="setDeptId(${dept.deptId})">
													<i class="fa fa-times fa-fw" data-toggle="tooltip"  data-original-title="Delete"></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle" id="update-item" 
												onclick="updateDept(${dept.deptId}, '${dept.deptName}' )" data-toggle="tooltip" data-original-title="Edit">
													<i class="fa fa-edit fa-fw" ></i>
												</button>
											</td>
											<td>${dept.deptId }</td>
											
											<td>${dept.deptName }</td>
										
										</tr>
											</c:if>
											<c:set var="count" value="${count + 1 }" />
										</c:forEach>

									</tbody>
								</table>
							</div>

							<!--Table End Here  -->

							<!-- Popup Start Here -->

							<div class="row"   id="popup" style=" position: absolute;height:100%; width: 100%;top: 0px;display:none;z-index: 100">
								<div class="col-sm-2"></div>

								<div class="col-sm-6">
									<div class="panel panel-primary">
										<div class="panel-heading">Department </div>
										<div class="panel-body">
											<form:form commandName="department" action="./add-dept" method="post" 
											class="simple_form form-horizontal" modelAttribute="department" id="add-update-form">
												<div style="display: none">
													<!-- <input name="utf8" type="hidden" value=""><input
														name="authenticity_token" type="hidden"
														value="l1ZnmS1VgwqvSJR3i7mBn76i4EUc4JwwwTqtIXwPE+o="> -->
												</div>

												<input type="hidden" name="deptId" id="deptId" value="0">
												<div class="form-group email required user_horizontal_email">
													<label class="email required col-sm-5 control-label"
														for="deptName"> Department Name</label>
													<div class="col-sm-7">
														<!-- <input class="string email required form-control"
															id="user_horizontal_email" name="user_horizontal[email]"
															placeholder="Department Name" type="email"> -->
													<form:input path="deptName" id="deptName" class="form-control" placeholder="Department Name" />
													</div>
												</div>

											

												
												
												
												<div class="form-group password required user_horizontal_password col-sm-6">
													<input class="btn btn-default" name="commit" type="submit"
													value=" Add" id="add-btn">
													
															<input class="btn btn-default" onclick="document.getElementById('popup').style.display='none'" name="commit" type="button"
													value="Cancel" >

													</div>
													</form:form>
												</div>
												
											
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<!--Popup End Her  -->
								<!-- /.row -->

								<!-- /.panel-footer -->
							</div>
							<!-- /.panel .chat-panel -->
						</div>
						<!-- /.col-lg-4 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /#page-wrapper -->

			</div>
			<!-- /#wrapper -->

			<!-- Model Dialog -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<form action="../master/delete-dept" method="post" id="delete-form">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
                                            <h4 class="modal-title" id="myModalLabel">Confirmation</h4>
                                        </div>
                                        <div class="modal-body">
                                            Delete this Department ?
                                        </div>
                                        <input type="hidden" name="deptId" id="delete-deptId">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel-btn">Cancel</button>
                                            <button type="button" class="btn btn-primary" onclick="deleteDept()">Delete</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                    </form>            
                            </div>
     
     <!-- Code End here -->
     
     <!-- other code start here -->
 <a href="#myModal" id="edit-href"
		onclick="document.getElementById('popup').style.display=''"
		hidden="hidden"></a>
	
		
		
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
    
    <style type="text/css">
    .error{
    color: red;
    }
    </style>
    
    <script type="text/javascript">
    var validator;
    
	$(document).ready(function(){
		
		$('#dataTables-example').DataTable({
            responsive: true
    });
		
	$("[data-toggle='tooltip']").tooltip();	
		
		$("#add-item-btn").click(function(){
			$("#deptName").val('');
			$("#add-update-form").prop("action", "../master/add-dept");
			$("#add-btn").val('Add');
			validator.resetForm();
		});
		
		$("#cancel-btn").click(function(){
			$("#deptName").val('');
		});
		
		
		/* Form Validation */
		validator = 	$("#add-update-form").validate({
	            rules: {
	            	deptId:{
	            		required: false
	            	},
	            	deptName: {
	    	            required: true  ,
	    	            remote:'../master/check-complaint-department'  
		             }
	            },
	            messages: {
	            	deptName: {
	            		required:"Please Enter Department",
	            		remote: "Department Already Exist"
	            	}
	            }/* ,errorPlacement: function(error, element) {
	    			// Append error within linked label
	    			$( element )
	    				.closest( "form" )
	    					.find( "label[for='" + element.attr( "id" ) + "']" )
	    						.append( error );
	    		} *//* ,
	            submitHandler: function(form) {
	                form.submit();
	            } */
	        });
			
		});
	
	//});
	
	var deleteDeptId = 0;
	
	function deleteDept(){
		console.log('deleteItemId : ' + deleteDeptId);
		$("#delete-deptId").val(deleteDeptId)
		//alert($("#delete-deptId").val());
		$("#delete-form").submit();
	}
	
	function setDeptId(deptId){
		console.log('deptId : ' + deptId);
		deleteDeptId = deptId;
	}
	
	function updateDept(deptId, deptName){
	//	alert(itemId+" - "+itemCode+ " - "+itemName+ " - "+minStock+ " - "+maxStock+ " - "+currentStock+ " - "+itemUnit + " - "+ deptId);
	
	$("#deptId").val(deptId);
		$("#deptName").val(deptName);
		$("#add-update-form").attr("action", "../master/update-dept");	
		$("#add-btn").val('Update');
		
		validator.resetForm();
		
		$("#edit-href").click();
	}
   
</script>
 
  <!-- other code end here -->
 
    </tiles:putAttribute>
</tiles:insertDefinition>