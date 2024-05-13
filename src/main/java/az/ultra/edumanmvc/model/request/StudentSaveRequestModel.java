package az.ultra.edumanmvc.model.request;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;


@Data
@RequiredArgsConstructor
public class StudentSaveRequestModel {

    private Long id;
    private String name;
    private String surname;
    private String middleName;
    private Long sex;
 //   private LocalDate birthdate;
    private Long com_person_uniq_id;


}
