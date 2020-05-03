<%@ include file="/html/init.jsp"%>

<%
		renderRequest.setAttribute("request", request);
%>
<c:if test='${fn:indexOf(hiddenFields, "organizationAddressLine1")==-1 || fn:indexOf(hiddenFields, "organizationAddressLine2")==-1 || fn:indexOf(hiddenFields, "organizationAddressLine3")==-1 || fn:indexOf(hiddenFields, "organizationCountry")==-1 || fn:indexOf(hiddenFields, "organizationPincode")==-1 || fn:indexOf(hiddenFields, "organizationCity")==-1 || fn:indexOf(hiddenFields, "organizationState")==-1 || fn:indexOf(hiddenFields, "organizationDistrict")==-1 || fn:indexOf(hiddenFields, "organizationLocality")==-1 || fn:indexOf(hiddenFields, "organizationCensus")==-1 || fn:indexOf(hiddenFields, "organizationLatitude")==-1 || fn:indexOf(hiddenFields, "organizationLongitude")==-1 || fn:indexOf(hiddenFields, "jpName")==-1 || fn:indexOf(hiddenFields, "weeklyOff")==-1}'>
<liferay-ui:panel parentId="organizationPanel1Container" title="address" state="closed" id="addressPanel">
				
		<c:if test='${fn:indexOf(hiddenFields, "organizationAddressLine1")==-1 || fn:indexOf(hiddenFields, "organizationAddressLine2")==-1 || fn:indexOf(hiddenFields, "organizationAddressLine3")==-1 || fn:indexOf(hiddenFields, "organizationCountry")==-1 || fn:indexOf(hiddenFields, "organizationPincode")==-1 || fn:indexOf(hiddenFields, "organizationCity")==-1 || fn:indexOf(hiddenFields, "organizationState")==-1 || fn:indexOf(hiddenFields, "organizationDistrict")==-1 || fn:indexOf(hiddenFields, "organizationLocality")==-1 }'>
				<aui:fieldset>
					<b>Office Address :</b>
						
						<div class="row-fluid">
							<c:if test='${fn:indexOf(hiddenFields, "organizationAddressLine1")==-1}'>
								<div class="span4">
									<c:choose>
										<c:when test='${fn:indexOf(mandatoryFields, "organizationAddressLine1")==-1}'>	
											<aui:input name="organizationAddressLine1" maxlength="40" label="addressLine1" helpMessage='${isAddressValidation == "true" ? addressLine1HelpMessage : ""}' type="text" title='${isAddressValidation == "true" ? addressLine1NewTitleMsg : addressLine1OldTitleMsg}'>
											</aui:input>
										</c:when>
										<c:otherwise>
											<aui:input name="organizationAddressLine1" maxlength="40" label="addressLine1M" helpMessage='${isAddressValidation == "true" ? addressLine1HelpMessage : ""}' type="text" title='${isAddressValidation == "true" ? addressLine1NewTitleMsg : addressLine1OldTitleMsg}'>
											</aui:input>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>	
							
							<c:if test='${fn:indexOf(hiddenFields, "organizationAddressLine2")==-1}'>
								<div class="span4">
									<c:choose>
										<c:when test='${fn:indexOf(mandatoryFields, "organizationAddressLine2")==-1}'>
											<!-- FeatureId-501529-Changing Addressline2 length -->
											<aui:input name="organizationAddressLine2" maxlength="60" label="addressLine2" helpMessage='${isAddressValidation == "true" ? addressLine2HelpMessage : ""}' type="text" title='${isAddressValidation == "true" ? addressLine2NewTitleMsg : addressLine2OldTitleMsg}'>
											</aui:input>
										</c:when>
										<c:otherwise>
											<aui:input name="organizationAddressLine2" maxlength="60" label="addressLine2M" helpMessage='${isAddressValidation == "true" ? addressLine2HelpMessage : ""}' type="text" title='${isAddressValidation == "true" ? addressLine2NewTitleMsg : addressLine2OldTitleMsg}'>
											</aui:input>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test='${fn:indexOf(hiddenFields, "organizationAddressLine3")==-1}'>
								<div class="span4">
									<aui:input name="organizationAddressLine3" maxlength="40" label="addressLine3" helpMessage='${isAddressValidation == "true" ? addressLine3HelpMessage : ""}' type="text" title='${isAddressValidation == "true" ? addressLine3NewTitleMsg : addressLine3OldTitleMsg}'></aui:input>
								</div>
							</c:if>	
						</div>
					
					<div class="row-fluid">
						<c:if test='${fn:indexOf(hiddenFields, "organizationPincode")==-1}'>
							<div class="span4">
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "organizationPincode")==-1}'>
										<aui:input name="organizationPincode" maxlength="6" label="pincode" helpMessage="pincode-help-message" type="text" onblur="getLatLong('pincode')" title="6 digit number only allowed">
										</aui:input>
									</c:when>
									<c:otherwise>
										<aui:input name="organizationPincode" maxlength="6" label="pincodeM" type="text" helpMessage="pincode-help-message" onblur="getLatLong('pincode')" title="6 digit number only allowed">
										</aui:input>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						<c:if test='${fn:indexOf(hiddenFields, "organizationCity")==-1}'>
							<aui:input type="hidden" name="organizationCityText" />
							<div class="span4">
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "organizationCity")==-1}'>
										<aui:select name="organizationCity" label="organizationCity" onChange="getLatLong('city')">
										</aui:select>
									</c:when>
									<c:otherwise>
										<aui:select name="organizationCity" label="organizationCityM" onChange="getLatLong('city')">
										</aui:select>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						<c:if test='${fn:indexOf(hiddenFields, "organizationLocality")==-1}'>
							<div class="span4">
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "organizationLocality")==-1}'>
										<aui:select name="organizationLocality" label="organizationLocality" onChange="getLatLong('locality')">
										</aui:select>
									</c:when>
									<c:otherwise>
										<aui:select name="organizationLocality" label="organizationLocalityM" onChange="getLatLong('locality')">
										</aui:select>
									</c:otherwise>
									
								</c:choose>
								
							</div>
						</c:if>
					</div>
					
					<div class="row-fluid">
						
						<c:if test='${fn:indexOf(hiddenFields, "organizationDistrict")==-1}'>
							<div class="span4">
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "organizationDistrict")==-1}'>
										<aui:select name="organizationDistrict" label="district">
										</aui:select>
									</c:when>
									<c:otherwise>
										<aui:select name="organizationDistrict" label="districtM">
										</aui:select>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						
						<c:if test='${fn:indexOf(hiddenFields, "organizationState")==-1}'>
							<div class="span4">
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "organizationState")==-1}'>
										<aui:select name="organizationState" label="state" onChange="getLatLong('state')">
										</aui:select>
									</c:when>
									<c:otherwise>
										<aui:select name="organizationState" label="stateM" onChange="getLatLong('state')">
										</aui:select>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						
						
						<c:if test='${fn:indexOf(hiddenFields, "organizationCountry")==-1}'>
							<div class="span4">
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "organizationCountry")==-1}'>
										<aui:select name="organizationCountry" label="country">
											<aui:option value="IN">India</aui:option>
										</aui:select>
									</c:when>
									<c:otherwise>
										<aui:select name="organizationCountry" label="countryM">
											<aui:option value="IN">India</aui:option>
										</aui:select>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						
					</div>
					
				</aui:fieldset>
				
			</c:if>
		
		<c:if test='${fn:indexOf(hiddenFields, "organizationCensus")==-1 || fn:indexOf(hiddenFields, "organizationLatitude")==-1 || fn:indexOf(hiddenFields, "organizationLongitude")==-1 || fn:indexOf(hiddenFields, "jpName")==-1 || fn:indexOf(hiddenFields, "weeklyOff")==-1 || fn:indexOf(hiddenFields, "organizationOldPincode")==-1}'>		
				<hr />
				<aui:fieldset>
					<b>Geographic Information :</b>
					<div class="row-fluid align-btn">
						<c:if test='${fn:indexOf(hiddenFields, "organizationCensus")==-1}'>
							<div class="span4">
								<aui:input name="orgCensusHidden" type="hidden" />
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "orgCensusHidden")==-1}'>
										<aui:input name="organizationCensus" label="organizationCensus" type="text" disabled="true"/>
									</c:when>
									<c:otherwise>
										<aui:input name="organizationCensus" label="organizationCensusM" type="text" disabled="true"/>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						<c:if test='${fn:indexOf(hiddenFields, "organizationLatitude")==-1}'>
							<div class="span4">
							<aui:input name="orgLatitudeHidden" type="hidden" />	
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "orgLatitudeHidden")==-1}'>
										<aui:input name="organizationLatitude" label="latitude" type="text" disabled="true"/>
									</c:when>
									<c:otherwise>
										<aui:input name="organizationLatitude" label="latitudeM" type="text" disabled="true"/>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						<c:if test='${fn:indexOf(hiddenFields, "organizationLongitude")==-1}'>
							<div class="span4">
								<aui:input name="orgLongitudeHidden" type="hidden" />
								<c:choose>
									<c:when test='${fn:indexOf(mandatoryFields, "orgLongitudeHidden")==-1}'>
										<aui:input name="organizationLongitude" label="longitude" type="text" disabled="true"/>
									</c:when>
								<c:otherwise>
										<aui:input name="organizationLongitude" label="longitudeM" type="text" disabled="true"/>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						
						<c:if test='${onboarding:isMobile(request)}'>
							<div class="span3">
								<aui:button name="currentLocation" icon="icon-map-marker" onClick="getMyLocation()" value="mylocation"></aui:button>
							</div>
						</c:if>
					</div>
					
					<c:if test='${fn:indexOf(hiddenFields, "jpName")==-1 || fn:indexOf(hiddenFields, "organizationOldPincode")==-1}'>
						<div class="row-fluid align-btn">
							<c:if test='${fn:indexOf(hiddenFields, "organizationOldPincode")==-1}'>
								<div class="span4">
									<aui:input name="organizationOldPincode" type="hidden" />
									<c:choose>
										<c:when test='${fn:indexOf(mandatoryFields, "organizationOldPincode")==-1}'>
											<aui:input name="organizationOldPincodeDisable" maxlength="6" label="oldpincode" type="text">
											</aui:input>
										</c:when>
										<c:otherwise>
											<aui:input name="organizationOldPincodeDisable" maxlength="6" label="oldpincodeM" type="text">
											</aui:input>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
							<c:if test='${fn:indexOf(hiddenFields, "jpName")==-1}'>
								<div class="span4">
									<aui:input name="jpId" type="hidden" />
									<aui:input name="jpName" label="jioPoint" type="text" disabled="true"/>
									<aui:input name="jpNameGIS" type="hidden"></aui:input>
								</div>
							</c:if>
						</div>
					</c:if>
					<div class="row-fluid align-btn">
						<div class="span12">
							<div id="<portlet:namespace/>loading_gis"></div>
						</div>
					</div>
					
					<c:if test='${(fn:indexOf(hiddenFields, "organizationLatitude")==-1) && (fn:indexOf(hiddenFields, "organizationLongitude")==-1)}'>
						<div class="row-fluid">
							<div id="span12">
							    <div id="map_content">
							    	<div id="map" style="height: 250px"></div>
							    </div>
						    </div>
						</div>
					</c:if>
				</aui:fieldset>
		</c:if>
		
		
		<c:if test='${(fn:indexOf(hiddenFields, "weeklyOff")==-1) || (fn:indexOf(hiddenFields, "startTime")==-1) || (fn:indexOf(hiddenFields, "endTime")==-1)}'>
			<hr />
				<aui:fieldset>
					<c:if test='${(fn:indexOf(hiddenFields, "weeklyOff")==-1)}'>
							<div class="row-fluid">
								<div class="span4">
									<c:choose>
										<c:when test='${fn:indexOf(mandatoryFields, "weeklyOff")==-1}'>
											<aui:select name="weeklyOff" label="weeklyOff">
												<aui:option  value="">----------------Select----------------</aui:option>
												<c:forEach items="${workDays}" var="weeklyOffDay">
													<aui:option value="${weeklyOffDay.key}">${weeklyOffDay.value}</aui:option>
												</c:forEach>
											</aui:select>
										</c:when>
										<c:otherwise>
											<aui:select name="weeklyOff" label="weeklyOffM">
												<aui:option  value="">----------------Select----------------</aui:option>
												<c:forEach items="${workDays}" var="weeklyOffDay">
													<aui:option value="${weeklyOffDay.key}">${weeklyOffDay.value}</aui:option>
												</c:forEach>
											</aui:select>
										</c:otherwise>
									</c:choose>
									<aui:input name="noWeeklyOff" type="checkbox" label="no-weekly-off"/>
								</div>
								<div class="span4">
									<aui:input name="startDay" type="hidden" />	
									<aui:input name="orgStartDay" label="startDay" type="text" disabled="true">
									</aui:input>					
										
								</div>
								<div class="span4">
									<aui:input name="endDay" type="hidden" />	
									<aui:input name="orgEndDay" label="endDay" type="text" disabled="true">
									</aui:input>					
								</div>
						</div>
					</c:if>
					
					<c:if test='${(fn:indexOf(hiddenFields, "startTime")==-1) || (fn:indexOf(hiddenFields, "endTime")==-1)}'>
						<div class="row-fluid">
							<c:if test='${fn:indexOf(hiddenFields, "startTime")==-1}'>	
								<div class="span4">
									<label>Start Working Time</label>
									<liferay-ui:input-time name="startTime" minuteParam="min" minuteValue="0" amPmParam="am" amPmValue="0" hourParam="hour" hourValue="0"></liferay-ui:input-time>				
								</div>
							</c:if>
							<c:if test='${fn:indexOf(hiddenFields, "endTime")==-1}'>
								<div class="span4">
									<label>End Working Time</label>
									<liferay-ui:input-time name="endTime" minuteParam="min" amPmParam="ampm" hourParam="hour"></liferay-ui:input-time>					
								</div>
							</c:if>
						</div>
					</c:if>
				</aui:fieldset>
		</c:if>
		
