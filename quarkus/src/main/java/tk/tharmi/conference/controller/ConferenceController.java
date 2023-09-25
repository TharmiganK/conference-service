package tk.tharmi.conference.controller;

import java.util.List;

import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.Response.Status;
import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.ExtendedConference;
import tk.tharmi.conference.service.ConferenceService;

@Path("/")
public class ConferenceController {

    @Inject
    ConferenceService conferenceService;

    @GET
    @Path("/conferences")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Conference> getAll() {
        return conferenceService.getAll();
    }

    @POST
    @Path("/conferences")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response create(Conference conference) {
        conferenceService.create(conference);
        return Response.status(Status.ACCEPTED).build();
    }

    @GET
    @Path("/conferenceswithcountry/")
    @Produces(MediaType.APPLICATION_JSON)
    public List<ExtendedConference> getAllWithCountry() {
        return conferenceService.getAllWithCountry();
    }
}
