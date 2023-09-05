package tk.tharmi.conference.controller;

import org.springframework.aot.hint.annotation.RegisterReflectionForBinding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.Country;
import tk.tharmi.conference.entity.ExtendedConference;
import tk.tharmi.conference.service.ConferenceService;

import java.util.List;

@RestController
@RequestMapping("/")
public class ConferenceController {

    @Autowired
    ConferenceService conferenceService;

    @GetMapping("/conferences")
    public List<Conference> getAllConferences() {
        return conferenceService.getAll();
    }

    @PostMapping("/conferences")
    @ResponseStatus(code = HttpStatus.CREATED)
    public void createConference(@RequestBody Conference conference) {
        conferenceService.create(conference);
    }

    @GetMapping("/conferenceswithcountry")
    @RegisterReflectionForBinding({ ExtendedConference.class, Country.class })
    public List<ExtendedConference> getAllConferencesWithCountry() {
        return conferenceService.getAllWithCountry();
    }
}
