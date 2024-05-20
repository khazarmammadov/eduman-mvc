package az.ultra.edumanmvc.service.impl;


import az.ultra.edumanmvc.model.request.StudentListRequestModel;
import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import az.ultra.edumanmvc.model.response.PersonListResponseModel;
import az.ultra.edumanmvc.model.response.StudentInfoResponseModel;
import az.ultra.edumanmvc.model.response.StudentListResponseModel;
import az.ultra.edumanmvc.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

import static az.ultra.edumanmvc.enums.SqlStatements.*;


@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService {

    private final JdbcTemplate jdbcTemplate;


    @Override
    public List<StudentListResponseModel> getStudentsList(Integer start, Integer length, String search) {
        String sql = GET_STUDENT_LIST.getQuery();
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(StudentListResponseModel.class),
                search, start, length + start);
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

    @Override
    public List<PersonListResponseModel> getPersonsList() {
        String sql  = GET_PERSON_LIST.getQuery();

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(PersonListResponseModel.class));
    }

    @Override
    public List<PersonListResponseModel> getStudentPersonList() {
        String sql  = GET_STUDENTS.getQuery();

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(PersonListResponseModel.class));
    }

    @Override
    public List<StudentListResponseModel> searchStudentList(String str) {
        String sql = SEARCH_QUERY.getQuery();
        String searchTerm = "'%" + str.toLowerCase() + "%'";
        return jdbcTemplate.query(sql.concat(searchTerm) , new BeanPropertyRowMapper<>(StudentListResponseModel.class));
    }

    @Override
    public Long countOfStudents(String search) {
        return jdbcTemplate.queryForObject("select count(*) from EDUMAN_COMMON.TEST_PERSONS_KHAZAR where name like '%' || ? || '%'",
                Long.class, search);
    }


}
