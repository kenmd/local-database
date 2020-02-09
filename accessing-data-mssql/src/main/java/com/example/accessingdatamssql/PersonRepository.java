package com.example.accessingdatamssql;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface PersonRepository extends CrudRepository<Person, Integer> {

    @Modifying
    @Query("INSERT INTO PERSON (ID, NAME) VALUES (:id, :name)")
    boolean insert(@Param("id") Integer id, @Param("name") String name);

}
