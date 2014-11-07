package vn.onepay.cdr.filter.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import vn.onepay.cdr.filter.dao.CdrFilterDAO;
import vn.onepay.cdr.filter.model.SmsCdrFilter;

@Service
public class CdrFilterDAOImpl implements CdrFilterDAO {

	@Autowired HibernateTemplate baseHibernateTempate; 

	final String[] colNames = {"id", "transactionRef", "msisdn", "merchant", "serviceNumber", "paymentProvider", "commandCode", "contentService", "chargingTime"};
	@SuppressWarnings("unchecked")
	@Override
	public List<SmsCdrFilter> findSmsCdrFilters(final List<String> msisdns, final List<String> commandCodes,
			final List<String> providers, final List<String> merchants, final List<String[]> exceptCmds, final Date fromTime,
			final Date toTime, final List<String> groupByCols, final List<String> countByCols, final List<String> orderByCols, final int limit, final int offset) {
		return baseHibernateTempate.execute(new HibernateCallback<List<SmsCdrFilter>>() {

			@Override
			public List<SmsCdrFilter> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String alias = "p";
				Criteria c = session.createCriteria(SmsCdrFilter.class, alias);
				ProjectionList pl = Projections.projectionList();
				if(groupByCols != null && groupByCols.size() > 0) {
					for(String colName : groupByCols)
						pl.add(Projections.groupProperty(colName), colName);
				}
				
				if(countByCols != null && countByCols.size() > 0) {
					for(String colName : countByCols) {
						String[] params = colName.split(":");
						if(params.length == 2) {
							pl.add(Projections.count(params[0]), params[1]);
						} else if(params.length > 2) {
							if("sum".equalsIgnoreCase(params[0])) {
								pl.add(Projections.sum(params[1]), params[2]);
							} else if("distinct".equalsIgnoreCase(params[0])) {
								pl.add(Projections.countDistinct(params[1]), params[2]);
							} else {
								pl.add(Projections.count(params[1]), params[2]);
							}
						}
					}
				}
				
				
				c.setProjection(pl);
				
				c = getInCriteria(c, alias + ".msisdn", msisdns);
				c = getInCriteria(c, alias + ".commandCode", commandCodes); 
				c = getInCriteria(c, alias + ".paymentProvider", providers); 
				c = getInCriteria(c, alias + ".merchant", merchants);
				
				if(exceptCmds != null && exceptCmds.size() > 0) {
					for(String[] cmds : exceptCmds) {
						c.add(Restrictions.or(
								Restrictions.ne(alias + ".paymentProvider", cmds[0]),
								Restrictions.and(Restrictions.eq(alias + ".paymentProvider", cmds[0]), Restrictions.ne(alias + ".commandCode", cmds[1]).ignoreCase())
							));
					}
				}
				
				if(fromTime != null) {
					c.add(Restrictions.ge(alias + ".chargingTime", fromTime));
				}
				if(toTime != null) {
					c.add(Restrictions.le(alias + ".chargingTime", toTime));
				}
				
				if(orderByCols != null && orderByCols.size() > 0) {
					for(String colName : orderByCols) {
						String[] params = colName.split(":");
						if(params.length == 2) {
							if("desc".equalsIgnoreCase(params[1])) {
								c.addOrder(Order.desc(params[0]));
							} else {
								c.addOrder(Order.asc(params[0]));
							}
						} else {
							c.addOrder(Order.desc(params[0]));
						}
					}
				}
				
				if(limit>0) {
					c.setMaxResults(limit);
				}
				if(offset>0) {
					c.setFirstResult(offset);
				}
				
				return (List<SmsCdrFilter>) c.setResultTransformer(Transformers.aliasToBean(SmsCdrFilter.class)).list();
			}
			
		});
		
	}
	
	private <T> Criteria getInCriteria(Criteria c, String colName, List<T> colValues) {
		if(colValues != null && colValues.size() > 0) {
			List<T> colVls = new ArrayList<T>();
			for(T vl : colValues)
				if(vl != null)
					colVls.add(vl);
					
			if(colVls.size() == 1)
				c.add(Restrictions.like(colName, "%" + colVls.get(0) + "%"));
			else
				c.add(Restrictions.in(colName, (Object[]) colVls.toArray()));
		}
		return c;
	}

	@Override
	public int findTotalSmsCdrFilters(final List<String> msisdns,
			final List<String> commandCodes, final List<String> providers,
			final List<String> merchants, final List<String[]> exceptCmds, 
			final Date fromTime, final Date toTime,
			final List<String> groupByCols) {
		return baseHibernateTempate.execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				String alias = "p";
				Criteria c = session.createCriteria(SmsCdrFilter.class, alias);
				ProjectionList pl = Projections.projectionList().add(Projections.count("id"));
				c.setProjection(pl);
				
				c = getInCriteria(c, alias + ".msisdn", msisdns);
				c = getInCriteria(c, alias + ".commandCode", commandCodes); 
				c = getInCriteria(c, alias + ".paymentProvider", providers); 
				c = getInCriteria(c, alias + ".merchant", merchants);
				
				if(exceptCmds != null && exceptCmds.size() > 0) {
					for(String[] cmds : exceptCmds)
						c.add(Restrictions.or(
								Restrictions.ne(alias + ".paymentProvider", cmds[0]),
								Restrictions.and(Restrictions.eq(alias + ".paymentProvider", cmds[0]), Restrictions.ne(alias + ".commandCode", cmds[1]).ignoreCase())));
				}
				
				if(fromTime != null) {
					c.add(Restrictions.ge(alias +".chargingTime", fromTime));
				}
				if(toTime != null) {
					c.add(Restrictions.le(alias + ".chargingTime", toTime));
				}
				
				try {
					return (Integer) c.list().get(0);
				} catch (Exception e) {
				}
				return 0;
			}
			
		});
	}

	@Override
	public List<SmsCdrFilter> findSmsCdrFilters(final List<String> msisdns, final List<Integer> totalMSISDN,
			final List<String> commandCodes, final List<String> providers,
			final List<String> merchants, final List<String[]> exceptCmds,
			final Date fromTime,final  Date toTime,
			final List<String> orderByCols,final int limit, final int offset) {
		return baseHibernateTempate.execute(new HibernateCallback<List<SmsCdrFilter>>() {

			@SuppressWarnings("unchecked")
			@Override
			public List<SmsCdrFilter> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String alias = "p";
				Criteria c = session.createCriteria(SmsCdrFilter.class, alias);
				ProjectionList pl = Projections.projectionList();
				
				for(String colName : colNames) {
					pl.add(Projections.property(colName), colName);
				}
				
				String sql = "(case ${whenClause} end) as totalSMS";
				String when = "";
				for(int i=0; i < Math.min(msisdns.size(), totalMSISDN.size()); i++) {
					when += "when msisdn='"+msisdns.get(i)+"' then " + totalMSISDN.get(i) + " ";
				}
				if(when.length() > 0) {
					sql = sql.replace("${whenClause}", when);
				} else {
					sql = "0 as totalSMS";
				}
				pl.add(Projections.sqlProjection(sql, new String[] {"totalSMS"}, new Type[] {Hibernate.INTEGER}), "totalSMS");
				
				c.setProjection(pl);
				
				c = getInCriteria(c, alias + ".msisdn", msisdns);
				c = getInCriteria(c, alias + ".commandCode", commandCodes); 
				c = getInCriteria(c, alias + ".paymentProvider", providers); 
				c = getInCriteria(c, alias + ".merchant", merchants);
				
				if(exceptCmds != null && exceptCmds.size() > 0) {
					for(String[] cmds : exceptCmds)
						c.add(Restrictions.or(
								Restrictions.ne(alias + ".paymentProvider", cmds[0]),
								Restrictions.and(Restrictions.eq(alias + ".paymentProvider", cmds[0]), Restrictions.ne(alias + ".commandCode", cmds[1]).ignoreCase())));
				}
				
				if(fromTime != null) {
					c.add(Restrictions.ge(alias + ".chargingTime", fromTime));
				}
				if(toTime != null) {
					c.add(Restrictions.le(alias + ".chargingTime", toTime));
				}
				
				if(orderByCols != null && orderByCols.size() > 0) {
					for(String colName : orderByCols) {
						String[] params = colName.split(":");
						if(params.length == 2) {
							if("desc".equalsIgnoreCase(params[1])) {
								c.addOrder(Order.desc(params[0]));
							} else {
								c.addOrder(Order.asc(params[0]));
							}
						} else {
							c.addOrder(Order.desc(params[0]));
						}
					}
				}
				
				if(limit>0) {
					c.setMaxResults(limit);
				}
				if(offset>0) {
					c.setFirstResult(offset);
				}
				
				return (List<SmsCdrFilter>) c.setResultTransformer(Transformers.aliasToBean(SmsCdrFilter.class)).list();
			}
			
		});
	}

	@Override
	public int findTotalSmsCdrFilters(final List<String> msisdns,
			final List<Integer> totalMSISDN, final List<String> commandCodes,
			final List<String> providers, final List<String> merchants,
			final List<String[]> exceptCmds, final Date fromTime, final Date toTime) {
		return baseHibernateTempate.execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				String alias = "p";
				Criteria c = session.createCriteria(SmsCdrFilter.class, alias);
				ProjectionList pl = Projections.projectionList().add(Projections.count("id"));
				c.setProjection(pl);
				
				c = getInCriteria(c, alias + ".msisdn", msisdns);
				c = getInCriteria(c, alias + ".commandCode", commandCodes); 
				c = getInCriteria(c, alias + ".paymentProvider", providers); 
				c = getInCriteria(c, alias + ".merchant", merchants);
				
				if(exceptCmds != null && exceptCmds.size() > 0) {
					for(String[] cmds : exceptCmds)
						c.add(Restrictions.or(
								Restrictions.ne(alias + ".paymentProvider", cmds[0]),
								Restrictions.and(Restrictions.eq(alias + ".paymentProvider", cmds[0]), Restrictions.ne(alias + ".commandCode", cmds[1]).ignoreCase())));
				}
				
				if(fromTime != null) {
					c.add(Restrictions.ge(alias + ".chargingTime", fromTime));
				}
				if(toTime != null) {
					c.add(Restrictions.le(alias + ".chargingTime", toTime));
				}
				
				try {
					return (Integer) c.list().get(0);
				} catch (Exception e) {
				}
				return 0;
			}
			
		});
	}
}
