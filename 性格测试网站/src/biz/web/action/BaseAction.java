package biz.web.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ModelAttribute;

import biz.entity.SessionBean;
import biz.entity.main.SimpleUser;
import common.service.BaseService;
import util.Constant;

public class BaseAction {

	protected static Logger			log		= Logger.getLogger(BaseService.class);

	protected static String			SUCCESS	= "common/success";
	protected static String			ERROR	= "common/error";

	// protected HttpServletRequest request =
	// ((ServletRequestAttributes)RequestContextHolder
	// .getRequestAttributes()).getRequest();

	protected HttpServletRequest	request;
	protected HttpServletResponse	response;
	protected HttpSession			session;

	@ModelAttribute
	protected void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();

	}

	protected Object getSessionUser() {
		SessionBean sb = (SessionBean) session.getAttribute(Constant.SESSION_BEAN);
		return sb.getUser();
	}

	protected SimpleUser getSimpleUser() {
		SessionBean sb = (SessionBean) session.getAttribute(Constant.SESSION_BEAN);
		return (SimpleUser) sb.getUser();
	}

	protected File getResourceFile() {
		File storageFile = new File(session.getServletContext().getRealPath("/resource"));
		return storageFile;
	}

	protected void putRequestValue(String name, Object value) {
		request.setAttribute(name, value);
	}

	protected void putSessionValue(String name, Object value) {
		session.setAttribute(name, value);
	}

	protected HttpServletRequest getHttpServletRequest() {
		return request;
	}

	protected HttpServletResponse getHttpServletResponse() {
		return response;
	}

	protected HttpSession getHttpSession() {
		return request.getSession();
	}

	protected String getString(String name) {
		return getHttpServletRequest().getParameter(name);
	}

	protected int getInt(String name) {
		return Integer.valueOf(getHttpServletRequest().getParameter(name));
	}

	protected double getDouble(String name) {
		return Double.valueOf(getHttpServletRequest().getParameter(name));
	}

	protected float getFloat(String name) {
		return Float.valueOf(getHttpServletRequest().getParameter(name));
	}

	protected void print(String message) {
		try {
			getHttpServletResponse().setCharacterEncoding("UTF-8");
			getHttpServletResponse().getWriter().print(message);
			getHttpServletResponse().getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
