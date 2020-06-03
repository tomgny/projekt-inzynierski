package com.tognyp.springsecurity.demo.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
* Validate email input fields
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

public class EmailValidator implements ConstraintValidator<ValidEmail, String>{

	private Pattern pattern;
	private Matcher matcher;
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    /**
    * Validate matching fields
    * 
    *
    * @return Return true if value of email string matches to pattern, otherwise false.
    * @version 1.0
    * @since   2020-06-03
    */
	
	@Override
	public boolean isValid(final String email, final ConstraintValidatorContext context) {
		pattern = Pattern.compile(EMAIL_PATTERN);
		if (email == null) {
			return false;
		}
		matcher = pattern.matcher(email);
		return matcher.matches();
	}
	
}
