package az.ultra.edumanmvc.model.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class BaseResponse<T> {

    private T data;
    private int draw;
    private long recordsTotal;
    private long recordsFiltered;

}