</liferay-ui:panel>

<script type="text/javascript">

 var global_lat = 0;
 var global_lng = 0;
 var pns = '<portlet:namespace />';
 var resourceURL = '<portlet:resourceURL/>';
 var A= AUI();
 var orgDistrict = '';
 var orgLocality = '';
 
 AUI().ready('aui-base', 'aui-node', 'aui-event', 'aui-io',function (A) {
	
	A.one("#<portlet:namespace />organizationPincode").on('blur', function (e) {
	    var pincode = e.currentTarget.get('value');
	    getCity(pincode.toString(), '');
	    getState(pincode.toString(), '');
	});
	A.one("#<portlet:namespace />organizationCity").on('change', function (e) {
	    var city = e.currentTarget.get('value');
	    
	    var isIE = /*@cc_on!@*/false || !!document.documentMode;
		if(isIE){
			
     		var result = [];
			var options = e.currentTarget.get('options');
			var opt;

			for (var i=0, iLen=options.get('value').length; i<iLen; i++) {

				if (options.get('selected')[i]) {
					result.push(options.get('text')[i]);
				}
			}
			var cityText = result;	
			
		}else{
			var cityText = e.currentTarget.get('selectedOptions').get('text');
		}
		A.one("#<portlet:namespace />organizationCityText").set('value',cityText);
	    getDistrict(city.toString(), orgDistrict);
	    getLocality(city.toString(), orgLocality);
	    
	});
	
	A.one("#<portlet:namespace />weeklyOff").on('change', function (e) {
	    var weeklyOffDay = e.currentTarget.get('value');
	    getStartDayEndDay(weeklyOffDay.toString());
	});
	
	var weeklyOffDay = A.one('#<portlet:namespace />weeklyOff').get('value');
	getStartDayEndDay(weeklyOffDay.toString());
	
}); 
 
 AUI().use('aui-base', 'aui-node', function(A){ 
	 A.one("#<portlet:namespace />noWeeklyOffCheckbox").on('change', function (e) {
		 var checkBox = A.one("#<portlet:namespace />noWeeklyOffCheckbox");
		 if(A.one("#<portlet:namespace/>noWeeklyOffCheckbox").attr('checked')){ 
		 	A.one('#<portlet:namespace />weeklyOff').attr('disabled',true); 
		 	A.one('#<portlet:namespace />orgStartDay').set('value','MONDAY');
		 	A.one('#<portlet:namespace />orgEndDay').set('value','SUNDAY');
		 	A.one('#<portlet:namespace />startDay').set('value','MONDAY');
		 	A.one('#<portlet:namespace />endDay').set('value','SUNDAY');
		 }else{
		 	A.one('#<portlet:namespace />weeklyOff').attr('disabled',false); 
		 	var weeklyOffDay =   A.one('#<portlet:namespace />weeklyOff').get('value');
		 	getStartDayEndDay(weeklyOffDay.toString());
		 }
	 });
});
 
 function getStartDayEndDay(weeklyOffDay){
	 AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	    A.io.request('<portlet:resourceURL/>',{
	           dataType: 'json',
	           data:{'<portlet:namespace />weeklyOffDay' : weeklyOffDay,'<portlet:namespace />cmd':"getStartDayEndDay"},
	           method:'post',
	           on:{
	        	   success:function(){
	                   var data=this.get('responseData');
	                   A.one('#<portlet:namespace />startDay').set('value',data.startDay);
	                   A.one('#<portlet:namespace />endDay').set('value',data.endDay);
	                   
	                   A.one('#<portlet:namespace />orgStartDay').set('value',data.startDay);
	                   A.one('#<portlet:namespace />orgEndDay').set('value',data.endDay);
	                   
	             },
	             failure:function(){
	             }
	         }
	     });
	 });
	}
