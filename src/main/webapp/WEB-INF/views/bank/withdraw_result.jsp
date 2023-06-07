<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>출금이체 결과</h1>
	<table border="1">
		<tr>
			<th>요청일시</th>
			<th>출금계좌번호</th>
			<th>예금주명</th>
			<th>출금금액</th>
			<th>출금가능금액</th>
			<th></th>
		</tr>
		<tr>
			<td>${result.api_tran_dtm }</td>
			<td>${result.account_num_masked }</td>
			<td>${result.account_holder_name }</td>
			<td>${result.tran_amt } 원</td>
			<td>${result.wd_limit_remain_amt } 원</td>
			<td>
			
			</td>
		</tr>
	</table>
</body>
</html>















