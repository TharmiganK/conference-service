package tk.tharmi.conference.client;

import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Produces;
import io.micronaut.http.client.annotation.Client;
import tk.tharmi.conference.entity.Country;

@Client("${country.service.url:`http://localhost:9000`}")
public interface CountryClient {

    @Get("/conferences/{name}/country")
    @Produces
    Country getCountryOfConference(String name);
}
