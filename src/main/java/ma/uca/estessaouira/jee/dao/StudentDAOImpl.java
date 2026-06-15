package ma.uca.estessaouira.jee.dao;

import ma.uca.estessaouira.jee.model.Student;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class StudentDAOImpl implements StudentDAO {
    
    private static List<Student> students = new ArrayList<>();
    private static AtomicInteger nextId = new AtomicInteger(1);
    
    static {
        // Données de test
        students.add(new Student(nextId.getAndIncrement(), "Ahmed", "Alami", "ahmed@email.com"));
        students.add(new Student(nextId.getAndIncrement(), "Fatima", "Benali", "fatima@email.com"));
    }
    
    @Override
    public List<Student> findAll() {
        return new ArrayList<>(students);
    }
    
    @Override
    public Student findById(int id) {
        return students.stream()
                .filter(s -> s.getId() == id)
                .findFirst()
                .orElse(null);
    }
    
    @Override
    public void save(Student student) {
        student.setId(nextId.getAndIncrement());
        students.add(student);
    }
    
    @Override
    public void update(Student student) {
        for (int i = 0; i < students.size(); i++) {
            if (students.get(i).getId() == student.getId()) {
                students.set(i, student);
                break;
            }
        }
    }
    
    @Override
    public void delete(int id) {
        students.removeIf(s -> s.getId() == id);
    }
}