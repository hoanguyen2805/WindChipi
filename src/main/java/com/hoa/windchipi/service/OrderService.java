package com.hoa.windchipi.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoa.windchipi.entity.Order;
import com.hoa.windchipi.entity.Product;
import com.hoa.windchipi.entity.User;
import com.hoa.windchipi.model.OrderDTO;
import com.hoa.windchipi.repository.OrderRepository;
import com.hoa.windchipi.repository.ProductRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private ProductRepository productRepository;
	public void save(Long id_product, int number_products, Long id_user) {
		Product product = productRepository.findById(id_product).get();
		double freight_cost = 0;
		double total_money = product.getPrice() * number_products;
		if(product.getPrice()*number_products < 200000) {
			freight_cost = 20000;
			total_money = total_money + freight_cost;
		}
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Order order = new Order();
		User user = new User();
		user.setId(id_user);
		
		order.setUser(user);
		order.setProduct(product);
		order.setNumberProducts(number_products);
		order.setTotalMoney(total_money);
		order.setStatus("pending");
		order.setFreightCost(freight_cost);
		
		order.setDate_created(timestamp);
		orderRepository.save(order);
		product.setTotal(product.getTotal() - number_products);
		product.setSold(product.getSold() + number_products);
		productRepository.save(product);
	}
	
	public List<OrderDTO> getByUser(User user) {
		List<OrderDTO> orderDTOs = new ArrayList<OrderDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		orderRepository.findByUser(user).forEach(item -> {
			orderDTOs.add(new OrderDTO(item.getId(), item.getProduct().getName(), item.getProduct().getId(),
					item.getProduct().getPrice(), item.getNumberProducts(), item.getStatus(),
					item.getTotalMoney(), item.getFreightCost(), sdf.format(item.getDate_created())));
		});
		return orderDTOs;
	}
}