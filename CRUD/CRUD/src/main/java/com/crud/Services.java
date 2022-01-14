package com.crud;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Services {
	
	@Autowired
	private Repo p;

	public String add(Users u)
	{
		 p.save(u);
		 return "Successfully Added";
	}
	
	public Iterable<Users> getall()
	{
		return p.findAll();
	}
	
	public String del(Integer id)
	{
		if(p.existsById(id))
		{
			p.deleteById(id);
			return "Successfully Deleted";
		}
		else
			return "SomeThing Went Wrong!!";
		
	}

	public String update(Users u) {
		if(p.existsById(u.getId()))
		{
			p.save(u);
			return "Successfully Updated";
		}
		else
			return "SomeThing Went Wrong!!";
	}
}
