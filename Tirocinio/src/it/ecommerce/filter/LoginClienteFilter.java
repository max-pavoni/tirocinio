package it.ecommerce.filter;

import java.io.IOException;



import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import it.ecommerce.controller.AmministratoreController;
import it.ecommerce.controller.ClienteController;


public class LoginClienteFilter implements Filter {

	/**
	 * Checks if user is logged in. If not it redirects to the index page.
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Get the controllers from session attribute
		ClienteController clienteController = (ClienteController)((HttpServletRequest)request).getSession().getAttribute("clienteController");
		AmministratoreController amministratoreController = (AmministratoreController)((HttpServletRequest)request).getSession().getAttribute("amministratoreController");

		if (clienteController != null && clienteController.getCliente() != null) {
			chain.doFilter(request, response);
		}
		else if (amministratoreController != null && amministratoreController.getAmministratore() != null) {
			chain.doFilter(request, response);
		}

		else {
			String contextPath = ((HttpServletRequest)request).getContextPath();
			((HttpServletResponse)response).sendRedirect(contextPath + "/faces/index.jsp");
			return;
		}


	}

	public void init(FilterConfig config) throws ServletException {
		// Nothing to do here!
	}

	public void destroy() {
		// Nothing to do here!
	}  

}
