package az.ultra.edumanmvc.model.request;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class StudentListRequestModel {
    private Long id;
    private String name;
    private String surname;
    private String middleName;

}
