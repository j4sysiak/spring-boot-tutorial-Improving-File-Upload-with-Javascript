<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:url var="profilePhoto" value="/profilephoto" />
<c:url var="editProfileAbout" value="/edit-profile-about" />

<div class="row">

	<div class="col-md-10 col-md-offset-1">

		<div class="profile-about">

			<div class="profile-image">
				<div>
					<img src="${profilePhoto}" />
				</div>
				
				<div class="text-center">
					<a href="#" id="uploadLink">Upload photo</a>
				</div>
			</div>

			<div class="profile-text">
				<c:choose>
					<c:when test="${profile.about == null}">
						Click 'edit' to add information about yourself to your profile
					</c:when>
						<c:otherwise>
							${profile.about}
						</c:otherwise>
				</c:choose>
			</div>

		</div>

		<div class="profile-about-edit">
			<a href="${editProfileAbout}">edit</a>
		</div>
		
		
		<p>&nbsp;</p>
		<c:url value="/upload-profile-photo" var="uploadPhotoLink" />
		<form method="post" enctype="multipart/form-data" id="photoUploadForm" action="${uploadPhotoLink}">
			
			select photo: <input type="file" accept="image/*" name="file" id="photoFileInput" />
			<input type="submit" value="upload" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		</form>

	</div>
</div>



<script>

function uploadPhoto(event) {
	
	console.log("Form being submitted");
	//alert("Hello4");
	event.preventDefault();
}

$(document).ready(function() {
	console.log("Document loaded.");
	//alert("Hello1");
	
	$("#uploadLink").click(
							function(event) {
								//alert("Hello2");
								event.preventDefault();
								$("#photoFileInput").trigger('click');
							}
						  );
	
	$("#photoFileInput").change(
							function() {
								//alert("Hello3");
								$("#photoUploadForm").submit();
							}
						  );
	
	$("#photoUploadForm").on("submit", uploadPhoto);
	
});

</script>







































