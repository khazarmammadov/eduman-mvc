package az.ultra.edumanmvc.repository;

import az.ultra.edumanmvc.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {

}
