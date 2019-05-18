package biz.web.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import biz.entity.main.Personality;
import biz.entity.main.Ques;
import biz.entity.main.QuesItem;
import biz.entity.main.QuesType;
import biz.entity.main.SimpleUser;
import biz.entity.main.SysUser;
import biz.entity.main.Transform;
import biz.entity.main.User;
import biz.entity.main.UserResult;
import biz.web.dao.ISysDao;
import common.service.BaseService;
import util.MD5;
import util.NumberUtil;
import util.Page;
import util.StringUtil;

@Service("bizService")
@Repository
public class BizService extends BaseService {

	@Autowired
	private ISysDao dao;

	public List queryByHQL(String hql, Object... values) {
		return dao.queryByHQL(hql, values);
	}

	public void addSimpleUser(SimpleUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	public void updateSimpleUser(SimpleUser obj) {
		SimpleUser temp = (SimpleUser) dao.get(SimpleUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	/**
	 * 添加对象
	 * 
	 * @param obj
	 */
	public void add(Object obj) {
		dao.save(obj);
	}

	/**
	 * 修改对象
	 * 
	 * @param obj
	 */
	public void update(Object obj) {
		dao.merge(obj);
	}

	/**
	 * 根据id获取对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object get(Class clazz, Serializable id) {
		return dao.get(clazz, id);
	}

	public void deleteUser(String ids) {
		dao.deleteByIds(User.class, ids);
	}

	public void delete(Class clazz, String ids) {
		dao.deleteByIds(clazz, ids);
	}

	public Object findUser(String type, String userid, String pwd) {
		return dao.queryUser(type, userid, pwd);
	}

	public User findUser(String userid) {
		return dao.queryUser(userid);
	}

	public Page findUser(Page page) {
		return dao.list(page, "User");
	}

	public Page find(Page page, Class clazz) {
		return dao.list(page, clazz.getSimpleName());
	}

	public List findAll(Class clazz) {
		return dao.queryByHQL("from " + clazz.getSimpleName());
	}

	public void addSysUser(SysUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	public void updateSysUser(SysUser obj) {
		SysUser temp = (SysUser) dao.get(SysUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	public List findAll(Class clazz, Map<String, Object> params) {
		return dao.findAll(clazz, params);
	}

	public int addListStudent(List<User> list) {
		int count = 0;
		for (User user : list) {
			if (StringUtils.isBlank(user.getUserPassword())) {
				user.setUserPassword("123456");
			}
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));

			SimpleUser su = dao.unique("from SimpleUser where user.uname=?", user.getUname());
			if (su == null) {
				su = new SimpleUser();
				dao.save(user);
				su.setUser(user);
				dao.save(su);
			} else {
				User user1 = su.getUser();
				user1.setUserAddress(user.getUserAddress());
				user1.setUserBirth(user.getUserBirth());
				user1.setUserEmail(user.getUserEmail());
				user1.setUserGender(user.getUserGender());
				user1.setUserName(user.getUserName());
				user1.setUserPhone(user.getUserPhone());
				user1.setUserPassword(user.getUserPassword());
				dao.merge(user1);
			}
			count++;
		}
		return count;
	}

	public void addQues(Ques bean, List<QuesItem> items) {
		dao.save(bean);
		if (items != null) {
			for (QuesItem item : items) {
				if (item != null && item.getName() != null) {
					item.setQues(bean);
					dao.save(item);
				}
			}
		}
	}

	public void updateQues(Ques bean, List<QuesItem> items) {
		dao.update(bean);
		if (items != null) {
			for (QuesItem item : items) {
				if (item != null && item.getName() != null) {
					item.setQues(bean);
					dao.save(item);
				}
			}
		}
	}

	public void updateQuesVote(Ques bean, List<QuesItem> items) {
		dao.updateByHQL("update QuesType set voteType.id=? where id=?", bean.getQuesType().getVoteType().getId(),
				bean.getQuesType().getId());
		dao.update(bean);
		if (items != null) {
			for (QuesItem item : items) {
				if (item != null && item.getName() != null) {
					item.setQues(bean);
					dao.save(item);
				}
			}
		}
	}

	public Ques getQues(int uid) {
		Ques bean = (Ques) dao.get(Ques.class, uid);

		List<QuesItem> itemList = dao.queryByHQL("from QuesItem where ques.id=" + uid);
		bean.setItemList(itemList);

		return bean;
	}

	public List<QuesType> findAllQuesType() {
		List<QuesType> list = dao.queryByHQL("from QuesType order by id");

		for (QuesType qt : list) {
			List<Ques> list1 = dao.queryByHQL("from Ques where quesType.id=? order by id", qt.getId());

			for (Ques q : list1) {
				List<QuesItem> list2 = dao.queryByHQL("from QuesItem where ques.id=? order by id", q.getId());
				q.setItemList(list2);
			}

			qt.setQuesList(list1);
		}

		return list;
	}

	public UserResult getUserVoteResult(Integer userid, int quesid) {
		List<UserResult> list = dao.queryByHQL("from UserResult where user.id=? and ques.id=?", userid, quesid);
		if (list.size() > 0)
			return list.get(0);
		return null;
	}

	public void addResult(List<UserResult> resultlist) {
		for (UserResult sr : resultlist) {
			dao.save(sr);
		}
	}

	public SimpleUser findSimpleUserByUname(String uname) {
		return dao.unique("from SimpleUser where user.uname=?", uname);
	}

	public void addQuesType(QuesType bean) {
		int id = (Integer) dao.save(bean);
		String sid = "WJ" + StringUtil.format0String(4, id);
		dao.updateByHQL("update QuesType set sid=? where id=?", sid, id);
	}

	public void addQuesVote(Ques bean, List<QuesItem> items) {
		QuesType quesType = bean.getQuesType();
		quesType.setType("投票");
		int id = (Integer) dao.save(quesType);
		String sid = "WJ" + StringUtil.format0String(4, id);
		dao.updateByHQL("update QuesType set sid=? where id=?", sid, id);

		dao.save(bean);

		if (items != null) {
			for (QuesItem item : items) {
				if (item != null && item.getName() != null) {
					item.setQues(bean);
					dao.save(item);
				}
			}
		}

	}

	public int getUserReusutCount(int itemid) {
		Long temp = dao.unique("select count(*) from UserResult where item.id=?", itemid);
		if (temp == null) {
			return 0;
		} else {
			return temp.intValue();
		}
	}

	public QuesType getQuesType(int uid) {

		QuesType qt = (QuesType) dao.queryByHQL("from QuesType").get(0);

		List<Ques> quesList = dao.queryByHQL("from Ques");
		for (Ques bean : quesList) {
			List<QuesItem> itemList = dao.queryByHQL("from QuesItem where ques.id=" + bean.getId());
			bean.setItemList(itemList);
		}
		qt.setQuesList(quesList);

		return qt;
	}

	public UserResult getUserQuesResult(Integer userid, int typeid) {
		List<UserResult> list = dao.queryByHQL("from UserResult where user.id=? and ques.quesType.id=?", userid, typeid);
		if (list.size() > 0)
			return list.get(0);
		return null;
	}

	public List<Ques> findUserVoteList(Integer userid) {
		return dao.queryByHQL("from Ques where quesType.type='投票' and id in(select ques.id from UserResult where user.id=? )", userid);
	}

	public List<QuesType> findUserQuesList(Integer userid) {
		return dao.queryByHQL("from QuesType where type='问卷' and id in(select ques.quesType.id from UserResult where user.id=? )",
				userid);
	}

	public List<UserResult> findUserVoteList(Integer userid, int quesid) {
		return dao.queryByHQL("from UserResult where user.id=? and ques.id=?", userid, quesid);
	}

	public List<UserResult> findUserQuesList(Integer userid, int quesTypeId) {
		return dao.queryByHQL("from UserResult where user.id=? and ques.quesType.id=?", userid, quesTypeId);
	}

	public void addUserResult(UserResult ur) {
		List<Personality> list = dao.queryByHQL("from Personality where minScore <=? and maxScore >=?", ur.getScore(), ur.getScore());
		Personality p = list.get(0);
		ur.setPersonality(p);
		dao.save(ur);

	}

	public Transform getTransfrom(int id, int id2) {
		return dao.unique("from Transform where personality1.id=? and personality2.id=?", id, id2);
	}

	@SuppressWarnings("rawtypes")
	public void deleteClasses(String ids) {
		if (ids != null) {

			String[] temp = ids.split(",");
			if (temp == null || temp.length <= 0) {
				throw new RuntimeException("ids error");
			}
			for (String str : temp) {
				if (!NumberUtil.isNumeric(str)) {
					throw new RuntimeException("ids error");
				}
			}
			String hql = "";
			hql = "delete Classes where id in(" + ids + ")";
			dao.updateByHQL(hql);
		}
	}

	public void updateResCount(int resid) {
		dao.updateByHQL("update Res set downcount=downcount+1 where id=?", resid);
	}

}
