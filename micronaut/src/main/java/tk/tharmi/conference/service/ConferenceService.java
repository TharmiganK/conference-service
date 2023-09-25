package tk.tharmi.conference.service;

import java.util.List;

import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.ExtendedConference;

public interface ConferenceService {

    List<Conference> getAll();

    void create(Conference conference);

    List<ExtendedConference> getAllWithCountry();
}
