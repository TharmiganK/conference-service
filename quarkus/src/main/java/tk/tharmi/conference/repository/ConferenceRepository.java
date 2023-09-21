package tk.tharmi.conference.repository;

import java.util.List;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import tk.tharmi.conference.entity.Conference;

@Singleton
public class ConferenceRepository {

    @Inject
    EntityManager entityManager;

    @Transactional
    public List<Conference> findAll() {
        TypedQuery<Conference> query = entityManager.createQuery("select c from Conference c", Conference.class);
        return query.getResultList();
    }

    @Transactional
    public void save(final Conference conference) {
        entityManager.persist(conference);
    }

}
