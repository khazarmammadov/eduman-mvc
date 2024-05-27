package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.model.request.StudentListRequestModel;
import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import az.ultra.edumanmvc.model.response.BaseResponse;
import az.ultra.edumanmvc.model.response.StudentInfoResponseModel;
import az.ultra.edumanmvc.model.response.StudentListResponseModel;
import az.ultra.edumanmvc.service.StudentService;
import lombok.RequiredArgsConstructor;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequiredArgsConstructor
public class StudentController {

    private final StudentService studentService;

    @RequestMapping(value = {"/info"}, method = GET)
    public String getStudentsInfo(Model theModel) {
        List<StudentInfoResponseModel> studentsInfo = studentService.getStudentsInfo();
        theModel.addAttribute("studentsInfo", studentsInfo);

        return "students-info";
    }

//    @RequestMapping(value = {"/api/list"}, method = GET)
//    public String getStudentsList(Model theModel) {
//        List<StudentListResponseModel> studentsList = studentService.getStudentsList(start, length, search);
//        theModel.addAttribute("studentsList", studentsList);
//
//        return "students-list";
//    }

    @RequestMapping(value = {"/api/persons"}, method = GET)
    public String getPersonsList(@RequestParam(value = "option", defaultValue = "0") Integer option, Model theModel) {

        List<?> personsList = (option == 1) ? studentService.getPersonsList() : studentService.getStudentPersonList();
        theModel.addAttribute("listP", personsList);
        return "persons-list";
    }

    @RequestMapping(value = {"/api/edit/{id}"}, method = GET)
    public String showEditForm(@PathVariable Long id, Model theModel) {
        StudentListResponseModel responseModel = studentService.getStudentById(id);
        System.out.println(">> responseModel = " + responseModel);
        theModel.addAttribute("studentById", responseModel);

        return "edit-student";
    }

    @RequestMapping(value = {"/api/update"}, method = POST)
    @ResponseBody
    public String updateStudent(@RequestBody StudentListRequestModel requestModel) {
        System.out.println(">> requestModel = " + requestModel);
        studentService.updateStudent(requestModel);
        return "ok";
    }

//    @RequestMapping(value = {"/api/delete"}, method = POST)
//    public String deleteStudent(Long id) {
//
//        studentService.deleteStudent(id);
//        return "redirect:/api/list";
//    }


    @RequestMapping(value = {"/api/delete/{id}"}, method = DELETE)
    @ResponseBody
    public String deleteStudent(@PathVariable Long id) {

        studentService.deleteStudent(id);
        return "ok";
    }


    @RequestMapping(value = {"/api/save"}, method = POST)
    public String saveStudent(StudentSaveRequestModel requestModel) {
        studentService.saveStudent(requestModel);
        System.out.println(">> " + requestModel);
        return "redirect:/api/list";
    }

    @RequestMapping(value = {"/api/insert"}, method = POST)
    @ResponseBody
    public void insertStudent(@RequestBody StudentSaveRequestModel requestModel) {
        studentService.insertStudent(requestModel);
        System.out.println(">> " + requestModel);
      //  return "redirect:/api/list";
    }

    @RequestMapping(value = {"/api/add-new"}, method = GET)
    public String showAddNewForm() {
        return "add-new";
    }

    @RequestMapping(value = {"/api/search"}, method = GET)
    @ResponseBody
    public List<StudentListResponseModel> searchStudent(@RequestParam(value = "search", defaultValue = "") String str) {
        return studentService.searchStudentList(str);
    }

    @RequestMapping(value = {"/api/tPerson"}, method = GET)
    @ResponseBody
    public BaseResponse<List<StudentListResponseModel>> getPersons(
            @RequestParam("draw") Integer draw,
            @RequestParam(value = "start", defaultValue = "0") Integer start,
            @RequestParam(value = "length", defaultValue = "10") Integer length,
            @RequestParam(value = "search[value]", defaultValue = "") String search) {
        System.out.println(">> search: " + search);

        List<StudentListResponseModel> studentsList = studentService.getStudentsList(start, length, search);
        Long studentsCount = studentService.countOfStudents(search);

        return BaseResponse.<List<StudentListResponseModel>>builder()
                .data(studentsList)
                .draw(draw)
                .recordsFiltered(studentsCount)
                .recordsTotal(studentsCount)
                .build();
    }

    @RequestMapping(value = {"/api/pp"}, method = GET)
    public String getPersonJSP() {
        return "persons-table";
    }

    @GetMapping("/download/excel")
    @ResponseBody
    public void personsExcel(@RequestParam(value = "draw", defaultValue = "0") Integer draw,
                             @RequestParam(value = "start", defaultValue = "0") Integer start,
                             @RequestParam(value = "length", defaultValue = "10") Integer length,
                             @RequestParam(value = "search[value]", defaultValue = "") String search,
                             HttpServletResponse response) {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=persons.xlsx");
        response.setStatus(HttpStatus.OK.value());

        try (XSSFWorkbook workbook = new XSSFWorkbook()) {
            XSSFSheet sheet = workbook.createSheet("Students");

            XSSFRow headerRow = sheet.createRow(0);
            String[] headers = {"ID", "Name", "Surname", "MiddleName"};
            CellStyle headerStyle = workbook.createCellStyle();
            Font font = workbook.createFont();
            font.setBold(true);
            headerStyle.setFont(font);

            for (int i = 0; i < headers.length; i++) {
                headerRow.createCell(i).setCellValue(headers[i]);
                headerRow.getCell(i).setCellStyle(headerStyle);
            }

            List<StudentListResponseModel> studentsList = studentService.getStudentsList(start, length, search);

            int rowNum = 1;
            for (StudentListResponseModel student : studentsList) {
                XSSFRow row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(student.getId());
                row.createCell(1).setCellValue(student.getName());
                row.createCell(2).setCellValue(student.getSurname());
                row.createCell(3).setCellValue(student.getMiddleName());
            }

            for (int i = 0; i < headers.length; i++) {
                sheet.autoSizeColumn(i);
            }

            workbook.write(response.getOutputStream());

        } catch (IOException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }


}
