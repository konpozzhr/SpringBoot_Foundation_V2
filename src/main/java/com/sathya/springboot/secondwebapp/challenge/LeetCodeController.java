package com.sathya.springboot.secondwebapp.challenge;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LeetCodeController {

    @RequestMapping(value = "/leetCode/2-addTwoNumber", method = RequestMethod.GET)
    public String addTwoNumber(){
        return "addTwoNumber";
    }

    @RequestMapping(value = "/leetCode/3-LongestSubstring", method = RequestMethod.GET)
    public String LongestSubstring(){
        return "LongestSubstring";
    }

}