function getCity(pincode, orgCity){
	AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	A.io.request('<portlet:resourceURL/>',{
		dataType: 'json',
		data:{'<portlet:namespace />organizationPincode' : pincode},
		method:'post',
		on:{
			success:function(){
				var data=this.get('responseData');
				var count = 0;
				var index = 0;
				var options = '<option data-selected="true" value="">------Select City-------</option>';
				A.Array.each(data, function(obj, idx){
					count++;
					if(obj.id === orgCity){
						options += '<option value="' +obj.id + '">' + obj.name + '</option>';
						index = count;
					}else{
						options += '<option value="' +obj.id + '">' + obj.name + '</option>';	
					}
             		
	            });
	            A.one('#<portlet:namespace />organizationCity').setHTML(options);
	            A.one('#<portlet:namespace />organizationCity').set('selectedIndex',index);
			},
         failure:function(){
         }
     }
 });
	});
} 


function getState(pincode, orgState){
	AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	A.io.request('<portlet:resourceURL/>',{
		dataType: 'json',
		data:{'<portlet:namespace />getStateByPincode' : pincode},
		method:'post',
		on:{
			success:function(){
				var data=this.get('responseData');
				var count = 0;
				var index = 0;
				var options = '<option value="">------Select State------</option>';
				A.Array.each(data, function(obj, idx){
					count++;
					if(obj.id === orgState){
						options += '<option class="" value="' +obj.id + '">' + obj.name + '</option>';
						index = count;
					}else{
						options += '<option class="" value="' +obj.id + '">' + obj.name + '</option>';
					}
             		
               });
               A.one('#<portlet:namespace />organizationState').setHTML(options);
               A.one('#<portlet:namespace />organizationState').set('selectedIndex',index);
			},
         failure:function(){
         }
     }
 	});
	});
}

