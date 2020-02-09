package com.example.accessingdatamssql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path = "/demo")
public class MainController {

    @Autowired
    private PersonRepository repository;

    @PostMapping(path = "/add")
    public @ResponseBody String addNewUser(@RequestParam Integer id, @RequestParam String name) {

        // this is for test. (id should be checked before insert)
        repository.insert(id, name);

        return "Saved";
    }

    @GetMapping("/all")
    public @ResponseBody Iterable<Person> getAll() {
        return repository.findAll();
    }
}
