package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName = "adminFilter", urlPatterns = {"/admin/*"})
public class adminFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Admin Filter!");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		if (req.getSession().getAttribute("user") == null) {
			System.out.println("Admin Filter refused!");
			req.getSession().invalidate();
			System.out.println("Current Session destroyed!");
			resp.sendRedirect("/Indem/admin-login.jsp");
		} else {
			System.out.println("Admin Filter agreed!");
			chain.doFilter(req, resp);
		}
	}

	@Override
	public void destroy() {
		
	}
	
}
