package com.example.token.kit;

import org.springframework.stereotype.Component;


@Component
public interface TokenGenerator {

    public String generate(String... strings);

}
