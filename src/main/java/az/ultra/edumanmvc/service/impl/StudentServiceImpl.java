package az.ultra.edumanmvc.service.impl;


import az.ultra.edumanmvc.model.request.StudentListRequestModel;
import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import az.ultra.edumanmvc.model.response.StudentInfoResponseModel;
import az.ultra.edumanmvc.model.response.StudentListResponseModel;
import az.ultra.edumanmvc.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import static az.ultra.edumanmvc.enums.SqlStatements.*;


@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService {

    private final JdbcTemplate jdbcTemplate;


    @Override
    public List<StudentListResponseModel> getStudentsList() {
        String sql = GET_STUDENT_LIST.getQuery();
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(StudentListResponseModel.class));
    }

    @Override
    public List<StudentInfoResponseModel> getStudentsInfo() {
        String sql = STUDENT_INFO_QUERY.getQuery();
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(StudentInfoResponseModel.class));
    }

    @Override
    public void updateStudent(StudentListRequestModel student) {
        String sql = UPDATE_STUDENT_LIST.getQuery();
        jdbcTemplate.update(sql, student.getName(), student.getSurname(), student.getMiddleName(), student.getId());
    }

    @Override
    public StudentListResponseModel getStudentById(Long id) {
        String sql = GET_STUDENT_BY_ID.getQuery();
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(StudentListResponseModel.class));
    }

    @Override
    public void deleteStudent(Long id) {
        String sql = DELETE_STUDENT_BY_ID.getQuery();
        jdbcTemplate.update(sql, id);
    }

    @Override
    public void saveStudent(StudentSaveRequestModel requestModel) {
        String sql = SAVE_STUDENT.getQuery();

        //     DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");


        jdbcTemplate.update(sql,
                requestModel.getId(),
                requestModel.getName(),
                requestModel.getSurname(),
                requestModel.getMiddleName(),
                requestModel.getSex(),
         //       requestModel.getBirthdate().atStartOfDay().format(inputFormatter),
                requestModel.getCom_person_uniq_id()
        );
    }


}
