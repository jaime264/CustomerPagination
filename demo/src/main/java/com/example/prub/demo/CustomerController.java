package com.example.prub.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @PostMapping(value = "/getCustomers", produces = "application/json; charset=UTF-8")
    public List<Customer> getCustomer() {
        List<Customer> customers = new ArrayList<>();

        try {
            customers = customerService.findAll();

        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }

        return customers;

    }

    @GetMapping(value = "/listPageable", produces = "application/json; charset=UTF-8")
    Page<Customer> customersPageable(Pageable pageable) {
        return customerService.findAll(pageable);
    }

    @GetMapping(value = "/listFilterPageable", produces = "application/json; charset=UTF-8")
    Page<Customer> customersFilter(String name, Pageable pageable) {

        if(name.isEmpty()){
            return customerService.findAll(pageable);

        }else{
            return customerService.findAllByNameContaining(name, pageable);
        }
    }

    @PostMapping(value = "/saveCustomer", produces = "application/json; charset=UTF-8")
    public void saveCustomer(@RequestBody Customer customer) {
        try {
            customerService.save(customer);

        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }


}
