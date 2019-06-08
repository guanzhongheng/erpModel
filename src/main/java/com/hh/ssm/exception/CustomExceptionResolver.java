package com.hh.ssm.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomExceptionResolver implements HandlerExceptionResolver {



    /**
     * 前端控制器DispatcherServlet在进行HandlerMapping、调用HandlerAdapter执行Handler过程中，如果遇到异常就会执行此方法
     * handler最终要执行的Handler，它的真实身份是HandlerMethod
     * Exception ex就是接收到异常信息
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse,
                                         Object o,
                                         Exception e) {
        // 输出异常
        e.printStackTrace();

        // 统一处理代码
        // 系统异常处理
        // 异常信息
        String message=null;
        CustomException customException = null;
        if(e instanceof CustomException){
            customException = (CustomException) e;
        }else{
            //针对非CustomException异常，对这类重新构造成一个CustomException，异常信息为“未知错误”
            customException = new CustomException("未知错误");
        }
        message = customException.getMessage();
        httpServletRequest.setAttribute("message",message);

        try {
            //转向到错误 页面
            httpServletRequest.getRequestDispatcher("/error.jsp").forward(httpServletRequest, httpServletResponse);
        } catch (ServletException ex) {
            // TODO Auto-generated catch block
            ex.printStackTrace();
        } catch (IOException ex) {
            // TODO Auto-generated catch block
            ex.printStackTrace();
        }
        return new ModelAndView();
    }
}
