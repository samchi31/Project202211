<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>후원 내역</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/ONProject/css/funding.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

</script>
</head>
<body>
    <div class="container">
        <h2 class="f_title">후원 내역 등록
        	<p>RegistFunding</p>
        </h2>
       <div class="row">
			<form action="Insert.do" method="post" enctype="multipart/form-data">
				<table class="col-sm-8">
					<tr>
						<td>후원코드</td>
						<td><input class="form-control" type="text" name="fundingId" value="" /></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input class="form-control type="text" name="memId" value="" /></td>
					</tr>
					<tr>
						<td>후원타이틀:</td>
						<td><input class="form-control" type="text" name="fundingTitle" value=""></td>
					</tr>
					<tr>
						<td>목표금액:</td>
						<td><input class="form-control type="text" name="targetAmount" value=""></td>
					</tr>
					<tr>
						<td>현재금액:</td>
						<td><input class="form-control" type="text" name="recentAmount" value="0"></td>
					</tr>
					<tr>
						<td>시작날짜:</td>
						<td><input class="form-control" type="date" class="form-control" id="fundingStartDate" name="fundingStartDate" required></td>
					</tr>
					<tr>
						<td>마감날짜:</td>
                        <td><input class="form-control" type="date" class="form-control" id="fundingEndDate" name="fundingEndDate" required></td>
					</tr>
					<tr>
						<td>계좌번호:</td>
						<td><input class="form-control" type="text" name="fundingAccount" value=""></td>
					</tr>
					<tr>
						<td>예금주:</td>
						<td><input class="form-control" type="text" name="fundingAccountHolder" value=""></td>
					</tr>
					<tr>
						<td>은행명:</td>
						<td><input class="form-control" type="text" name="fundingBankName" value=""></td>
					</tr>
					<tr>
						<td>상세설명:</td>
						<td><input class="form-control" type="text" name="fundingDetail" value=""></td>
					</tr>
					<tr>
						<td>썸네일:</td>
						<td><input type="file" name="atchFile" multiple/></td>
					</tr>
				</table>
				<input class="btn btn-info" type="submit" value="후원 등록">
			</form>
		</div>
     	<a href="<%=request.getContextPath() %>/funding/List.do" class="btn btn-success" style="float:right;">목록</a>
		<!-- 글 내용 수정 -->
    </div>
		
 <script>
 
 </script>
</body>
</html>