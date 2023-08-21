package com.example.demo.tutorial.model.services.Impl;

import com.example.demo.tutorial.model.models.Tutorial;
import com.example.demo.tutorial.model.repositories.TutorialRepository;
import com.example.demo.tutorial.model.services.ITutSerice;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TutorialServiceImpl implements ITutSerice {
    @Autowired
    private final TutorialRepository tutorialRepository;
    @Override
    public Tutorial createTutorial(Tutorial tutorial) {
        tutorial.setDescription(tutorial.getDescription());
        tutorial.setTitle(tutorial.getTitle());
         tutorialRepository.save(tutorial);

        return tutorial;
    }
}