function getDistrict(city, orgDistrict){
	AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	A.io.request('<portlet:resourceURL/>',{
		dataType: 'json',
		data:{'<portlet:namespace />citydistrict' : city},
		method:'post',
		on:{
			success:function(){
				var data=this.get('responseData');
				var count = 0;
				var index = 0;
				var options = '<option value="">------Select District------</option>';
				A.Array.each(data, function(obj, idx){
					count++;
					if(obj.id.toUpperCase() === orgDistrict.toUpperCase()){
						options += '<option class="" value="' +obj.id + '">' + obj.name + '</option>';
						index = count;
					}else{
						options += '<option class="" value="' +obj.id + '">' + obj.name + '</option>';
					}
             		
               });
               A.one('#<portlet:namespace />organizationDistrict').setHTML(options);
               A.one('#<portlet:namespace />organizationDistrict').set('selectedIndex',index);
			},
         failure:function(){
         }
     }
 	});
	});
}

function getLocality(city, orgLocality){
	AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	A.io.request('<portlet:resourceURL/>',{
		dataType: 'json',
		data:{'<portlet:namespace />citylocality' : city},
		method:'post',
		on:{
			success:function(){
				var data=this.get('responseData');
				var count = 0;
				var index = 0;
				var options = '<option value="">----Select Locality-------</option>';
				options += '<option class="" value="NA">NOT APPLICABLE</option>';
				count++;
				A.Array.each(data, function(obj, idx){
					count++;
					if(obj.id.toUpperCase() === orgLocality.toUpperCase()){
						options += '<option class="" value="' +obj.id + '">' + obj.name + '</option>';
						index = count;
					}else{
						options += '<option class="" value="' +obj.id + '">' + obj.name + '</option>';	
					}
             		
             });
             A.one('#<portlet:namespace />organizationLocality').setHTML(options);
             A.one('#<portlet:namespace />organizationLocality').set('selectedIndex',index);
			},
         failure:function(){
         }
     }
 	});
	});
}



