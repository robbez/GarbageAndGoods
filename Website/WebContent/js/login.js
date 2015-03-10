$(document).ready(function() {
	$("#loginForm").validate({
		rules : {
			userame : {
				required : true
			},
			
			password: {
				required : true
			}
		},
		
		messages:{
			userame : {
				required : ""
			}, 
			
			password : {
				required : ""
			}, 
			
		},
		
		focusInvalid: false,
		
		invalidHandler: function(event, validator) {
			
			var errors = validator.numberOfInvalids();
			
			if(errors){
				if($("#username").val() == "" ) {
					$(".form-group span").eq(0).addClass("validateError")
				}
				
				if($("#password").val() == "" ) {
					$(".form-group span").eq(1).addClass("validateError")
				}
				
			} else {
				$(".form-group span").removeClass("validateError")
			}
			
		},
		
		submitHandler: function(form) {
		    form.submit();
		 }
	});
	
	
	$("#username").focus(function() {
		$(".form-group span").eq(0).removeClass("validateError")
	});
	
	$("#password").focus(function() {
		$(".form-group span").eq(1).removeClass("validateError")
	});
	
	$("#signUpBtn").click(function() {
		location.href = "SignUpForm.jsp";
	});

});