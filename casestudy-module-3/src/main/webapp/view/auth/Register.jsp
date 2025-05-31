<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <title>Đăng ký</title>
</head>
<body class="bg-light">
<div class="container py-5">
  <div class="card mx-auto" style="max-width: 500px;">
    <div class="card-body">
      <h4 class="card-title mb-4">Đăng ký tài khoản</h4>

      <%-- Error Message --%>
      <c:if test="${not empty requestScope.errorMessage}">
        <div class="alert alert-danger">${requestScope.errorMessage}</div>
      </c:if>

      <form action="register" method="post">
        <c:forEach var="field" items="${['username','password','repass','phone','email','address']}">
          <div class="mb-3">
            <label class="form-label text-capitalize">
              <c:choose>
                <c:when test="${field == 'repass'}">Nhập lại mật khẩu</c:when>
                <c:when test="${field == 'phone'}">Số điện thoại</c:when>
                <c:when test="${field == 'email'}">Địa chỉ email</c:when>
                <c:when test="${field == 'address'}">Địa chỉ</c:when>
                <c:otherwise>${field}</c:otherwise>
              </c:choose>
            </label>
            <input
                    type="${field.contains('pass') ? 'password' : (field=='email'?'email':'text')}"
                    name="${field}"
                    class="form-control ${not empty requestScope['err_'.concat(field)] ? 'is-invalid' : ''}"
                    value="${param[field]}"
                    required
            />
            <!-- Hiển thị lỗi -->
            <c:if test="${not empty requestScope['err_'.concat(field)]}">
              <div class="invalid-feedback">${requestScope['err_'.concat(field)]}</div>
            </c:if>
          </div>
        </c:forEach>
        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
      </form>
      <div class="text-center mt-3">
        <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/views/login.jsp">Đăng nhập</a></p>
      </div>
    </div>
  </div>
</div>
</body>
</html>