function getLatLong(fieldName){ 
	var locality = "";
	var orgRefNo = '${orgRefNo}';
	var hqId = '${hqId}';
	
	AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	if(A.one('#<portlet:namespace />organizationLocality').get('value')){
		locality = A.one('#<portlet:namespace />organizationLocality option:checked').get('value').trim();
	}
	var city = "";
	if(A.one('#<portlet:namespace />organizationCity').get('value')){
		city = A.one('#<portlet:namespace />organizationCity option:checked').get('value').trim();
	}
	
	var state = "";
	if(A.one('#<portlet:namespace />organizationState').get('value')){
		state = A.one('#<portlet:namespace />organizationState option:checked').get('value').trim();
	}
	
	var country = "";
	if(A.one('#<portlet:namespace />organizationCountry').get('value')){
		country = A.one('#<portlet:namespace />organizationCountry option:checked').get('value').trim();
	}
	
	if(fieldName == 'pincode'){
		clearDistrict();
		clearLocality();
		clearGeographic();
	}

	if(city != '' && locality != '' && fieldName!= 'pincode'){
		A.io.request('<portlet:resourceURL/>',{
	        dataType: 'json',
	        data:{'<portlet:namespace />cmd':"getLatLong", '<portlet:namespace />city' : city, '<portlet:namespace />locality' : locality, '<portlet:namespace />referenceNumber' : orgRefNo, '<portlet:namespace />partyId' : hqId},
	        method:'post',
	        on:{
	        	start: function(){
            		A.one('#<portlet:namespace/>loading_gis').setHTML(A.Node.create('<div class="loading-animation"  />'));
            	},
	     	   success:function(){
	     		  	A.one('#<portlet:namespace/>loading_gis').setHTML("");
	                var data=this.get('responseData');
	                	
	                	if(data.LATITUDE && data.LONGITUDE){
	                		A.one('#<portlet:namespace />organizationLatitude').set('value',data.LATITUDE);
	 	                   	A.one('#<portlet:namespace />organizationLongitude').set('value',data.LONGITUDE);
	 	                   	A.one('#<portlet:namespace />orgLatitudeHidden').set('value',data.LATITUDE);
	 	                   	A.one('#<portlet:namespace />orgLongitudeHidden').set('value',data.LONGITUDE);
	                	}
	                	   
	                   var census = A.one('#<portlet:namespace />organizationCensus');
	                   if(census){
	                	   if(data.CENSUS){
	                		   A.one('#<portlet:namespace />organizationCensus').set('value',data.CENSUS);
	 	                 	   A.one('#<portlet:namespace />orgCensusHidden').set('value',data.CENSUS);
	                	   }else{
	                		   A.one('#<portlet:namespace />organizationCensus').set('value', '');
		                       A.one('#<portlet:namespace />orgCensusHidden').set('value', '');
	                	   }
	                   }
	                  
	                   var jpNameGIS = A.one('#<portlet:namespace />jpNameGIS');
	                   if(jpNameGIS){
	                	   if(data.JIOPOINTNAME && data.JIOPOINTID){
	                		   A.one('#<portlet:namespace />jpNameGIS').set('value',data.JIOPOINTNAME);
		               	       A.one('#<portlet:namespace />jpName').set('value',data.JIOPOINTNAME);
		             	       A.one('#<portlet:namespace />jpId').set('value',data.JIOPOINTID);
	                	   }else{
	                		   	A.one('#<portlet:namespace />jpNameGIS').set('value','');
					      		A.one('#<portlet:namespace />jpName').set('value', '');
				           	  	A.one('#<portlet:namespace />jpId').set('value', '');
	                	   }
	                   }
	                   
	                   if(A.one('#<portlet:namespace />organizationCity')){
	                	   
	                	   if(data.CITYCODE && data.CITYNAME){
	                		   var options = '<option value="' +  data.CITYCODE + '">' +  data.CITYNAME.toUpperCase() + '</option>';
					           A.one('#<portlet:namespace />organizationCity').setHTML(options);
					           A.one('#<portlet:namespace />organizationCity').set('selectedIndex',0);
					           A.one("#<portlet:namespace />organizationCityText").set('value',data.CITYNAME.toUpperCase());
	                	   }else if(data.CENSUS && data.VILLAGENAME){
	                		   var options = '<option value="' +  data.CENSUS + '">' +  data.VILLAGENAME.toUpperCase() + '</option>';
					           A.one('#<portlet:namespace />organizationCity').setHTML(options);
					           A.one('#<portlet:namespace />organizationCity').set('selectedIndex',0);
					           A.one("#<portlet:namespace />organizationCityText").set('value',data.VILLAGENAME.toUpperCase());
	                	   }else{
	                		   var options = '<option value="">----Select City-------</option>';
					           A.one('#<portlet:namespace />organizationCity').setHTML(options);
					           A.one('#<portlet:namespace />organizationCity').set('selectedIndex',0);
					           A.one("#<portlet:namespace />organizationCityText").set('value', '');
	                	   }
			           }
			         	
			         	if(A.one('#<portlet:namespace />organizationState')){
			         		if(data.STATECODE && data.STATENAME){
			         			var options = '<option class="" value="' + data.STATECODE + '">' + data.STATENAME.toUpperCase() + '</option>';
				                A.one('#<portlet:namespace />organizationState').setHTML(options);
				                A.one('#<portlet:namespace />organizationState').set('selectedIndex',0);
			         		}else{
			         			var options = '<option class="" value="">----Select State-------</option>';
				                A.one('#<portlet:namespace />organizationState').setHTML(options);
				                A.one('#<portlet:namespace />organizationState').set('selectedIndex',0);
			         		}
							
			         	}
			         	
			         	if(A.one('#<portlet:namespace />organizationDistrict')){
			         		if(data.DISTRICTNAME){
			         			var options = '<option class="" value="' + data.DISTRICTNAME.toUpperCase() + '">' + data.DISTRICTNAME.toUpperCase() + '</option>';
				                A.one('#<portlet:namespace />organizationDistrict').setHTML(options);
				                A.one('#<portlet:namespace />organizationDistrict').set('selectedIndex', 0);
			         		}else{
			         			var options = '<option data-selected="true" value="">----Select District-------</option>';
			         			A.one('#<portlet:namespace />organizationDistrict').setHTML(options);
			         			A.one('#<portlet:namespace />organizationDistrict').set('selectedIndex',0);
			         		}
			         	}
			         	
			         	if(A.one('#<portlet:namespace />organizationLocality')){
			         		if(data.LOCALITYNAME){	
			         			var locality = data.LOCALITYNAME + "|";
				         		if(data.SUBLOCALITY){
				         			locality = data.LOCALITYNAME + "|" + data.SUBLOCALITY;
				         		}
								var options = '<option class="" value="' + locality.toUpperCase() + '">' +  locality.toUpperCase() + '</option>';
				                A.one('#<portlet:namespace />organizationLocality').setHTML(options);
				                A.one('#<portlet:namespace />organizationLocality').set('selectedIndex', 0);
			         		}else if(data.TALUKNAME){
			         			var options = '<option class="" value="' + data.TALUKNAME.toUpperCase() + '">' +  data.TALUKNAME.toUpperCase() + '</option>';
				                A.one('#<portlet:namespace />organizationLocality').setHTML(options);
				                A.one('#<portlet:namespace />organizationLocality').set('selectedIndex', 0);
		         			}else if(data.VILLAGENAME){
			         			var options = '<option class="" value="' + data.VILLAGENAME.toUpperCase() + '">' +  data.VILLAGENAME.toUpperCase() + '</option>';
				                A.one('#<portlet:namespace />organizationLocality').setHTML(options);
				                A.one('#<portlet:namespace />organizationLocality').set('selectedIndex', 0);
		         			}else if(data.CITYNAME){
		                		   var options = '<option value="' +  data.CITYNAME.toUpperCase() + '">' +  data.CITYNAME.toUpperCase() + '</option>';
		                		   A.one('#<portlet:namespace />organizationLocality').setHTML(options);
					               A.one('#<portlet:namespace />organizationLocality').set('selectedIndex', 0);
		                	}else{
			         			var options = '<option value="">----Select Locality-------</option>';
			         			options += '<option data-selected="true" value="NA">NOT APPLICABLE</option>';
			         			A.one('#<portlet:namespace />organizationLocality').setHTML(options);
			         			A.one('#<portlet:namespace />organizationLocality').set('selectedIndex',1);
			         		}
			         		
			         	}
			         	
			         	if(A.one('#<portlet:namespace />organizationOldPincode')){
				         	if(data.OLDPINCODE){
				         		A.one('#<portlet:namespace />organizationOldPincodeDisable').set('value', data.OLDPINCODE);
				         		A.one('#<portlet:namespace />organizationOldPincode').set('value', data.OLDPINCODE);
				         	}
			         	}
	                   
			         	if(data.LATITUDE && data.LONGITUDE){
			         		global_lat = parseFloat(data.LATITUDE);
		                   	global_lng = parseFloat(data.LONGITUDE);
		                   	updateMarkerPosition(global_lat, global_lng, data.PINCODE);
		                   
		                    var gisPincode = data.PINCODE;
				         	var pincode = A.one('#<portlet:namespace />organizationPincode').get("value");
				         	if(pincode!='' && pincode != gisPincode){
				         		$.alert({
				         		    title: "Pincode Change!",
				         		    content: "Pincode obtained from GIS is "+gisPincode+", which is different from current Pincode "+pincode+".",
				         		});
				         		//alert("PIN Code obtained from GIS is "+gisPincode+", which is different from current PIN Code "+pincode+".")
				         	}
				         	if(gisPincode){
				         		A.one('#<portlet:namespace />organizationPincode').set('value', gisPincode);	
				         	}
			         	}else{
			         		var message = Liferay.Language.get('internal-server-error-contant-system-administrator');
			         		//alert(message);
			         		$.alert({
			         		    title: "Error!",
			         		    content: message,
			         		});
			         		A.one('#<portlet:namespace/>loading_gis').setHTML("<div class='alert alert-danger'>"+message+"</div>");
			         	}
	                
	          },
	          failure:function(){
	        	 A.one('#<portlet:namespace/>loading_gis').setHTML("<div class='alert alert-danger'>"+Liferay.Language.get('internal-server-error-contant-system-administrator')+"</div>");
	          }
	      }
	  });
	}
	
	});
}

