<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 <!-- code start here  -->
      <div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Complaint Allocation</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<button onclick="document.getElementById('popup').style.display=''" style="margin-bottom: 5px" type="button"
						class="btn btn-success btn-sm" id="allot-complaint-btn" data-toggle="tooltip" title="Hooray!">
						<i class="fa fa-plus"></i> &nbsp;&nbsp;&nbsp; Allot
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
							<div class="table-responsive">
								<table class="table col-sm-12 table-bordered table-striped table-condensed cf"
									id="dataTables-example">
									<thead>
										<tr>
											<th><input id="checkall" type="checkbox"  value="-1"></th>
											<th>Sr No</th>
											<th>Date</th>
											<th>Complaint</th>
											<th>Department</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										
										
										<c:set var="count" value="1" />
										<c:forEach items="${list}" var="complaint">
										
											<c:if test="${count%2 eq 0 }">
												<tr class="even gradeC" >
												<td>
											
												<label class="checkbox-inline"  style="text-align:center">
                                                <input type="checkbox" value="${complaint.id}" name="complaintId">  
                                            </label>
											</td>
											<td>${count}</td>
											<td><fmt:formatDate  value="${complaint.complaintDate}" pattern="dd-MM-yyyy"/></td>
											<td>${complaint.complaintDetails}</td>
											<td>${complaint.deptName}</td>
											<td>${complaint.statusName}</td>
										</tr>
										</c:if>
											
										<c:if test="${count%2 ne 0 }">
												<tr class="odd gradeX">
										   	<td>
												<%-- <button type="button" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#myModal" onclick="setDeptId(${dept.deptId})">
													<i class="fa fa-times fa-fw"></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle" id="update-item" >
													<i class="fa fa-edit fa-fw" ></i>
												</button>
												<button type="button" class="btn btn-info btn-circle">
													<i class="fa fa-eye fa-fw"></i>
												</button> --%>
												<label class="checkbox-inline"  style="text-align:center">
                                                <input type="checkbox" value="${complaint.id}" name="complaintId">  
                                            </label>
											</td>
											<td>${count}</td>
											<td><fmt:formatDate  value="${complaint.complaintDate}" pattern="dd-MM-yyyy"/></td>
											<td>${complaint.complaintDetails}</td>
											<td>${complaint.deptName}</td>
											<td>${complaint.statusName}</td>
										</tr>
											</c:if>
											<c:set var="count" value="${count + 1 }" />
										</c:forEach>
									</tbody>
								</table>
							</div>

							<!--Table End Here  -->
							
							

							<!-- Popup Start Here -->
	<div class="row" id="popup"
								style="position: absolute; width: 100%; top: 0px; display: none; z-index: 100">
								<div class="col-sm-2"></div>

								<div class="col-sm-6">
									<div class="panel panel-primary">
										<div class="panel-heading">Allotment</div>
										<div class="panel-body">
											<form  action="./add-item" method="post" class="simple_form form-horizontal" id="complaint-allot-form">
												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Complaint Type :</label>
													<div class="col-sm-7">
														<select class="form-control" id="complaintTypeId" name="complaintTypeId" >
															<!-- <option>Motherboard</option>
															<option>Computer</option> -->
														</select>
													<label for="complaintTypeId" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password">Alloted To :</label>
													<div class="col-sm-7">
														<select id="employeeId" name="employeeId" class="form-control">
															<!-- <option>Ravit</option>
															<option>Kishan</option> -->
														</select>
														<label for="employeeId" generated="true" class="error"></label>
													</div>
												</div>


												
												<div
													class="form-group password required user_horizontal_password col-sm-6">
													<input class="btn btn-default" name="commit" type="button"
														value=" Allot" id="allot"> <input class="btn btn-default"
														onclick="document.getElementById('popup').style.display='none'"
														name="commit" type="button" value="Cancel">
												</div>


											</form>
										</div>


									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>

							<script type="text/javascript">
								
								
								
						            // When the document is ready
						            $(document).ready(function () {
						                
						                $('#datetimepicker1').datepicker({
						                    format: "dd-mm-yyyy"
						                });  
						            
						            });
						        </script>

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
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">Confirmation</h4>
                                        </div>
                                        <div class="modal-body">
                                            Delete this Item ?
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
  <script src="<c:url value="/resources/utils/add-record-ajax.js"/>"></script>  
   
    <style type="text/css">
    .error{
    color: red;
    }
    </style>
    
    <script type="text/javascript">
    var validator;
    
	$(document).ready(function(){
		
		 $('[data-toggle="tooltip"]').tooltip();
		 
		$.ajax({
			async:false,
			url:"../master/get-complaints",
			type:"POST",
			data:{"deptId" : 0},
			success:function(response){
				var text = '';
				text += '<option value="0" selected="selected">Select Complaint</option>';
				if(JSON.stringify(response) != '[]'){
					$.each(response, function(index, complaint){
						text += '<option value="'+complaint.id+'">'+complaint.complaintTypeName+'</option>'
					});
				}
				
				$("#complaintTypeId").html(text);
				/* if(tempComplaintTypeId != ''){
					$("#complaintTypeId").val(tempComplaintTypeId);
				} */
				
			},
			error:function(){
				
			}
		});
		
		$.ajax({
			async:false,
			url:"../transaction/get-all-user",
			type:"POST",
			data:{"deptId" : 0},
			success:function(response){
				var text = '';
				text += '<option value="0" selected="selected">Select Employee</option>';
				if(JSON.stringify(response) != '[]'){
					$.each(response, function(index, employee){
						text += '<option value="'+employee.id+'">'+employee.employeeName+'</option>'
					});
				}
				
				$("#employeeId").html(text);
				/* if(tempComplaintTypeId != ''){
					$("#complaintTypeId").val(tempComplaintTypeId);
				} */
				
			},
			error:function(){
				
			}
		});
		
		/* check all start here*/
		$('#checkall').click(function (e) {
		    $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
		});

		/* check all stop here*/
		
		$('#dataTables-example').DataTable({
            responsive: true
    });
		
		
		
		$("#add-item-btn").click(function(){
			$("#deptname").val('');
			$("#add-update-form").prop("action", "../master/add-dept");
			$("#add-btn").val('Add');
			validator.resetForm();
		});
		
		$("#cancel-btn").click(function(){
			$("#deptname").val('');
		});
		
		jQuery.validator.addMethod('selectcheck', function (value) {
	        return (value != '0');
	    }, "");
		
		
		/* Form Validation */
		validator = 	$("#complaint-allot-form").validate({
	            rules: {
	            	complaintTypeId:{
	            		selectcheck: true
	            	},
	            	employeeId: {
	            		selectcheck: true
		             }
	            } ,
	            messages: {
	            	complaintTypeId: {
	            		selectcheck : ""
	            		},
	            	employeeId: {
	            		selectcheck : ""
	            		}
	            } /* ,errorPlacement: function(error, element) {
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
			
		$("#allot-complaint-btn").click(function(){
			ajaxProperties.url = "../transaction/complaint-allotment";
			ajaxProperties.formType = "complaint-allotment";
			ajaxProperties.operationType = "add";
		});
		
	$("#allot").click(function(){
		//alert('click');
		var complaints = '';
        $.each($("input[name='complaintId']:checked"), function(){            
        	complaints += $(this).val() + ",";
        });
        var complaintTypeId = $("#complaintTypeId").val();
        var employeeId = $("#employeeId").val();
        var complaintIds = complaints;
        
        ajaxProperties.data = {"complaintTypeId": complaintTypeId, "employeeId": employeeId, "complaintIds": complaintIds};
        //$("#complaint-allot-form").valid();
      $("[for='employeeId']").html('');
        $("#complaint-allot-form").valid();
      
      if($("#complaint-allot-form").valid() == true && complaintIds == '')
    	  alert('Please select Complaints to be alloted');
      else
    	 // $("#complaint-allot-form").submit();
        doAjaxPost();
	});
		
	
	
		});
	
	//});
	
	var deleteDeptId = 0;
	
	function deleteDept(){
		//console.log('deleteItemId : ' + deleteDeptId);
		$("#delete-deptId").val(deleteDeptId)
		//alert($("#delete-deptId").val());
		$("#delete-form").submit();
	}
	
	function setDeptId(deptId){
		console.log('deptId : ' + deptId);
		deleteDeptId = deptId;
	}
	
	
	function updateDept(deptId, deptName){
	$("#deptId").val(deptId);
		$("#deptname").val(deptName);
		$("#add-update-form").attr("action", "../master/update-dept");	
		$("#add-btn").val('Update');
		
		validator.resetForm();
		
		$("#edit-href").click();
	}
</script>
 
  <!-- other code end here -->
 
    </tiles:putAttribute>
</tiles:insertDefinition>