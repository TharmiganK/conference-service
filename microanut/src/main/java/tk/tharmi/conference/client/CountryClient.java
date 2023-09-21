package tk.tharmi.conference.client;

import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Produces;
import io.micronaut.http.client.annotation.Client;
import io.micronaut.retry.annotation.CircuitBreaker;
import io.micronaut.retry.annotation.Retryable;
import tk.tharmi.conference.entity.Country;

@Client("${country.service.url:`http://localhost:9000`}")
public interface CountryClient {

    @Get("/conferences/{name}/country")
    @Retryable(attempts = "2", delay = "1s")
    @CircuitBreaker(reset = "20s")
    @Produces
    Country getCountryOfConference(String name);
}
