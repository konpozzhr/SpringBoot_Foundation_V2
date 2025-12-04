package com.sathya.springboot.secondwebapp.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SayHelloController {

    @RequestMapping("say-hello")
    @ResponseBody
    public String SayHello(){
        return "Hello! What are you learning today?";
    }


    @RequestMapping("say-hello-html")
    @ResponseBody
    public String SayHelloHTML(){

        StringBuffer sb = new StringBuffer();
        sb.append("<html>");
        sb.append("<head>");
        sb.append("<title>My First HTML Page </title>");
        sb.append("</head>");
        sb.append("<body>");
        sb.append("This is my first HTML Page with SpringBoot");
        sb.append("</body>");
        sb.append("</html>");

        return sb.toString();
    }

    @RequestMapping("say-hello-jsp")
    public String SayHelloJSP(){
        return "sayHello";
    }
}
