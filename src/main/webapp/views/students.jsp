<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Étudiants</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .btn { padding: 8px 16px; text-decoration: none; color: white; border-radius: 4px; display: inline-block; margin: 2px; }
        .btn-add { background-color: #4CAF50; }
        .btn-edit { background-color: #2196F3; }
        .btn-delete { background-color: #f44336; }
        .btn-home { background-color: #ff9800; }
    </style>
</head>
<body>
    <h1>📋 Liste des Étudiants</h1>
    
    <a href="${pageContext.request.contextPath}/add-student" class="btn btn-add">➕ Ajouter</a>
    <a href="${pageContext.request.contextPath}/" class="btn btn-home">🏠 Accueil</a>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Prénom</th>
            <th>Nom</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.firstName}</td>
            <td>${student.lastName}</td>
            <td>${student.email}</td>
            <td>
                <a href="${pageContext.request.contextPath}/edit-student?id=${student.id}" class="btn btn-edit">✏️ Modifier</a>
                <a href="${pageContext.request.contextPath}/delete-student?id=${student.id}" 
                   class="btn btn-delete" 
                   onclick="return confirm('Supprimer cet étudiant ?')">🗑️ Supprimer</a>
            </td>
        </tr>
        </c:forEach>
        <c:if test="${empty students}">
        <tr>
            <td colspan="5" style="text-align:center;">Aucun étudiant trouvé</td>
        </tr>
        </c:if>
    </table>
</body>
</html>