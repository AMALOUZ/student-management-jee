package ma.uca.estessaouira.jee.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.uca.estessaouira.jee.dao.StudentDAO;
import ma.uca.estessaouira.jee.dao.StudentDAOImpl;

import java.io.IOException;

@WebServlet("/students")
public class StudentListServlet extends HttpServlet {
    
    private StudentDAO studentDAO = new StudentDAOImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("students", studentDAO.findAll());
        request.getRequestDispatcher("/views/students.jsp").forward(request, response);
    }
}