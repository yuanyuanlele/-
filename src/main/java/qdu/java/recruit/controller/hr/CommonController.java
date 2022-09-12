package qdu.java.recruit.controller.hr;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hr")
public class CommonController {

    /**
     * hr登录
     * @return
     */
    @RequestMapping("/hr_login")
    public String hr_login(){
        return "hr/hr_login";
    }
}