function getMyLocation(){
	
	 var options = {
			  enableHighAccuracy: true,
			  timeout: 5000,
			  maximumAge: 0
			};

	function success(pos) {
		
		var crd = pos.coords;

		AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
		  A.one('#<portlet:namespace />organizationLatitude').set('value',crd.latitude);
          A.one('#<portlet:namespace />organizationLongitude').set('value',crd.longitude);
             
          A.one('#<portlet:namespace />orgLatitudeHidden').set('value',crd.latitude);
          A.one('#<portlet:namespace />orgLongitudeHidden').set('value',crd.longitude);
		});
		  
		getCensus(crd.latitude, crd.longitude);
        global_lat = parseFloat(crd.latitude);
        global_lng = parseFloat(crd.longitude);
        //updateMarkerPosition(global_lat, global_lng, '');
        
        //getCensus(crd.latitude, crd.longitude);
	  
	};

	function error(err) {
	  console.warn('ERROR(' + err.code + '): ' + err.message);
	};

	//navigator.geolocation.getCurrentPosition(success, error, options);
		
}

function getCensus(latitude, longitude){
	
	global_lat = latitude;
	global_lng = longitude;
	
	 AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
		 A.io.request('<portlet:resourceURL/>',{
	         dataType: 'json',
	         data:{'<portlet:namespace />latitude' : latitude,'<portlet:namespace />longitude' : longitude,'<portlet:namespace />cmd':"getCensus"},
	         method:'post',
	         on:{
	      	   success:function(){
	                 var data=this.get('responseData');
	                 
                	 if(data.LATITUDE && data.LONGITUDE){
                		 A.one('#<portlet:namespace />organizationLatitude').set('value',data.LATITUDE);
                		 A.one('#<portlet:namespace />orgLatitudeHidden').set('value',data.LATITUDE);
                		 A.one('#<portlet:namespace />organizationLongitude').set('value',data.LONGITUDE);
    	                 A.one('#<portlet:namespace />orgLongitudeHidden').set('value',data.LONGITUDE); 
                	 }
	                 
	                 var census = A.one('#<portlet:namespace />organizationCensus');
                	 if(census){
	                 	if(data.CENSUS){
	                		 A.one('#<portlet:namespace />organizationCensus').set('value',data.CENSUS);
	                         A.one('#<portlet:namespace />orgCensusHidden').set('value',data.CENSUS);	 
	                 	}else{
	                 		A.one('#<portlet:namespace />organizationCensus').set('value', '');
	                        A.one('#<portlet:namespace />orgCensusHidden').set('value', '');
	                 	}
                	 }
	                 var jpNameGIS = A.one('#<portlet:namespace />jpNameGIS');
		             if(jpNameGIS){
		            	 if(data.JIOPOINTNAME && data.JIOPOINTID){
		            			A.one('#<portlet:namespace />jpNameGIS').set('value',data.JIOPOINTNAME);
					      		A.one('#<portlet:namespace />jpName').set('value',data.JIOPOINTNAME);
				           	  	A.one('#<portlet:namespace />jpId').set('value',data.JIOPOINTID);
	                	 }else{
	                		A.one('#<portlet:namespace />jpNameGIS').set('value','');
					      	A.one('#<portlet:namespace />jpName').set('value', '');
				           	A.one('#<portlet:namespace />jpId').set('value', '');
	                	 }
		             }
		            
		             if(A.one('#<portlet:namespace />organizationCity')){
	                	   
	                	   if(data.CITYCODE && data.CITYNAME){
	                		   var options = '<option value="' +  data.CITYCODE + '">' +  data.CITYNAME.toUpperCase() + '</option>';
					           A.one('#<portlet:namespace />organizationCity').setHTML(options);
					           A.one('#<portlet:namespace />organizationCity').set('selectedIndex',0);
					           A.one("#<portlet:namespace />organizationCityText").set('value',data.CITYNAME.toUpperCase());
	                	   }else if(data.CENSUS && data.VILLAGENAME){
	                		   var options = '<option value="' +  data.CENSUS + '">' +  data.VILLAGENAME.toUpperCase() + '</option>';
					           A.one('#<portlet:namespace />organizationCity').setHTML(options);
					           A.one('#<portlet:namespace />organizationCity').set('selectedIndex',0);
					           A.one("#<portlet:namespace />organizationCityText").set('value',data.VILLAGENAME.toUpperCase());
	                	   }else{
	                		   var options = '<option value="">----Select City-------</option>';
					           A.one('#<portlet:namespace />organizationCity').setHTML(options);
					           A.one('#<portlet:namespace />organizationCity').set('selectedIndex',0);
					           A.one("#<portlet:namespace />organizationCityText").set('value', '');
	                	   }
							
			           }
		         	
		         	if(A.one('#<portlet:namespace />organizationState')){
		         		if(data.STATECODE && data.STATENAME){
		         			var options = '<option class="" value="' + data.STATECODE + '">' + data.STATENAME.toUpperCase() + '</option>';
			                A.one('#<portlet:namespace />organizationState').setHTML(options);
			                A.one('#<portlet:namespace />organizationState').set('selectedIndex',0);
		         		}else{
		         			var options = '<option class="" value="">----Select State-------</option>';
			                A.one('#<portlet:namespace />organizationState').setHTML(options);
			                A.one('#<portlet:namespace />organizationState').set('selectedIndex',0);
		         		}
						
		         	}
		         	
		         	if(A.one('#<portlet:namespace />organizationDistrict')){
		         		if(data.DISTRICTNAME){
		         			var options = '<option class="" value="' + data.DISTRICTNAME.toUpperCase() + '">' + data.DISTRICTNAME.toUpperCase() + '</option>';
			                A.one('#<portlet:namespace />organizationDistrict').setHTML(options);
			                A.one('#<portlet:namespace />organizationDistrict').set('selectedIndex', 0);
		         		}else{
		         			var options = '<option data-selected="true" value="">----Select District-------</option>';
		         			A.one('#<portlet:namespace />organizationDistrict').setHTML(options);
		         			A.one('#<portlet:namespace />organizationDistrict').set('selectedIndex',0);
		         		}
						
		         	}
		         	
		         	if(A.one('#<portlet:namespace />organizationLocality')){
		         		if(data.LOCALITYNAME){
		         			var locality = data.LOCALITYNAME + "|";
			         		if(data.SUBLOCALITY){
			         			locality = data.LOCALITYNAME + "|" + data.SUBLOCALITY;
			         		}
							var options = '<option class="" value="' + locality.toUpperCase() + '">' +  locality.toUpperCase() + '</option>';
			                A.one('#<portlet:namespace />organizationLocality').setHTML(options);
			                A.one('#<portlet:namespace />organizationLocality').set('selectedIndex', 0);
		         		}else{
		         			var options = '<option value="">----Select Locality-------</option>';
		         			options += '<option data-selected="true" value="NA">NOT APPLICABLE</option>';
		         			A.one('#<portlet:namespace />organizationLocality').setHTML(options);
		         			A.one('#<portlet:namespace />organizationLocality').set('selectedIndex',1);
		         		}
		         		
		         	}
		         	
		         	if(data.LATITUDE && data.LONGITUDE){
		         		updateMarkerPosition(global_lat, global_lng, data.PINCODE);
			         	
			         	var gisPincode = data.PINCODE;
			         	var pincode = A.one('#<portlet:namespace />organizationPincode').get("value");
			         	if(pincode!='' && pincode != gisPincode){
			         		alert("PIN Code obtained from GIS is "+gisPincode+", which is different from current PIN Code "+pincode+".")
			         	}
			         	if(gisPincode){
			         		A.one('#<portlet:namespace />organizationPincode').set('value', gisPincode);
			         	}
		         	}else{
		         		var message = Liferay.Language.get('internal-server-error-contant-system-administrator');
		         		alert(message);
		         		A.one('#<portlet:namespace/>loading_gis').setHTML("<div class='alert alert-danger'>"+message+"</div>");
		         	}
	                 
	           },
	           failure:function(){
	          	 console.log("failure at getCensus in address");
	           }
	       }
	  });
	});
}

