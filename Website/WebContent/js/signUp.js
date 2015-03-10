$(document)
		.ready(
				function() {

					$("#signupBtn")
							.click(
									function(event) {
										// alert("Handler for .submit()
										// called.");
										$(".has-feedback")
												.find("input")
												.each(
														function(index) {

															var inputString = $(
																	this).val();
															var inputLength = inputString.length;

															if (inputString == "") {
																showError(
																		$(this),
																		"The field shouldn't be empty");
															} else {
																var elemId = $(
																		this)
																		.attr(
																				'id');
																switch (elemId) {
																case "inputEmail":
																	if (!IsEmail(inputString)) {
																		showError(
																				$(this),
																				"Not a valid email");
																		event
																				.preventDefault();
																	}
																	break;
																case "inputName":
																	if (inputLength < 5) {
																		showError(
																				$(this),
																				"Name should be at least 5 characters");
																		event
																				.preventDefault();
																	}
																	break;
																case "txt_year":
																	var month = $(
																			"#txt_month")
																			.val();
																	var day = $(
																			"#txt_day")
																			.val();
																	if (!isDate(month
																			+ "/"
																			+ day
																			+ "/"
																			+ inputString)) {
																		showError(
																				$(this),
																				"Not a valid date");
																		event
																				.preventDefault();
																	}

																	break;
																case "userName":
																	if (inputLength < 4) {
																		showError(
																				$(this),
																				"Username should be at least 4 characters");
																		event
																				.preventDefault();
																	}
																	break;

																case "password":
																	if (inputLength < 4) {
																		showError(
																				$(this),
																				"Password is too short");
																		event
																				.preventDefault();
																	}
																	break;
																	
																case "confirmpassword":
																	if (inputString != $("#password").val()) {
																		showError(
																				$(this),
																				"Password doesn't match");
																		event
																				.preventDefault();
																	}
																	break;
																default:
																	// $(this).closest(".has-feedback").children(".error-msg").css("display","none");

																	break;
																}
															}
														});
									});

					$(".has-feedback").find("input").click(function(index) {
						var parent = $(this).closest(".has-feedback")
						parent.removeClass("has-error");
						$(this).next().css("visibility", "hidden");
						parent.children(".error-msg").css("display", "none");
						parent.next("p").css("display", "block");
					});

					$(".has-feedback").find("input").blur(function(index) {
						var parent = $(this).closest(".has-feedback")
						parent.removeClass("has-error");
						$(this).next().css("visibility", "hidden");
						parent.children(".error-msg").css("display", "none");
						parent.next("p").css("display", "block");
					});

				});

function showError(element, message) {
	var parent = element.closest(".has-feedback");
	parent.addClass("has-error");
	element.next().css("visibility", "visible");
	parent.children(".error-msg").css("display", "block");
	parent.children(".error-msg").html(message);
	parent.siblings("p").css("display", "none");
}

function IsEmail(email) {
	var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	return regex.test(email);
}

function isDate(txtDate)

{

	var mills = new Date(txtDate);

	console.log(Date.now());
	console.log(mills.getTime());

	if (isNaN(mills)) {
		return false;
	} else if (Date.now() - mills < 0) {
		return false;
	} else if (Date.now() - mills < 410240038000) {
		return false;
	}

	var currVal = txtDate;

	if (currVal == '')

		return false;

	// Declare Regex

	var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;

	var dtArray = currVal.match(rxDatePattern); // is format OK?

	if (dtArray == null)

		return false;

	// Checks for mm/dd/yyyy format.

	dtMonth = dtArray[1];

	dtDay = dtArray[3];

	dtYear = dtArray[5];

	console.log(dtMonth + "/" + dtDay + "/" + dtYear);

	if (dtMonth < 1 || dtMonth > 12)

		return false;

	else if (dtDay < 1 || dtDay > 31)

		return false;

	else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11)
			&& dtDay == 31) {

		return false;
	}

	else if (dtMonth == 2)

	{
		var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));

		if (dtDay > 29 || (dtDay == 29 && !isleap))

			return false;

	}

	var currDate = new Date();

	var diffYear = currDate.getFullYear() - dtYear;

	if (diffYear > 100 || diffYear < 13) {
		return false;
	}

	return true;
}
