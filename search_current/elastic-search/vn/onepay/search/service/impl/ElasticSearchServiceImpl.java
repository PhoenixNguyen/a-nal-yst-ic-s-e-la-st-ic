package vn.onepay.search.service.impl;

import static org.elasticsearch.index.query.QueryBuilders.matchAllQuery;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.map.LinkedMap;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.FilterBuilders;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.FacetedPage;
import org.springframework.data.elasticsearch.core.facet.request.HistogramFacetRequestBuilder;
import org.springframework.data.elasticsearch.core.facet.request.TermFacetRequestBuilder;
import org.springframework.data.elasticsearch.core.facet.result.HistogramResult;
import org.springframework.data.elasticsearch.core.facet.result.IntervalUnit;
import org.springframework.data.elasticsearch.core.facet.result.Term;
import org.springframework.data.elasticsearch.core.facet.result.TermResult;
import org.springframework.data.elasticsearch.core.query.Criteria;
import org.springframework.data.elasticsearch.core.query.CriteriaQuery;
import org.springframework.data.elasticsearch.core.query.IndexQuery;
import org.springframework.data.elasticsearch.core.query.IndexQueryBuilder;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.SearchQuery;

import vn.onepay.search.service.ElasticSearchService;

public class ElasticSearchServiceImpl implements ElasticSearchService {
	@SuppressWarnings("unused")
	private final static Logger logger = Logger.getLogger(ElasticSearchServiceImpl.class);

	public static String QUERY_FACET = "facet";
	public static String QUERY_HISTOGRAM = "histogram";
	public static long INTERVAL_TIME = 6 * 60 * 1000;

	private ElasticsearchTemplate elasticsearchTemplate;

	public void setElasticsearchTemplate(ElasticsearchTemplate elasticsearchTemplate) {
		this.elasticsearchTemplate = elasticsearchTemplate;
	}

	@Override
	public <T> boolean checkIndex(Class<T> clazz) {
		return elasticsearchTemplate.indexExists(clazz);
	}
	
	@Override
	public <T> boolean createIndex(Class<T> clazz) {
		// TODO Auto-generated method stub
		return elasticsearchTemplate.createIndex(clazz);
	}

	public <T> boolean deleteIndex(Class<T> clazz) {

		if (elasticsearchTemplate.indexExists(clazz))
			return elasticsearchTemplate.deleteIndex(clazz);
		return false;
	}

	public <T> String remove(Class<T> clazz, String id) {

		if (elasticsearchTemplate.indexExists(clazz))
			return elasticsearchTemplate.delete(clazz, id);
		return "";
	}

	public <T> void bulkIndex(List<String> idList, List<T> objectList) {
		if (objectList == null)
			return;
		List<IndexQuery> indexQuerys = new ArrayList<IndexQuery>();

		int i = 0;
		for (T value : objectList) {
			IndexQuery query = new IndexQueryBuilder().withId(idList.get(i)).withObject(value).build();
			indexQuerys.add(query);

			i++;
		}
		elasticsearchTemplate.bulkIndex(indexQuerys);
	}

	public <T> boolean exist(String id, Class<T> clazz) {
		if (elasticsearchTemplate.queryForObject(new CriteriaQuery(Criteria.where("id").is(id)), clazz) == null) {
			return false;
		} else
			return true;
	}
	
	@Override
	public <T> String reindex(String id, T object, Class<T> clazz) {
		if(exist(id, clazz)){
		  remove(clazz, id);
		}
		return index(id, object);
	}

	public <T> String index(String id, T object) {
		if (object == null)
			return "null value";
		return elasticsearchTemplate.index(new IndexQueryBuilder().withId(id).withObject(object).build());
	}

	public <T> int count(List<String> fields, List<String> terms, Map<String, List<String>> keywords, int facetSize, Class<T> clazz) {
		return getTotalRecords(queryString("", fields, terms, keywords, null, -1, -1, facetSize, QUERY_FACET), clazz);
	}

	private <T> int getTotalRecords(SearchQuery searchQuery, Class<T> clazz) {
		FacetedPage<T> result = elasticsearchTemplate.queryForPage(searchQuery, clazz);
		return (int) result.getTotalElements();
	}

	public <T> long count(SearchQuery query, Class<T> clazz) {
		long count = elasticsearchTemplate.count(query, clazz);
		// logger.info("COUNT Query = " + count);
		return count;
	}