function getStartDayEndDay(weeklyOffDay){
	AUI().use('aui-base','aui-io-request', 'aui-node', function(A){
	    A.io.request('<portlet:resourceURL/>',{
	           dataType: 'json',
	           data:{'<portlet:namespace />weeklyOffDay' : weeklyOffDay,'<portlet:namespace />cmd':"getStartDayEndDay"},
	           method:'post',
	           on:{
	        	   success:function(){
	                   var data=this.get('responseData');
	                   A.one('#<portlet:namespace />startDay').set('value',data.startDay);
	                   A.one('#<portlet:namespace />endDay').set('value',data.endDay);
	                   
	                   A.one('#<portlet:namespace />orgStartDay').set('value',data.startDay);
	                   A.one('#<portlet:namespace />orgEndDay').set('value',data.endDay);
	                   
	             },
	             failure:function(){
	             }
	         }
	     });
	});
}
 
function clearDistrict(){
	AUI().use('aui-base', 'aui-node', function(A){
		var options = '<option data-selected="true" value="">----Select District-------</option>';
		A.one('#<portlet:namespace />organizationDistrict').setHTML(options);
		A.one('#<portlet:namespace />organizationDistrict').set('selectedIndex',0);
	});
} 

function clearLocality(){
	AUI().use('aui-base', 'aui-node', function(A){
		var options = '<option data-selected="true" value="">----Select Locality-------</option>';
		options += '<option class="" value="NA">NOT APPLICABLE</option>';
		A.one('#<portlet:namespace />organizationLocality').setHTML(options);
		A.one('#<portlet:namespace />organizationLocality').set('selectedIndex',0);
	});
} 

