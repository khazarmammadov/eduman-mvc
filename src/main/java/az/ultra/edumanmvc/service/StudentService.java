package az.ultra.edumanmvc.service;


import az.ultra.edumanmvc.model.request.StudentListRequestModel;
import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import az.ultra.edumanmvc.model.response.PersonListResponseModel;
import az.ultra.edumanmvc.model.response.StudentInfoResponseModel;
import az.ultra.edumanmvc.model.response.StudentListResponseModel;

import java.util.List;

public interface StudentService {

     List<StudentListResponseModel> getStudentsList(Integer start, Integer length, String search);

     List<StudentInfoResponseModel> getStudentsInfo();

     void updateStudent(StudentListRequestModel student);

     StudentListResponseModel getStudentById(Long id);

     void deleteStudent(Long id);

     void saveStudent(StudentSaveRequestModel requestModel);

     List<PersonListResponseModel> getPersonsList();

     List<PersonListResponseModel> getStudentPersonList();

     List<StudentListResponseModel> searchStudentList(String str);

     Long countOfStudents(String search);

     void insertStudent(StudentSaveRequestModel requestModel);
}
