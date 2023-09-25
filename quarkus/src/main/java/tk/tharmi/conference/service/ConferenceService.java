package tk.tharmi.conference.service;

import java.util.List;

import tk.tharmi.conference.entity.Conference;
import tk.tharmi.conference.entity.ExtendedConference;

public interface ConferenceService {
    
    public List<Conference> getAll();

    public void create(Conference conference);

    public List<ExtendedConference> getAllWithCountry();
}
