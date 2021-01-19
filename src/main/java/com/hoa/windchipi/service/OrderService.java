package com.hoa.windchipi.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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

	public void save(OrderDTO orderDTO, User user) {
		Product product = productRepository.findById(orderDTO.getIdProduct()).get();
		double freight_cost = 0;
		double total_money = product.getPrice() * orderDTO.getNumber_products();
		if (product.getPrice() * orderDTO.getNumber_products() < 200000) {
			freight_cost = 20000;
			total_money = total_money + freight_cost;
		}
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		Order order = new Order();

		order.setUser(user);
		order.setProduct(product);
		order.setNumberProducts(orderDTO.getNumber_products());
		order.setTotalMoney(total_money);
		order.setStatus("chờ xác nhận");
		order.setFreightCost(freight_cost);
		order.setPrice(product.getPrice());

		order.setDate_created(timestamp);
		order.setSize(orderDTO.getSize());
		order.setFull_name(orderDTO.getFull_name());
		order.setAddress(orderDTO.getAddress());
		order.setPhone(orderDTO.getPhone());
		orderRepository.save(order);
		product.setTotal(product.getTotal() - orderDTO.getNumber_products());
		product.setSold(product.getSold() + orderDTO.getNumber_products());
		productRepository.save(product);
	}

	public List<OrderDTO> getOrdersByUser(User user) {
		List<OrderDTO> orderDTOs = new ArrayList<OrderDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		orderRepository.findByUserOrderByStatusAsc(user).forEach(item -> {
			orderDTOs.add(new OrderDTO(item.getId(), item.getProduct().getName(), item.getProduct().getId(),
					item.getProduct().getPrice(), item.getNumberProducts(), item.getStatus(), item.getTotalMoney(),
					item.getFreightCost(), sdf.format(item.getDate_created()), item.getUser().getUsername(),
					item.getUser().getId(), item.getSize(), item.getFull_name(), item.getAddress(), item.getPhone()));
		});
		return orderDTOs;
	}

	public List<OrderDTO> paging(int page) {
		List<OrderDTO> orderDTOs = new ArrayList<OrderDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		orderRepository.findAll(PageRequest.of(page, 5, Sort.by("status"))).getContent().forEach(item -> {
			orderDTOs.add(new OrderDTO(item.getId(), item.getProduct().getName(), item.getProduct().getId(),
					item.getPrice(), item.getNumberProducts(), item.getStatus(), item.getTotalMoney(),
					item.getFreightCost(), sdf.format(item.getDate_created()), item.getUser().getUsername(),
					item.getUser().getId(), item.getSize(), item.getFull_name(), item.getAddress(), item.getPhone()));
		});
		return orderDTOs;
	}

//
	public int getSizeSearch(String content) {
		return orderRepository.getSizeSearch(content).size();
	}

	public List<OrderDTO> searchOrder(String content, int page) {
		List<OrderDTO> orderDTOs = new ArrayList<OrderDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy HH:mm:ss");
		orderRepository.searchOrder(content, PageRequest.of(page, 5, Sort.by("status"))).getContent().forEach(item -> {
			orderDTOs.add(new OrderDTO(item.getId(), item.getProduct().getName(), item.getProduct().getId(),
					item.getPrice(), item.getNumberProducts(), item.getStatus(), item.getTotalMoney(),
					item.getFreightCost(), sdf.format(item.getDate_created()), item.getUser().getUsername(),
					item.getUser().getId(), item.getSize(), item.getFull_name(), item.getAddress(), item.getPhone()));
		});
		return orderDTOs;
	}

	public void deleteById(Long id) {
		orderRepository.deleteById(id);
	}

	public void update(OrderDTO orderDTO, int bot) {
		Order order = new Order();
		order.setId(orderDTO.getId());
		order.setStatus(orderDTO.getStatus());
		order.setPrice(orderDTO.getPrice());
		order.setDate_created(orderRepository.findById(orderDTO.getId()).get().getDate_created());
		order.setSize(orderDTO.getSize());
		order.setFull_name(orderDTO.getFull_name());
		order.setAddress(orderDTO.getAddress());
		order.setPhone(orderDTO.getPhone());
		User user = new User();
		user.setId(orderDTO.getIdUser());
		order.setUser(user);

		Product p = new Product();
		p.setId(orderDTO.getIdProduct());
		order.setProduct(p);

		// update so luong product
		Product product = productRepository.findById(orderDTO.getIdProduct()).get();
		product.setTotal(product.getTotal() + bot);
		product.setSold(product.getSold() - bot);
		productRepository.save(product);

		order.setNumberProducts(orderDTO.getNumber_products());
		double freight_cost = 0;
		double total_money = product.getPrice() * orderDTO.getNumber_products();
		if (product.getPrice() * orderDTO.getNumber_products() < 200000) {
			freight_cost = 20000;
			total_money = total_money + freight_cost;
		}
		order.setTotalMoney(total_money);
		order.setFreightCost(freight_cost);

		orderRepository.save(order);
	}
}
