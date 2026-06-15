<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Étudiant</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; font-weight: bold; }
        input[type="text"], input[type="email"] { width: 300px; padding: 8px; }
        .btn { padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; display: inline-block; }
        .btn-submit { background-color: #4CAF50; color: white; }
        .btn-cancel { background-color: #f44336; color: white; }
        .error { color: red; margin-bottom: 15px; }
    </style>
</head>
<body>
    <h1>➕ Ajouter un Étudiant</h1>
    
    <c:if test="${not empty error}">
        <div class="error">⚠️ ${error}</div>
    </c:if>
    
    <form action="${pageContext.request.contextPath}/add-student" method="post">
        <div class="form-group">
            <label for="firstName">Prénom:</label>
            <input type="text" id="firstName" name="firstName" required>
        </div>
        <div class="form-group">
            <label for="lastName">Nom:</label>
            <input type="text" id="lastName" name="lastName" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-submit">💾 Enregistrer</button>
            <a href="${pageContext.request.contextPath}/students" class="btn btn-cancel">❌ Annuler</a>
        </div>
    </form>
</body>
</html>