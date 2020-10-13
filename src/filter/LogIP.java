package filter;

import javax.servlet.*;
import java.util.Date;
import java.util.Enumeration;


public class LogIP implements Filter {
    public void  init(FilterConfig config) throws ServletException {
        String testParam = config.getInitParameter("test-param");

        System.out.println("Test Param: " + testParam);
    }
    public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws java.io.IOException, ServletException {

        String ipAddress = request.getRemoteAddr();

        Enumeration e = request.getParameterNames();

        String params = "";

        while (e.hasMoreElements()){
            String str = (String)e.nextElement();
            params += request.getParameter(str) + " ";
        }

        System.out.println("IP "+ ipAddress + ", Request "+ params);

        // Pass request back down the filter chain
        chain.doFilter(request,response);
    }
    public void destroy( ) {

    }
}