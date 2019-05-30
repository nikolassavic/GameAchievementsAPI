package com.project.achievements_project.controller;

import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;

@RestControllerAdvice
public class Error {

    @ExceptionHandler({Exception.class})
    @ResponseStatus(HttpStatus.I_AM_A_TEAPOT)
    public String teaIsServed(){
        return "{\"message\": \"error - The tea is too hot, I am a teapot!\"}";
    }
}