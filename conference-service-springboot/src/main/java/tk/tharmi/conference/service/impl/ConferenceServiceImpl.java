package tk.tharmi.conference.service.impl;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.Country;
import tk.tharmi.conference.entity.ExtendedConference;
import tk.tharmi.conference.repository.ConferenceRepository;
import tk.tharmi.conference.service.ConferenceService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ConferenceServiceImpl implements ConferenceService {
    @Autowired
    private final ConferenceRepository conferenceRepository;
    private final RestTemplate restTemplate = new RestTemplate();

    public ConferenceServiceImpl(ConferenceRepository conferenceRepository) {
        this.conferenceRepository = conferenceRepository;
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
        List<Conference> conferences = conferenceRepository.findAll();
        String uri;
        List<ExtendedConference> extendedConferences = new ArrayList<>();
        for (Conference conference : conferences) {
            String countryServiceUrl = "http://localhost:9000";
            uri = countryServiceUrl + "/conferences/" + conference.getName() + "/country";
            Country country = restTemplate.getForObject(uri, Country.class);
            ExtendedConference extendedConference = new ExtendedConference();
            extendedConference.setName(conference.getName());
            extendedConference.setCountryName(country.getName());
            extendedConferences.add(extendedConference);
        }
        return extendedConferences;
    }
}
