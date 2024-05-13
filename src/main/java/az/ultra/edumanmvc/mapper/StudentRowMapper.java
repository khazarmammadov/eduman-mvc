package az.ultra.edumanmvc.mapper;

import az.ultra.edumanmvc.model.response.StudentListResponseModel;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentRowMapper implements RowMapper<StudentListResponseModel> {
    @Override
    public StudentListResponseModel mapRow(ResultSet rs, int rowNum) throws SQLException {
        StudentListResponseModel studentListResponseModel = new StudentListResponseModel();

        studentListResponseModel.setId(rs.getLong("id"));
        studentListResponseModel.setName(rs.getString("name"));
        studentListResponseModel.setSurname(rs.getString("surname"));
        studentListResponseModel.setMiddleName(rs.getString("middle_name"));

        return studentListResponseModel;
    }
}
