package nl.craftsmen.conference;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import org.eclipse.microprofile.faulttolerance.Fallback;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import java.util.List;
import java.util.stream.Collectors;

@Singleton
public class ConferenceService {

    @Inject
    private ConferenceRepository conferenceRepository;

    //private ConferencePanacheRepository conferenceRepository;

    @Inject
    @RestClient
    CountryClient countryClient;

    public List<Conference> getAll() {
        return conferenceRepository.findAll();
    }

    public void create(Conference conference) {
        conferenceRepository.save(conference);

    }












    public List<ExtendedConference> getAllWithCountry() {
        List<Conference> conferences = this.getAll();
        return conferences.stream()
                .map(this::getExtendedConference)
                .collect(Collectors.toList());
    }

    public ExtendedConference getExtendedConference(Conference conference) {
        ExtendedConference extendedConference = new ExtendedConference();
        extendedConference.setName(conference.getName());
        extendedConference.setCountryName(this.getCountryOfConference(conference.getName())
                .getName());
        return extendedConference;
    }

    @Fallback(fallbackMethod = "fallback")
    public Country getCountryOfConference(String name) {
        return countryClient.getCountryOfConference(name);
    }

    Country fallback(String name) {
        Country country = new Country();
        country.setName("no idea");
        return country;
    }

}
