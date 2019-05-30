package com.project.achievements_project.service;

import com.project.achievements_project.dao.DaoAchievement;
import com.project.achievements_project.dao.DaoGame;
import com.project.achievements_project.entity.Achievement;
import com.project.achievements_project.entity.Game;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.dao.EmptyResultDataAccessException;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ServiceAchievement {
    private static final String SUCCESS = "Success!";
    private static final String ERROR_CREATE = "Some of fields are empty or too long!";
    private static final String ERROR_UPDATE = "Some of fields are too long!";
    private static final String ERROR_ID = "Id is invalid!";

    @Autowired
    private DaoAchievement daoAchievement;
    @Autowired
    private DaoGame daoGame;

    public Achievement create(String gameId, Achievement request) {
        Achievement response = new Achievement();
        try {
            Game game = daoGame.getOne(gameId);
            if (request.getDisplayName() != null && !request.getDisplayName().equals("")
                    && request.getDisplayName().length() <= 100
                    && request.getDescription() != null && !request.getDescription().equals("")
                    && request.getDescription().length() <= 500) {
                if (request.getIcon() != null && request.getIcon().length() > 2048) {
                    response.setMessage(ERROR_CREATE);
                    return response;
                }
                if (request.getDisplayOrder() <= 0) {
                    request.setDisplayOrder(Integer.MAX_VALUE);
                }
                request.setGame(game);
                game.getAchievements().add(request);
                response = daoAchievement.save(request);
                response.setMessage(SUCCESS);
                return response;
            }
            response.setMessage(ERROR_CREATE);
            return response;
        } catch (EntityNotFoundException ex) {
            response.setMessage(ERROR_ID);
            return response;
        }
    }

    public Achievement update(String achievementId, Achievement request) {
        Achievement response;
        try {
            response = daoAchievement.getOne(achievementId);

            if (request.getDisplayName() != null && !request.getDisplayName().equals("")) {
                if (request.getDisplayName().length() > 100) {
                    response.setMessage(ERROR_UPDATE);
                    return response;
                }
                response.setDisplayName(request.getDisplayName());
            }
            if (request.getDescription() != null && !request.getDescription().equals("")) {
                if (request.getDescription().length() > 500) {
                    response.setMessage(ERROR_UPDATE);
                    return response;
                }
                response.setDescription(request.getDescription());
            }
            if (request.getIcon() != null && !request.getIcon().equals("")) {
                if (request.getIcon().length() > 2048) {
                    response.setMessage(ERROR_UPDATE);
                    return response;
                }
                response.setIcon(request.getIcon());
            }
            if (request.getDisplayOrder() > 0) {
                response.setDisplayOrder(request.getDisplayOrder());
            }
            response = daoAchievement.save(response);
            response.setMessage(SUCCESS);
        } catch (EntityNotFoundException ex) {
            response = new Achievement();
            response.setMessage(ERROR_ID);
        }
        return response;
    }

    public Achievement getOne(String achievementId) {
        Achievement response;
        try {
            response = daoAchievement.getOne(achievementId);
            response.setMessage(SUCCESS);
        } catch (EntityNotFoundException ex) {
            response = new Achievement();
            response.setMessage(ERROR_ID);
        }
        return response;
    }

    public List getAll(String gameId) {
        List response;
        try {
            Game game = daoGame.getOne(gameId);
            response = game.getAchievements();
        } catch (EntityNotFoundException ex) {
            Achievement achievement = new Achievement();
            achievement.setMessage(ERROR_ID);
            response = new ArrayList();
            response.add(achievement);
        }
        return response;
    }

    public String delete(String achievementId) {
        String response;
        try {
            daoAchievement.deleteById(achievementId);
            response = SUCCESS;
        } catch (EmptyResultDataAccessException ex) {
            response = ERROR_ID;
        }
        return "{\"message\":\"" + response + "\"}";
    }
}
