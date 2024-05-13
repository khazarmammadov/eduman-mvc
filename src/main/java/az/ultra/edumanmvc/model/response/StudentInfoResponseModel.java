package az.ultra.edumanmvc.model.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class StudentInfoResponseModel {

    private String fullName;
    private int personId;
    private int studentId;
    private int orgId;
    private int average;


}
