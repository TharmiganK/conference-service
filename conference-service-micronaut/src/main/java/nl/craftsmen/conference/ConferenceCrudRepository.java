package nl.craftsmen.conference;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;

import java.util.List;

@Repository
public interface ConferenceCrudRepository extends CrudRepository<Conference, Long> {

    List<Conference> findByName(String name);

    List<Conference> listOrderByName();

    List<Conference> listOrderByNameDesc();

    List<Conference> findTop3ByNameLike(String name);

}
