package tk.tharmi.conference.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.eclipse.microprofile.rest.client.inject.RestClient;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import tk.tharmi.conference.client.CountryClient;
import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.Country;
import tk.tharmi.conference.entity.ExtendedConference;
import tk.tharmi.conference.repository.ConferenceRepository;
import tk.tharmi.conference.service.ConferenceService;

@Singleton
public class ConferenceServiceImpl implements ConferenceService {
    @Inject
    private ConferenceRepository conferenceRepository;

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

    public Country getCountryOfConference(String name) {
        return countryClient.getCountryOfConference(name);
    }  
}
