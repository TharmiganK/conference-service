package nl.craftsmen.conference;

import io.micronaut.context.annotation.Context;
import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Consumes;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;
import io.micronaut.http.annotation.Produces;
import jakarta.inject.Inject;

import java.util.List;

@Controller("/")
@Context
public class ConferenceController {

    @Inject
    ConferenceService conferenceService;

    @Get("/conferences")
    @Produces(MediaType.APPLICATION_JSON)
    public Iterable<Conference> getAll() {
        return conferenceService.getAll();
    }

    @Post("/conferences")
    @Consumes(MediaType.APPLICATION_JSON)
    public void create(Conference conference) {
        conferenceService.create(conference);

    }

    @Get("/conferenceswithcountry")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ExtendedConference> getAllWithCountry() {
        return conferenceService.getAllWithCountry();
    }
}
