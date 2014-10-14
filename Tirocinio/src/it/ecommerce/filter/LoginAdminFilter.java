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
 

public class LoginAdminFilter implements Filter {
 
    /**
     * Checks if user is logged in. If not it redirects to the login.xhtml page.
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Get the amministratoreController from session attribute
    	AmministratoreController amministratoreController = (AmministratoreController)((HttpServletRequest)request).getSession().getAttribute("amministratoreController");
         
        // For the first application request there is no amministratoreController in the session so admin needs to log in
        // For other requests amministratoreController is present but we need to check if admin has logged in successfully
        if (amministratoreController == null || amministratoreController.getAmministratore() == null) {
            String contextPath = ((HttpServletRequest)request).getContextPath();
            ((HttpServletResponse)response).sendRedirect(contextPath + "/faces/loginAmministratore.jsp");
            return;
        }
         
        chain.doFilter(request, response);
             
    }
 
    public void init(FilterConfig config) throws ServletException {
        // Nothing to do here!
    }
 
    public void destroy() {
        // Nothing to do here!
    }  
     
}
