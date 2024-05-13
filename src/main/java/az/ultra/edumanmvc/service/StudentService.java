package az.ultra.edumanmvc.service;


import az.ultra.edumanmvc.model.request.StudentListRequestModel;
import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import az.ultra.edumanmvc.model.response.StudentInfoResponseModel;
import az.ultra.edumanmvc.model.response.StudentListResponseModel;

import java.util.List;

public interface StudentService {

     List<StudentListResponseModel> getStudentsList();

     List<StudentInfoResponseModel> getStudentsInfo();

     void updateStudent(StudentListRequestModel student);

     StudentListResponseModel getStudentById(Long id);

     void deleteStudent(Long id);

     void saveStudent(StudentSaveRequestModel requestModel);
}
