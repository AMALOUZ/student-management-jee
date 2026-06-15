<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un Étudiant</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; color: white; }
        .container { background: rgba(255,255,255,0.1); padding: 40px; border-radius: 20px; max-width: 500px; margin: 0 auto; }
        h1 { text-align: center; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input[type="text"], input[type="email"] { width: 100%; padding: 12px; border: none; border-radius: 8px; font-size: 16px; }
        .btn { padding: 12px 30px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; text-decoration: none; display: inline-block; margin: 5px; }
        .btn-submit { background: #2196F3; color: white; }
        .btn-cancel { background: #f44336; color: white; }
        .error { color: #ffcc00; margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>✏️ Modifier un Étudiant</h1>
        
        <c:if test="${not empty error}">
            <div class="error">⚠️ ${error}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/edit-student" method="post">
            <input type="hidden" name="id" value="${student.id}">
            <div class="form-group">
                <label for="firstName">Prénom:</label>
                <input type="text" id="firstName" name="firstName" value="${student.firstName}" required>
            </div>
            <div class="form-group">
                <label for="lastName">Nom:</label>
                <input type="text" id="lastName" name="lastName" value="${student.lastName}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${student.email}" required>
            </div>
            <div class="form-group" style="text-align: center;">
                <button type="submit" class="btn btn-submit">💾 Mettre à jour</button>
                <a href="${pageContext.request.contextPath}/students" class="btn btn-cancel">❌ Annuler</a>
            </div>
        </form>
    </div>
</body>
</html>