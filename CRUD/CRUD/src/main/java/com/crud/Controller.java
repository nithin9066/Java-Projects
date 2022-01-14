package com.crud;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
	@Autowired
	private Services s;
	
	@PostMapping("/add")
	public String add(Users u)
	{
		return s.add(u);
	}
	
	@GetMapping("/")
	public Iterable<Users> index()
	{
		return s.getall();
	}
	
	@GetMapping("/delete/{id}")
	public String del( @PathVariable Integer id)
	{
		 return s.del(id);
	}
	@PostMapping("/update")
	public String update(Users u)
	{
		return s.update(u);
	}
}
