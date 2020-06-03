package com.tognyp.springsecurity.demo.user;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.tognyp.springsecurity.demo.validation.FieldMatch;
import com.tognyp.springsecurity.demo.validation.ValidEmail;

/**
* Class use to validate and process form received from view
* 
*
* 
* @version 1.0
* @since   2020-06-03
*/

@FieldMatch.List({
    @FieldMatch(first = "password", second = "matchingPassword", message = "The password fields must match")
})
public class QuestUser {

		@NotNull(message="is required")
		@Size(min = 1, message="is required")
		private String userName;
		
		@NotNull(message="is required")
		@Size(min = 1, message="is required")
		private String password;
		
		@NotNull(message="is required")
		@Size(min = 1, message="is required")
		private String matchingPassword;
		
		@NotNull(message="is required")
		@Size(min = 1, message="is required")
		private String firstName;
		
		@NotNull(message="is required")
		@Size(min = 1, message="is required")
		private String lastName;
		
		@ValidEmail
		@NotNull(message="is required")
		@Size(min = 1, message="is required")
		private String email;
		
		public QuestUser() {
			
		}
		
		public String getMatchingPassword() {
			return matchingPassword;
		}

		public void setMatchingPassword(String matchingPassword) {
			this.matchingPassword = matchingPassword;
		}

		public String getLastName() {
			return lastName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getMatchinPassword() {
			return matchingPassword;
		}

		public void setMatchinPassword(String matchinPassword) {
			this.matchingPassword = matchinPassword;
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		
		
}
