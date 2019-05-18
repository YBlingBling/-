package biz.web.action.sys;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import util.Constant;
import util.ExcelUtil;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;
import biz.entity.main.SimpleUser;
import biz.entity.main.User;
import biz.web.action.BaseAction;
import biz.web.action.FileUtil;
import biz.web.service.impl.BizService;

@Controller
@RequestMapping("/sys")
public class SimpleUserAction extends BaseAction {
	@Autowired
	private BizService service;

	 

	@RequestMapping(value = "/add2SimpleUser.do", method = RequestMethod.GET)
	public String add2() {
		return "sys/addSimpleUser";
	}

	@RequestMapping(value = "/add2Import.do", method = RequestMethod.GET)
	public String add2Import() {
		return "sys/importStudent";
	}

	@RequestMapping(value = "/getSimpleUser.do", method = RequestMethod.GET)
	public String get(int uid) {
		try {
			SimpleUser bean = (SimpleUser) service.get(SimpleUser.class, uid);
			request.setAttribute("modifybean", bean);

			return "sys/modifySimpleUser";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteSimpleUser.do")
	public String delete(String ids) {
		try {
			service.delete(SimpleUser.class, ids);
			MessageUtil.addRelMessage(request, "删除学生信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除学生信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addSimpleUser.do")
	public String add(SimpleUser bean) {
		try {
			service.addSimpleUser(bean);
			MessageUtil.addMessage(request, "添加学生成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加学生失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/importStudent.do")
	public String importStudent() {
		try {
			MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;

			String serverPath = request.getSession().getServletContext().getRealPath("/");

			MultipartFile fileupload = mrequest.getFile("resfile");
			String newFilename = FileUtil.uploadFile(fileupload, 0, serverPath);
			if (StringUtils.isEmpty(newFilename)) {
				MessageUtil.addMessage(request, "请上传Excel 文件");
				return ERROR;
			}

			InputStream in = new FileInputStream(new File(serverPath + File.separator + "resource" + File.separator + newFilename));

			LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>();
			fieldMap.put("学号", "uname");
			fieldMap.put("姓名", "userName");
			fieldMap.put("密码", "userPassword");
			fieldMap.put("性别", "userGender");
			fieldMap.put("联系电话", "userPhone");
			fieldMap.put("邮箱", "userEmail");
			fieldMap.put("联系地址", "userAddress");
			fieldMap.put("出生日期", "userBirth");

			List<User> list = ExcelUtil.excelToList(in, null, User.class, fieldMap, new String[] { "学号" });
			in.close();
			int count = service.addListStudent(list);
			MessageUtil.addMessage(request, "导入成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "导入失败." + e.getMessage());
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateSimpleUser.do")
	public String update(SimpleUser bean) {
		try {
			service.updateSimpleUser(bean);
			MessageUtil.addMessage(request, "更新学生成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新学生失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/querySimpleUser.do")
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
							parmvalues.add(FieldUtil.format(SimpleUser.class, name, fieldValue));
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
			page = service.find(p, SimpleUser.class);

			session.setAttribute(Constant.SESSION_PAGE, page);
			return "sys/listSimpleUser";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
