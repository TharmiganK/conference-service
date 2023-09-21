package tk.tharmi.conference.service;

import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.ExtendedConference;

import java.util.List;

public interface ConferenceService {
    List<Conference> getAll();

    void create(Conference conference);

    List<ExtendedConference> getAllWithCountry();
}
