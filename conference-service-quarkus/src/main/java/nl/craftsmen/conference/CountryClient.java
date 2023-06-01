package nl.craftsmen.conference;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import org.eclipse.microprofile.faulttolerance.CircuitBreaker;
import org.eclipse.microprofile.faulttolerance.Retry;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@RegisterRestClient
public interface CountryClient {

    @GET
    @Path("/conferences/{name}/country")
    @Produces("application/json")
    @Retry(maxRetries = 3)
    @CircuitBreaker
    Country getCountryOfConference(@PathParam("name") String name);
}
