package com.tognyp.springsecurity.demo.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.BeanWrapperImpl;

/**
* Validate matching fields
* 
*
*
* @version 1.0
* @since   2020-06-03
*/

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {
	
	private String firstFieldName;
    private String secondFieldName;
    private String message;

    @Override
    public void initialize(final FieldMatch constraintAnnotation) {
	    	firstFieldName = constraintAnnotation.first();
	    	secondFieldName = constraintAnnotation.second();
        message = constraintAnnotation.message();
    }
    
    /**
    * Validate matching fields
    * 
    *
    * @return Return true if value of both fields equals, otherwise false.
    * @version 1.0
    * @since   2020-06-03
    */

    @Override
    public boolean isValid(final Object value, final ConstraintValidatorContext context) {
        boolean valid = true;
        try
        {
            final Object firstObj = new BeanWrapperImpl(value).getPropertyValue(firstFieldName);
            final Object secondObj = new BeanWrapperImpl(value).getPropertyValue(secondFieldName);

            valid =  firstObj == null && secondObj == null || firstObj != null && firstObj.equals(secondObj);
        }
        catch (final Exception ignore)
        {
            // we can ignore
        }

        if (!valid){
            context.buildConstraintViolationWithTemplate(message)
                    .addPropertyNode(firstFieldName)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        }

        return valid;
    }
}