	private <T> int countAllData(Class<T> clazz) {
		NativeSearchQueryBuilder queryBuilder = new NativeSearchQueryBuilder().withQuery(matchAllQuery());

		return (int) elasticsearchTemplate.count(queryBuilder.build(), clazz);
	}

	@Override
	public <T> List<List<Term>> getFacets(List<String> fields, List<String> terms, Map<String, List<String>> keywords, int facetSize, Class<T> clazz) {

		List<List<Term>> termLists = new ArrayList<List<Term>>();

		if (fields == null)
			return termLists;

		int i = 0;
		for (String f : fields) {
			if (terms == null) {
				int countAll = countAllData(clazz);
				termLists.add(i, getFacets(f, fields, terms, keywords, countAll, clazz));
			} else {
				if (!terms.get(i).equals("")) {
					termLists.add(i, Arrays.asList(new Term(terms.get(i), getTotalRecords(
							queryString("", fields, terms, keywords, null, -1, -1, facetSize, QUERY_FACET), clazz))));
				} else {
					List<String> termTemps = new ArrayList<String>();
					termTemps.addAll(terms);
					termTemps.set(i, "");
					termLists.add(i, getFacets(f, fields, termTemps, keywords, facetSize, clazz));
				}
			}
			i++;
		}
		return termLists;
	}

	private <T> List<Term> getFacets(String field, List<String> fields, List<String> terms, Map<String, List<String>> keywords, int facetSize, Class<T> clazz) {

		TermResult facet = (TermResult) elasticsearchTemplate.queryForPage(queryString(field, fields, terms, keywords, null, 0, 0, facetSize, QUERY_FACET),
				clazz).getFacet(field);

		return facet.getTerms();
	}

	public <T> List<IntervalUnit> getHistogramFacets(String field, List<String> fields, List<String> terms, Map<String, List<String>> keywords, int facetSize,
			Class<T> clazz) {
		HistogramResult facet = (HistogramResult) elasticsearchTemplate.queryForPage(
				queryString(field, fields, terms, keywords, null, 0, 0, facetSize, QUERY_HISTOGRAM), clazz).getFacet(field);
		List<IntervalUnit> unitList = facet.getIntervalUnit();
		return unitList;
	}

	public <T> List<T> search(List<String> fields, List<String> terms, Map<String, List<String>> keywords, Map<String, SortOrder> sorts, int page, int size,
			int facetSize, Class<T> clazz) {

		Iterable<T> resultIterable = elasticsearchTemplate.queryForPage(queryString("", fields, terms, keywords, sorts, page, size, facetSize, QUERY_FACET),
				clazz);

		List<T> resultList = new ArrayList<T>();

		CollectionUtils.addAll(resultList, resultIterable.iterator());
		return resultList;
	}

