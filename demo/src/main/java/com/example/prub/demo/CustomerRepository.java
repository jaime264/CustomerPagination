package com.example.prub.demo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer,Integer> {


    Page<Customer> findAllByFirstNameOrLastName(String name, String lastName, Pageable pageable);
    Page<Customer> findAllByFirstNameContainingOrLastNameContaining(String name, String lastName, Pageable pageable);
}
