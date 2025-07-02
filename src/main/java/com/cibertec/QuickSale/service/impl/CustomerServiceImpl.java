package com.cibertec.QuickSale.service.impl;

import java.util.List;
import java.util.Optional;

import com.cibertec.QuickSale.model.dto.CustomerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cibertec.QuickSale.model.Customer;
import com.cibertec.QuickSale.repo.ICustomerRepo;
import com.cibertec.QuickSale.servic.ICustomerService;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	ICustomerRepo repo;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

	@Override
    public Customer registrar(CustomerDto cu) {
        // Encriptar la contraseña antes de guardar
        String encryptedPassword = passwordEncoder.encode(cu.getPassword());
        
        Customer customer = Customer.builder()
                .idCustomer(cu.getIdCustomer())
                .fullName(cu.getFullName())
                .dni(cu.getDni())
                .age(cu.getAge())
                .email(cu.getEmail())
                .password(encryptedPassword) // Usar la contraseña encriptada
                .roles(cu.getRoles())
                .status(cu.getStatus())
                .build();

        return repo.save(customer);
    }

	 @Override
	    public Customer modificar(CustomerDto cu) {
	        // Obtener el cliente existente para mantener la misma contraseña si no se cambió
	        Customer existingCustomer = repo.findById(cu.getIdCustomer()).orElse(null);
	        String password = cu.getPassword();
	        
	        // Solo encriptar si la contraseña es nueva (no es igual a la existente)
	        if(existingCustomer != null && !passwordEncoder.matches(password, existingCustomer.getPassword())) {
	            password = passwordEncoder.encode(password);
	        }
	        
	        Customer customer = Customer.builder()
	                .idCustomer(cu.getIdCustomer())
	                .fullName(cu.getFullName())
	                .dni(cu.getDni())
	                .age(cu.getAge())
	                .email(cu.getEmail())
	                .password(password)
	                .roles(cu.getRoles())
	                .status(cu.getStatus())
	                .build();

	        return repo.save(customer);
	    }

	@Override
	public List<Customer> listar() {
		return repo.findAll();
	}

	@Override
	public Customer listarPorId(Integer id) {
		return repo.findById(id).get();
	}

	@Override
	public void eliminar(Integer id) {
		repo.deleteById(id);
	}


	@Override
	public void cambiarEstadoAEliminado(Integer id) {
		Optional<Customer> optionalCustomer= repo.findById(id);
		if (optionalCustomer.isPresent()) {
			Customer customer = optionalCustomer.get();
			customer.setStatus("Eliminado");
			repo.save(customer);
		}
	}

	@Override
    public Customer login(String email, String password) {
        Customer customer = repo.findByEmail(email);
        if(customer != null && passwordEncoder.matches(password, customer.getPassword())) {
            return customer;
        }
        return null;
    }

	@Override
	public Customer findByEmail(String email) {
		return repo.findByEmail(email);
	}

	 @Override
	    public boolean changePassword(String email, String currentPassword, String newPassword) {
	        Customer customer = repo.findByEmail(email);

	        if (customer != null && passwordEncoder.matches(currentPassword, customer.getPassword())) {
	            String encryptedNewPassword = passwordEncoder.encode(newPassword);
	            customer.setPassword(encryptedNewPassword);
	            repo.save(customer);
	            return true;
	        } else {
	            return false;
	        }
	    }


}
