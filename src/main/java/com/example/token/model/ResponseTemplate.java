package com.example.token.model;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ResponseTemplate {

    public Integer code;

    public String message;

    public Object data;

}
