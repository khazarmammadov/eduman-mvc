package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.model.request.StudentListRequestModel;
import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import az.ultra.edumanmvc.model.response.StudentInfoResponseModel;
import az.ultra.edumanmvc.model.response.StudentListResponseModel;
import az.ultra.edumanmvc.service.StudentService;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequiredArgsConstructor
public class StudentController {

    private final StudentService studentService;

    @RequestMapping(value = {"/info"},method = GET)
    public String getStudentsInfo(Model theModel) {
        List<StudentInfoResponseModel> studentsInfo = studentService.getStudentsInfo();
        theModel.addAttribute("studentsInfo", studentsInfo);

        return "students-info";
    }

    @RequestMapping(value = {"/api/list"},method = GET)
    public String getStudentsList(Model theModel) {
        List<StudentListResponseModel> studentsList = studentService.getStudentsList();
        theModel.addAttribute("studentsList", studentsList);

        return "students-list";
    }

    @RequestMapping(value = {"/api/persons"},method = GET)
    public String getPersonsList(@RequestParam(value = "option", defaultValue = "0") Integer option, Model theModel) {

        List<?> personsList = (option == 1) ? studentService.getPersonsList() : studentService.getStudentPersonList();
        theModel.addAttribute("listP", personsList);
        return "persons-list";
    }

    @RequestMapping(value = {"/api/edit/{id}"},method = GET)
    public String showEditForm(@PathVariable Long id, Model theModel) {
        StudentListResponseModel responseModel = studentService.getStudentById(id);
        System.out.println(">> responseModel = " + responseModel);
        theModel.addAttribute("studentById", responseModel);

        return "edit-student";
    }

    @RequestMapping(value = {"/api/update"},method = POST)
    public String updateStudent(StudentListRequestModel requestModel) {
        System.out.println(">> " + requestModel);
        studentService.updateStudent(requestModel);
        return "redirect:/api/list";
    }

    @RequestMapping(value = {"/api/delete"},method = POST)
    public String deleteStudent(Long id) {

        studentService.deleteStudent(id);
        return "redirect:/api/list";
    }

    @RequestMapping(value = {"/api/save"}, method = POST)
    public String saveStudent(StudentSaveRequestModel requestModel) {
        studentService.saveStudent(requestModel);
        System.out.println(">> " + requestModel);
        return "redirect:/api/list";
    }

    @RequestMapping(value = {"/api/add-new"}, method = GET)
    public String showAddNewForm() {
        return "add-new";
    }



}
