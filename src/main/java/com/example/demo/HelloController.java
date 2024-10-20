package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "index";  // Return the name of the HTML file (without .html)
    }

    @GetMapping("/test")
    public String test() {
        return "This is a test endpoint!"; // This can remain unchanged
    }
}
