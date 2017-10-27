package com.lin.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EncodingFilter implements Filter {

	private String code;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		req.setCharacterEncoding(code);
		res.setCharacterEncoding(code);
		String Searchword = req.getParameter("pageSize");
		//String str=new String(Searchword.getBytes("ISO-8859-1"),"UTF-8");
		res.setContentType("text/html;charset="+code);

		chain.doFilter(req, res);
		

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		code=arg0.getInitParameter("code");

	}


}
