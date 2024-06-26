package az.ultra.edumanmvc.entity;


import az.ultra.edumanmvc.model.request.StudentSaveRequestModel;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Table(name = "TEST_PERSONS_KHAZAR", schema = "EDUMAN_COMMON")
public class Student {

    @Id
    private Long id;
    private String name;
    private String surname;
    private String middleName;

//    public static Student ofStudentGet(StudentSaveRequestModel model){
//        return Student.builder()
//                .surname(model.getSurname())
//                .build();
//    }

//    private Long sex;
//    private LocalDate birthDate;
//    private Long comPersonUniqId;
//    private LocalDate changeDate;
//    private Long active;
//    private Long notificationStatus;
//    private Long newc;
//    private String oldSurname;
}
