package az.ultra.edumanmvc.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequiredArgsConstructor
@SessionAttributes("selectedOption")
public class SessionController {

    @RequestMapping(value = {"/selection"},method = GET)
    public String handleSelection(@RequestParam("option") String selectedOption) {


        return "redirect:/";
    }

}
