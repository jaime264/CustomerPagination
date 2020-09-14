package com.example.prub.demo;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;

import java.util.List;

public interface CustomerService {

    public List<Customer> findAll();

    public void save(Customer customer);

    public Customer findOne(Integer id);

    public void delete(Integer id);

    public Page<Customer> findAll(Pageable pageable);

    public Page<Customer> findAllByNameContaining(String name, Pageable pageable);

}
