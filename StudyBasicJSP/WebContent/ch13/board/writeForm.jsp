<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf"%>
<%-- <%
	String ctx = request.getContextPath();	//콘텍스트명 얻어오기.
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="../etc/style_writeForm.css" rel="stylesheet" type="text/css">
<!-- <script type="text/javascript" src="../etc/script.js"></script> -->
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1",
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "../SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});



</script>
</head>
<body bgcolor="<%=bodyback_c%>">
	<%
		int num = 0, ref = 1, re_step = 0, re_level = 0;
		String strV = "";

		try {
			
			if (request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
				ref = Integer.parseInt(request.getParameter("ref"));
				re_step = Integer.parseInt(request.getParameter("re_step"));
				re_level = Integer.parseInt(request.getParameter("re_level"));
			}
	%>
	<p>글쓰기</p>
	<form method="post" name="writeform" action="writePro.jsp"
		onsubmit="return writeSave()"> <!-- default = true -->
		<input type="hidden" name="num" value="<%=num%>"> 
		<input type="hidden" name="ref" value="<%=ref%>"> 
		<input type="hidden" name="re_step" value="<%=re_step%>"> 
		<input type="hidden" name="re_level" value="<%=re_level%>">

		<table>
			<tr>
				<td align="right" width="730" colspan="2" bgcolor="<%=value_c%>">
				<a href="list.jsp"> 글목록</a>
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">이름</td>
				<td align="left"><input type="text" size="10"
					maxlength="10" name="writer" style="ime-mode: active;"></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">제목</td>
				<td align="left">
					<%
						if (request.getParameter("num") == null)
							strV = "";
						else
							strV = "[답변]";
					%> 
					<input type="text" size="40" maxlength="50" name="subject"
					value="<%=strV%>" style="ime-mode: active;">
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
				<td  align="left"><input type="text" size="40"
					maxlength="30" name="email" style="ime-mode: inactive;"></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">내용</td>
				<td  align="left">
				<textarea name="content" rows="13"cols="40" id="ir1" style="width:650px; height:350px;" ></textarea>
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
				<td  align="left"><input type="password" size="8"
					maxlength="12" name="passwd" style="ime-mode: inactive;"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="<%=value_c%>" align="center">
				<input type="submit" id="save" value="글쓰기"> 
				<input type="reset" value="다시 작성"> <input type="button" value="목록보기"
					onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
		<%
}catch(Exception e) {}
%>
	</form>
</body>
</html>