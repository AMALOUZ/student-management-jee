package ma.uca.estessaouira.jee.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.uca.estessaouira.jee.model.Student;
import ma.uca.estessaouira.jee.dao.StudentDAO;
import ma.uca.estessaouira.jee.dao.StudentDAOImpl;

import java.io.IOException;

@WebServlet("/add-student")
public class AddStudentServlet extends HttpServlet {
    
    private StudentDAO studentDAO = new StudentDAOImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/add-student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        if (firstName == null || firstName.trim().isEmpty()
                || lastName == null || lastName.trim().isEmpty()
                || email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Tous les champs sont obligatoires.");
            request.getRequestDispatcher("/views/add-student.jsp").forward(request, response);
            return;
        }

        Student student = new Student();
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setEmail(email);
        
        studentDAO.save(student);
        response.sendRedirect(request.getContextPath() + "/students");
    }
}