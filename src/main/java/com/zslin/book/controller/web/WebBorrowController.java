package com.zslin.book.controller.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zslin.basic.model.Pager;
import com.zslin.book.iservice.IBorrowService;
import com.zslin.book.iservice.IReaderService;
import com.zslin.book.model.Borrow;

@Controller
@RequestMapping(value="web/borrow")
public class WebBorrowController {

	private IBorrowService borrowService;
	private IReaderService readerService;

	public IReaderService getReaderService() {
		return readerService;
	}

	@Inject
	public void setReaderService(IReaderService readerService) {
		this.readerService = readerService;
	}

	public IBorrowService getBorrowService() {
		return borrowService;
	}

	@Inject
	public void setBorrowService(IBorrowService borrowService) {
		this.borrowService = borrowService;
	}
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String index(Model model, HttpServletRequest rerquest) {
		Pager<Borrow> datas = borrowService.findAll("");
		model.addAttribute("datas", datas);
		return "web/borrow/index";
	}
	
	@RequestMapping(value="show", method=RequestMethod.GET)
	public String show(Model model, Integer readerId, HttpServletRequest reuqest) {
		Pager<Borrow> datas = borrowService.findByReader(readerId, null);
		model.addAttribute("datas", datas);
		model.addAttribute("reader", readerService.load(readerId));
		return "web/borrow/show";
	}
}