	private SearchQuery queryString(String field, List<String> fields, List<String> terms, Map<String, List<String>> keywords, Map<String, SortOrder> sorts,
			int page, int size, int facetSize, String typeQuery) {

		NativeSearchQueryBuilder queryBuilder = new NativeSearchQueryBuilder().withQuery(matchAllQuery());

		// And
		List<FilterBuilder> andFilterBuilders = new ArrayList<FilterBuilder>();
		if (terms != null && terms.size() > 0) {
			int i = 0;
			for (String f : fields) {
				if (StringUtils.isNotBlank(terms.get(i))) {
				  andFilterBuilders.add(FilterBuilders.termFilter(f, terms.get(i)));
				}
				i++;
			}
		}
		// Regex
		List<FilterBuilder> regexFilterBuilders = new ArrayList<FilterBuilder>();
		// Term
		List<FilterBuilder> termFilterBuilders = new ArrayList<FilterBuilder>();
		// In
		@SuppressWarnings("unchecked")
		Map<String, List<String>> inMap = new LinkedMap();
		// NOT In
		@SuppressWarnings("unchecked")
		Map<String, List<String>> notInMap = new LinkedMap();
		// Time range
		@SuppressWarnings("unchecked")
		Map<String, List<String>> timeRangeMap = new LinkedMap();

		if (keywords != null) {
			Set<String> keys = keywords.keySet();
			if (keys.size() > 0)
				for (String key : keys) {
					String startKey[] = key.split("_operator_");

					String keyField = startKey[0];
					String operator = startKey[1];

					List<String> values = keywords.get(key);
					// logger.info(keyField + " " + values);

					if (values != null && values.size() > 0) {
						if (operator.equals("regex"))
						  regexFilterBuilders.add(FilterBuilders.regexpFilter(keyField, ".*" + values.get(0) + ".*"));
						else if (operator.equals("term")) {
						  termFilterBuilders.add(FilterBuilders.termFilter(keyField, values.get(0)));
						} else if (operator.equals("in")) {
							inMap.put(keyField, values);
						} else if (operator.equals("not_in")) {
							notInMap.put(keyField, values);
						} else if (operator.equals("time_range")) {
							timeRangeMap.put(keyField, values);
						}
					}
				}
		}

		// In
		if (inMap != null && inMap.size() > 0) {
			for (String key : inMap.keySet()) {
				// logger.info(key + " " + inMap.get(key));
			  andFilterBuilders.add(FilterBuilders.inFilter(key, inMap.get(key)));
			}
		}

		// NOT IN
		if (notInMap != null && notInMap.size() > 0) {
			for (String key : notInMap.keySet()) {
			  andFilterBuilders.add(FilterBuilders.notFilter(FilterBuilders.inFilter(key, notInMap.get(key))));
			}
		}

		// Time range
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		if (timeRangeMap != null && timeRangeMap.size() > 0) {
			for (String key : timeRangeMap.keySet()) {
				// logger.info("Time Range: size = " + timeRangeMap.size() + " "
				// + key + " " + timeRangeMap.get(key));

				List<String> timeRangeList = timeRangeMap.get(key);
				if (timeRangeList == null || timeRangeList.size() <= 0)
					continue;

				List<FilterBuilder> timeRangeOrFilterBuilders = new ArrayList<FilterBuilder>();
				try {
					for (int i = 0; i < timeRangeList.size(); i += 2) {
						String from = timeRangeMap.get(key).get(i);
						String to = timeRangeMap.get(key).get(i + 1);

						Date fromDate = null;
						Date toDate = null;

						if (!from.equals(""))
							fromDate = df.parse(from);
						if (!to.equals("")) {
							toDate = df.parse(to);

						}
						if (fromDate != null && toDate != null)
						  timeRangeOrFilterBuilders.add(FilterBuilders.rangeFilter(key).from(fromDate.getTime()).to(toDate.getTime()));
						else
						  if (fromDate != null && toDate == null)
	              timeRangeOrFilterBuilders.add(FilterBuilders.rangeFilter(key).from(fromDate.getTime()));
						  else
	              if (fromDate == null && toDate != null)
	                timeRangeOrFilterBuilders.add(FilterBuilders.rangeFilter(key).to(toDate.getTime()));
					}
					// Add
					if (timeRangeOrFilterBuilders != null && timeRangeOrFilterBuilders.size() > 0)
					  andFilterBuilders.add(FilterBuilders.orFilter(timeRangeOrFilterBuilders.toArray(new FilterBuilder[timeRangeOrFilterBuilders.size()])));

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		// Or with regexs
		if (regexFilterBuilders != null && regexFilterBuilders.size() > 0)
		  andFilterBuilders.add(FilterBuilders.orFilter(regexFilterBuilders.toArray(new FilterBuilder[regexFilterBuilders.size()])));

		// And term exact
		if (termFilterBuilders != null && termFilterBuilders.size() > 0)
		  andFilterBuilders.add(FilterBuilders.andFilter(termFilterBuilders.toArray(new FilterBuilder[termFilterBuilders.size()])));

		// And all
		queryBuilder.withFilter(FilterBuilders.andFilter(andFilterBuilders.toArray(new FilterBuilder[andFilterBuilders.size()])));

		// Sorts
		if (sorts != null && sorts.size() > 0)
			for (String fie : sorts.keySet()) {
				queryBuilder.withSort(new FieldSortBuilder(fie).ignoreUnmapped(true).order(sorts.get(fie)));
			}

		if (size > 0)
			queryBuilder.withPageable(new PageRequest(page, size));

		if (!field.equals("")) {
			if (typeQuery.equalsIgnoreCase(QUERY_FACET)) {
				// logger.info("QUERY_FACET _______________ ");
				queryBuilder.withFacet(new TermFacetRequestBuilder(field).applyQueryFilter().fields(field).descCount().size(facetSize).build());
			}
			if (typeQuery.equalsIgnoreCase(QUERY_HISTOGRAM)) {
				// logger.info("QUERY_HISTOGRAM _______________ ");
				queryBuilder.withFacet(new HistogramFacetRequestBuilder(field).field(field).interval(INTERVAL_TIME).applyQueryFilter().build());
			}
		}
		return queryBuilder.build();
	}

}
