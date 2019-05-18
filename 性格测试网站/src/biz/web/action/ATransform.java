package biz.web.action;

import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.Constant;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;
import biz.entity.main.Personality;
import biz.entity.main.Transform;
import biz.web.service.impl.BizService;

@Controller
@RequestMapping("/sys")
public class ATransform extends BaseAction {
	@Autowired
	private BizService service;

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/add2Transform.do", method = RequestMethod.GET)
	public String add2() {
		List list = service.findAll(Personality.class);
		request.setAttribute("list", list);
		return "sys/addTransform";
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/getTransform.do", method = RequestMethod.GET)
	public String get(int uid) {
		try {
			Transform bean = (Transform) service.get(Transform.class, uid);
			request.setAttribute("modifybean", bean);
			List list = service.findAll(Personality.class);
			request.setAttribute("list", list);
			return "sys/modifyTransform";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteTransform.do")
	public String delete(String ids) {
		try {
			service.delete(Transform.class, ids);
			MessageUtil.addRelMessage(request, "删除信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addTransform.do")
	public String add(Transform bean) {
		try {
			if(bean.getPersonality1().getId()==bean.getPersonality2().getId()){
				MessageUtil.addMessage(request, "转换前后人格不能相同.");
				return ERROR;
			}
			service.add(bean);
			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateTransform.do")
	public String update(Transform bean) {
		try {
			if(bean.getPersonality1().getId()==bean.getPersonality2().getId()){
				MessageUtil.addMessage(request, "转换前后人格不能相同.");
				return ERROR;
			}
			service.update(bean);
			MessageUtil.addMessage(request, "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/queryTransform.do")
	public String query() {
		try {
			int pageNum = 0;
			String t = request.getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) session.getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = request.getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = request.getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Transform.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Transform.class);

			session.setAttribute(Constant.SESSION_PAGE, page);
			return "sys/listTransform";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
