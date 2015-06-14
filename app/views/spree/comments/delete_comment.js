if("<%= @chk%>"=='true'){
	$("#comment-<%= @comment.id%>").remove();
}
else{
	''
}