package com.test.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class Hello {

  @RequestMapping("/status")
  String home() {
    return "Hello World!\n";
  }

}