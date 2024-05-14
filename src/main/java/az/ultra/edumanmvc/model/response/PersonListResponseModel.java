package az.ultra.edumanmvc.model.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class PersonListResponseModel {

    private Long id;
    private String name;
    private String surname;
    private String middleName;
    private Long sex;
    private Long uniqueId;
}
