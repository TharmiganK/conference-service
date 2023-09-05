package tk.tharmi.conference.controller;

import java.util.List;

import io.micronaut.http.HttpStatus;
import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Consumes;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;
import io.micronaut.http.annotation.Produces;
import io.micronaut.http.annotation.Status;
import jakarta.inject.Inject;
import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.ExtendedConference;
import tk.tharmi.conference.service.ConferenceService;

@Controller
public class ConferenceController {

    @Inject
    private final ConferenceService conferenceService;

    public ConferenceController(ConferenceService conferenceService) {
        this.conferenceService = conferenceService;
    }

    @Get("/conferences")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Conference> getAll() {
        return conferenceService.getAll();
    }

    @Post("/conferences")
    @Consumes(MediaType.APPLICATION_JSON)
    @Status(HttpStatus.CREATED)
    public void create(@Body Conference conference) {
        conferenceService.create(conference);

    }

    @Get("/conferenceswithcountry")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ExtendedConference> getAllWithCountry() {
        return conferenceService.getAllWithCountry();
    }
    
}
