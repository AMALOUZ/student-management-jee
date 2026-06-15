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

@WebServlet("/edit-student")
public class EditStudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAOImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                Student student = studentDAO.findById(id);
                if (student != null) {
                    request.setAttribute("student", student);
                    request.getRequestDispatcher("/views/edit-student.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/students");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String idParam = request.getParameter("id");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        if (idParam == null || firstName == null || firstName.trim().isEmpty()
                || lastName == null || lastName.trim().isEmpty()
                || email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Tous les champs sont obligatoires.");
            doGet(request, response);
            return;
        }

        try {
            Student student = new Student();
            student.setId(Integer.parseInt(idParam));
            student.setFirstName(firstName);
            student.setLastName(lastName);
            student.setEmail(email);
            studentDAO.update(student);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/students");
    }
}
