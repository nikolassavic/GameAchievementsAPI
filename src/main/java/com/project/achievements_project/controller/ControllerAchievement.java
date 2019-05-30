package com.project.achievements_project.controller;

import com.project.achievements_project.entity.Achievement;
import com.project.achievements_project.service.ServiceAchievement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/achievements")
public class ControllerAchievement {
    @Autowired
    private ServiceAchievement serviceAchievement;

    @PostMapping(value = "/{gameId}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Achievement create(@PathVariable String gameId,
                              @RequestBody Achievement achievement){
        Achievement response = serviceAchievement.create(gameId, achievement);
        return response;
    }

    @PutMapping(value = "/{achievementId}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Achievement update(@PathVariable String achievementId,
                              @RequestBody Achievement achievement){
        Achievement response = serviceAchievement.update(achievementId, achievement);
        return response;
    }

    @GetMapping(value = "/{achievementId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Achievement getOne(@PathVariable String achievementId){
        System.out.println(achievementId);
        Achievement response = serviceAchievement.getOne(achievementId);
        return response;
    }

    @GetMapping(value = "/all/{gameId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List getAll(@PathVariable String gameId){
        List response = serviceAchievement.getAll(gameId);
        return response;
    }

    @DeleteMapping(value = "/{achievementId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String delete(@PathVariable String achievementId){
        String response = serviceAchievement.delete(achievementId);
        return response;
    }
}