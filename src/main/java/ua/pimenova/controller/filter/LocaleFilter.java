package ua.pimenova.controller.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class LocaleFilter implements Filter {
    private String defaultLocale;

    @Override
    public void init(FilterConfig filterConfig) {
        defaultLocale = filterConfig.getInitParameter("defaultLocale");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String locale = httpRequest.getParameter("locale");
        System.out.println(locale);
        if (!isBlank(locale)) {
            httpRequest.getSession().setAttribute("locale", locale);
            ((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getHeader("referer"));
        } else {
            String sessionLocale = (String) httpRequest.getSession().getAttribute("locale");
            if (isBlank(sessionLocale)) {
                httpRequest.getSession().setAttribute("locale", defaultLocale);
            }
            chain.doFilter(request, response);
        }
    }

    private boolean isBlank(String locale) {
        return locale == null || locale.isEmpty();
    }
}
