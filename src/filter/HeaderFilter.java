package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@WebFilter(filterName = "HeaderFilter")
public class HeaderFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpServletRequest = (HttpServletRequest)req;
        String ifMod = httpServletRequest.getHeader("If-Modified-Since");

        if(ifMod != null){
            String str =  req.getParameter("timestamp");
            if(compare(str)){
                HttpServletResponse httpServletResponse = (HttpServletResponse)resp;
                httpServletResponse.setStatus(304, "Not Modified");
                httpServletResponse.getWriter().write("");
                httpServletResponse.getWriter().flush();
                httpServletResponse.getWriter().close();
            }
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }


    private boolean compare(String timestamp){
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");

            formatter = formatter.withLocale(Locale.US);

            LocalDate day = LocalDate.parse(timestamp, formatter);
            LocalDate cday = LocalDate.parse("2020-10-10 00:00:00", formatter);

            if(cday.isBefore(day)){
                return true;
            }
        } catch(Exception e) {

        }
        return false;
    }
}
