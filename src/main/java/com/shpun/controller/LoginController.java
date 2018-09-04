package com.shpun.controller;

import com.shpun.pojo.Login;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
@RequestMapping("/login")
public class LoginController {

    /**
     * 返回json
     * @param login
     * @return
     */
    @RequestMapping(value = "/toLogin",method = RequestMethod.POST)
    public ModelAndView toLogin(@RequestBody Login login){

        System.out.println("login : "+login.getUsername() + " " + login.getPassword());

        ModelAndView mv = new ModelAndView();

        if("admin".equals(login.getUsername()) && "admin".equals(login.getPassword())){
            String url = "/manager/student";
            mv.addObject("url",url);
        }else{
            String failure = "登录失败";
            mv.addObject("login",failure);
        }

        mv.setView(new MappingJackson2JsonView());
        return mv;

    }


}
