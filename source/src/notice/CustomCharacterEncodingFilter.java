package notice;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;




public class CustomCharacterEncodingFilter implements Filter {
	
	private String encoding;
	
	
	@Override
	public void destroy(){
		
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("현재 설정된 인코딩 정보 : " + encoding);
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		
		chain.doFilter(req, resp); //서블릿 필터 하나 만든 것. 요청 들어오면 가로채서 req, resp 세팅 해줌.
	}

	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		if(filterConfig.getInitParameter("encoding") == null ) { //세팅하지 않은 경우
			this.encoding = "UTF-8";
		} else {
			this.encoding = filterConfig.getInitParameter("encoding");
		}
	}
}
