package tk.tharmi.conference.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import io.micronaut.transaction.annotation.Transactional;
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
    private final ConferenceRepository conferenceRepository;
    @Inject
    private final CountryClient countryClient;

    public ConferenceServiceImpl(ConferenceRepository conferenceRepository, CountryClient countryClient) {
        this.conferenceRepository = conferenceRepository;
        this.countryClient = countryClient;
        this.conferenceRepository.deleteAll();
    }

    @Override
    @Transactional
    public List<Conference> getAll() {
        return conferenceRepository.findAll();
    }

    @Override
    @Transactional
    public void create(Conference conference) {
        conferenceRepository.save(conference);
    }

    @Override
    @Transactional
    public List<ExtendedConference> getAllWithCountry() {
        List<Conference> conferences = this.getAll();
        return conferences.stream()
                .map(this::getExtendedConference)
                .collect(Collectors.toList());
    }

    private ExtendedConference getExtendedConference(Conference conference) {
        ExtendedConference extendedConference = new ExtendedConference();
        extendedConference.setName(conference.getName());
        extendedConference.setCountryName(this.getCountryOfConference(conference.getName())
                .getName());
        return extendedConference;
    }

    private Country getCountryOfConference(String conferenceName) {
        return countryClient.getCountryOfConference(conferenceName);
    }
}
