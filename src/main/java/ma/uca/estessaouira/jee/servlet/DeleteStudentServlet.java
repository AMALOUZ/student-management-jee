package ma.uca.estessaouira.jee.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.uca.estessaouira.jee.dao.StudentDAO;
import ma.uca.estessaouira.jee.dao.StudentDAOImpl;

import java.io.IOException;

@WebServlet("/delete-student")
public class DeleteStudentServlet extends HttpServlet {
    
    private StudentDAO studentDAO = new StudentDAOImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                studentDAO.delete(id);
            } catch (NumberFormatException e) {
                // ignore
            }
        }
        response.sendRedirect(request.getContextPath() + "/students");
    }
}