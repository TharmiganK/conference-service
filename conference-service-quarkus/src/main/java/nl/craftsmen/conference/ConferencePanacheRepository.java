package nl.craftsmen.conference;

import jakarta.inject.Singleton;
import jakarta.transaction.Transactional;

import java.util.List;

@Singleton
public class ConferencePanacheRepository {

    @Transactional
    public void save(final Conference conference) {
        conference.persist();
    }

    public List<Conference> findAll() {
        return Conference.listAll();
    }
}
