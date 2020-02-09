package com.example.accessingdatamssql;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Value;
import lombok.With;

@Value(staticConstructor = "of")
@With
@Table("PERSON")
public class Person {

    private final @Column("ID") @Id Integer id;
    private final @Column("NAME") String name;

}
