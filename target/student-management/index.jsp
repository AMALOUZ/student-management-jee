<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management App</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            margin-top: 100px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            min-height: 100vh;
        }
        .container { 
            background: rgba(255,255,255,0.1); 
            padding: 50px; 
            border-radius: 20px;
            display: inline-block;
        }
        h1 { font-size: 3em; margin-bottom: 20px; }
        .btn { 
            display: inline-block; 
            padding: 15px 40px; 
            margin: 10px;
            background: white; 
            color: #667eea; 
            text-decoration: none;
            border-radius: 30px;
            font-weight: bold;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎓 Student Management</h1>
        <p>Mini application JEE - Servlet + JSP + JSTL + JDBC + MySQL</p>
        <a href="${pageContext.request.contextPath}/students" class="btn">📋 Voir les étudiants</a>
        <a href="${pageContext.request.contextPath}/add-student" class="btn">➕ Ajouter un étudiant</a>
    </div>
</body>
</html>