function clearGeographic(){
	AUI().use('aui-base', 'aui-node', function(A){
		A.one('#<portlet:namespace />organizationLatitude').set('value','');
		A.one('#<portlet:namespace />orgLatitudeHidden').set('value','');
		A.one('#<portlet:namespace />organizationLongitude').set('value','');
        A.one('#<portlet:namespace />orgLongitudeHidden').set('value',''); 
        
        var census = A.one('#<portlet:namespace />organizationCensus');
	   	if(census){
	   		A.one('#<portlet:namespace />organizationCensus').set('value', '');
            A.one('#<portlet:namespace />orgCensusHidden').set('value', '');
	   	}
        var jpNameGIS = A.one('#<portlet:namespace />jpNameGIS');
        if(jpNameGIS){
        	A.one('#<portlet:namespace />jpNameGIS').set('value', '');
	      	A.one('#<portlet:namespace />jpName').set('value', '');
           	A.one('#<portlet:namespace />jpId').set('value', '');
        }
        
	});
}
</script>
 
 
<!-- // Feature#459561 -->
<script src="<%=request.getContextPath()%>/js/google.map.js" type="text/javascript"></script>
<script async defer
  src="https://maps.googleapis.com/maps/api/js?client=<%= JioPropsValues.GOOGLE_MAP_API_KEY %>&v=3.exp&callback=initMap"></script>
<!-- // Feature#459561 -->


</c:if>
