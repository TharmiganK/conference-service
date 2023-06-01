package nl.craftsmen.conference;

import io.micronaut.data.jdbc.annotation.JdbcRepository;
import io.micronaut.data.repository.CrudRepository;
import io.micronaut.transaction.annotation.ReadOnly;

import javax.transaction.Transactional;

@JdbcRepository
public interface ConferenceJdbcCrudRepository extends CrudRepository<Conference, Long> {

    @Transactional
    @ReadOnly
    Iterable<Conference> findByName(String name);
}
