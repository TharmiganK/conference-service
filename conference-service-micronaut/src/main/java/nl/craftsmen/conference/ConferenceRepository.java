package nl.craftsmen.conference;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

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
