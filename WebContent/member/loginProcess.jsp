<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// post 파라미터값 한글처리
request.setCharacterEncoding("utf-8");
// 폼 id passwd 파라미터값 가져오기
String id = request.getParameter("id");
String passwd= request.getParameter("passwd"); 
// DB접속정보
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "scott";
String password = "tiger";
// 1단계: DB 드라이버 로딩
Class.forName("oracle.jdbc.OracleDriver");
// 2단계: DB 연결
Connection con = DriverManager.getConnection(url, user, password);
// 3단계: sql문 준비해서 실행
String sql = "SELECT * FROM member WHERE id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
// 4단계: sql문 실행
ResultSet rs = pstmt.executeQuery();
// 5단계: rs 데이터 사용
//    rs데이터(행)이 있으면 아이디 있음
//                     패스워드 비교 맞으면 로그인인증(세션)
//                               틀리면 패스워드틀림. 뒤로가기
//                 없으면 아이디 없음. 뒤로가기
if (rs.next()) {
    if (passwd.equals(rs.getString("passwd"))) {
        // 로그인 인증
        session.setAttribute("id", rs.getString("id"));
        session.setAttribute("name", rs.getString("name"));
        response.sendRedirect("../main/main.jsp");
    } else {
        %>
        <script>
        alert('패스워드가 다릅니다.');
        history.back(); // location.href = 'loginForm.jsp'
        </script>
        <%
    }
} else {
    %>
    <script>
    alert('없는 아이디 입니다.');
    history.back(); // location.href = 'loginForm.jsp'
    </script>
    <%
}
%>