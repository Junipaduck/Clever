<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 상태메세지(msg 속성) 출력 후 지정 된 페이지(target)로 돌아가기 - 자바스크립트 --%>
<script type="text/javascript">
	alert("${msg}");
	let findId = confirm("${msg2}");
	if(findId){
	location.href = "${target}";
	} else {
	location.href = "${target2}";
	}
</script>