package tk.tharmi.conference.client;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import tk.tharmi.conference.entity.Country;

@RegisterRestClient(baseUri = "http://localhost:9000")
public interface CountryClient {

    @GET
    @Path("/conferences/{name}/country")
    @Produces("application/json")
    Country getCountryOfConference(@PathParam("name") String name);
}
