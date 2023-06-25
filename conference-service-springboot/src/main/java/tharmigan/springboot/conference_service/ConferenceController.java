package tharmigan.springboot.conference_service;

import org.springframework.aot.hint.annotation.RegisterReflectionForBinding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/")
public class ConferenceController {

    @Autowired
    private ConferenceRepository conferenceRepository;

    private final String countryServiceUrl = "http://localhost:9000";

    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/conferences")
    public List<Conference> getAllConferences() {
        return conferenceRepository.findAll();
    }

    @PostMapping("/conferences")
    public void createConference(@RequestBody Conference conference) {
        conferenceRepository.save(conference);
    }

    @GetMapping("/conferenceswithcountry")
    @RegisterReflectionForBinding({ ExtendedConference.class, Country.class })
    public List<ExtendedConference> getAllConferencesWithCountry() {
        List<Conference> conferences = conferenceRepository.findAll();
        String uri;
        List<ExtendedConference> extendedConferences = new ArrayList<>();
        for (Conference conference : conferences) {
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
