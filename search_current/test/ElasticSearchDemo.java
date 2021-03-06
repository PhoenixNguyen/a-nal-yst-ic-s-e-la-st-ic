
import static org.elasticsearch.index.query.QueryBuilders.matchAllQuery;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import net.sf.ehcache.search.Query;

import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.index.query.FilterBuilders;
import org.elasticsearch.index.query.IndexQueryParserService;
import org.elasticsearch.search.facet.FacetBuilders;
import org.elasticsearch.search.facet.range.RangeFacetBuilder;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.FacetedPage;
import org.springframework.data.elasticsearch.core.facet.request.RangeFacetRequestBuilder;
import org.springframework.data.elasticsearch.core.facet.request.StatisticalFacetRequestBuilder;
import org.springframework.data.elasticsearch.core.facet.request.TermFacetRequestBuilder;
import org.springframework.data.elasticsearch.core.facet.result.Range;
import org.springframework.data.elasticsearch.core.facet.result.RangeResult;
import org.springframework.data.elasticsearch.core.facet.result.StatisticalResult;
import org.springframework.data.elasticsearch.core.facet.result.Term;
import org.springframework.data.elasticsearch.core.facet.result.TermResult;
import org.springframework.data.elasticsearch.core.query.IndexQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.SearchQuery;
import org.springframework.data.elasticsearch.core.query.UpdateQuery;
import org.springframework.data.elasticsearch.core.query.UpdateQueryBuilder;
import org.springframework.data.elasticsearch.entities.Article;
import org.springframework.data.elasticsearch.entities.ArticleBuilder;

public class ElasticSearchDemo {
	public static final String RIZWAN_IDREES = "Rizwan Idrees";
    public static final String MOHSIN_HUSEN = "Mohsin Husen";
    public static final String JONATHAN_YAN = "Jonathan Yan";
    public static final String ARTUR_KONCZAK = "Artur Konczak";
    public static final int YEAR_2002 = 2002;
    public static final int YEAR_2001 = 2001;
    public static final int YEAR_2000 = 2000;
    
	public static void main(String[] args) {
		
		try{
			ApplicationContext ctx = new ClassPathXmlApplicationContext("/springContext-test.xml");
			ElasticsearchTemplate elasticsearchTemplate = (ElasticsearchTemplate) ctx.getBean("elasticsearchTemplate");
			
			elasticsearchTemplate.deleteIndex(Article.class);
	        elasticsearchTemplate.createIndex(Article.class);
	        elasticsearchTemplate.putMapping(Article.class);
	        elasticsearchTemplate.refresh(Article.class, true);

	        DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String fromStr = "2014-09-17 16:53:38";
			
			String fromStr1 = "2014-09-18 16:53:38";
			String fromStr2 = "2014-09-19 16:53:38";
			String fromStr3 = "2014-09-20 16:53:38";
			
	        IndexQuery article1 = new ArticleBuilder("1").title("article1").addAuthor(RIZWAN_IDREES).addAuthor(ARTUR_KONCZAK).addAuthor(MOHSIN_HUSEN).addAuthor(JONATHAN_YAN).addDate(df2.parse(fromStr)).score(10).buildIndex();
	        IndexQuery article2 = new ArticleBuilder("2").title("article2").addAuthor(RIZWAN_IDREES).addAuthor(ARTUR_KONCZAK).addAuthor(MOHSIN_HUSEN).addPublishedYear(YEAR_2000).addDate(df2.parse(fromStr1)).score(20).buildIndex();
	        IndexQuery article3 = new ArticleBuilder("3").title("article3").addAuthor(RIZWAN_IDREES).addAuthor(ARTUR_KONCZAK).addPublishedYear(YEAR_2001).addPublishedYear(YEAR_2000).addDate(df2.parse(fromStr2)).score(90).buildIndex();
	        IndexQuery article4 = new ArticleBuilder("4").title("article4").addAuthor(RIZWAN_IDREES).addPublishedYear(YEAR_2002).addPublishedYear(YEAR_2001).addPublishedYear(YEAR_2000).addDate(df2.parse(fromStr3)).score(40).buildIndex();
	        IndexQuery article5 = new ArticleBuilder("5").title("article5").addAuthor(RIZWAN_IDREES).addPublishedYear(YEAR_2002).addPublishedYear(YEAR_2001).addPublishedYear(YEAR_2000).addDate(df2.parse(fromStr3)).score(140).buildIndex();

	        elasticsearchTemplate.index(article1);
	        elasticsearchTemplate.index(article2);
	        elasticsearchTemplate.index(article3);
	        elasticsearchTemplate.index(article4);
	        elasticsearchTemplate.index(article5);
	        elasticsearchTemplate.refresh(Article.class, true);
	        
	        System.out.println("Indexing ...");
	        // test
	        shouldReturnFacetedAuthorsForGivenQueryWithDefaultOrder(elasticsearchTemplate);
	        
	        //filter with query
	        //shouldReturnFacetedAuthorsForGivenFilteredQuery(elasticsearchTemplate);
	        
	        //exclude terms in facet
	        //shouldExcludeTermsFromFacetedAuthorsForGivenQuery(elasticsearchTemplate);
	        
	        //Order by facet
	        //shouldReturnFacetedAuthorsForGivenQueryOrderedByTerm(elasticsearchTemplate);
	        
	        //Order by count
	        //shouldReturnFacetedAuthorsForGivenQueryOrderedByCountAsc(elasticsearchTemplate);
	        
	        //Facet for year
	        //shouldReturnFacetedYearsForGivenQuery(elasticsearchTemplate);
	        
	        //Facet author and year
	        //shouldReturnSingleFacetOverYearsAndAuthorsForGivenQuery(elasticsearchTemplate);
	        
	        //two facet
	        //shouldReturnFacetedYearsAndFacetedAuthorsForGivenQuery(elasticsearchTemplate);
	        
	        //regex
	        //shouldFilterResultByRegexForGivenQuery(elasticsearchTemplate);
	        
	        //Range facet
	        //shouldReturnKeyValueRangeFacetForGivenQuery(elasticsearchTemplate);
	        
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
//	public static void elasticRepositoryTest(){
////		ApplicationContext ctx = new ClassPathXmlApplicationContext("/vn/onepay/search/elasticsearch-context.xml");
////		ArticleRepository articleRepository = (ArticleRepository) ctx.getBean("articleRepository");
//		
//		Article article1 = new Article();
//		article1.setId("1");
//		article1.setAuthors(Arrays.asList(new String[]{RIZWAN_IDREES, ARTUR_KONCZAK, MOHSIN_HUSEN, JONATHAN_YAN}));
//		article1.setScore(10);
//		article1.setTitle("article four");
//		
//		Article article2 = new Article();
//		article2.setId("1");
//		article2.setAuthors(Arrays.asList(new String[]{RIZWAN_IDREES, ARTUR_KONCZAK, MOHSIN_HUSEN}));
//		article2.setScore(10);
//		article2.setTitle("article three");
//		
//		articleRepository.save(Arrays.asList(article1, article2));
//		
//		Article article = articleRepository.findOne(article1.getId());
//		System.out.println(article.getTitle());
//		
//		
//	}
	
	public static void shouldReturnFacetedAuthorsForGivenQueryWithDefaultOrder(ElasticsearchTemplate elasticsearchTemplate) {
		try{
			DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			String fromStr = "2014-09-19 16:53:38";
			
			//IndexRequest indexRequest = new IndexRequest("").setSource("", "", "", "");
			
			elasticsearchTemplate.update(new UpdateQueryBuilder().withIndexName("articles").withType("article").withId("5").withIndexRequest(new IndexRequest("articles", "article")).build());
			
			
			// given
	        String facetName = "fauthors";//fauthors
	        RangeFacetBuilder builder = FacetBuilders.rangeFacet(facetName);
	        builder.keyField("title").valueField("score");
	        
	        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
	            //multi range
	            .withFilter(FilterBuilders.orFilter(FilterBuilders.rangeFilter("score").from(10).to(40), FilterBuilders.rangeFilter("score").from(20).to(40)))
	            //.withSort(new FieldSortBuilder("score").ignoreUnmapped(true).order(SortOrder.ASC))
	            //.withFilter(FilterBuilders.scriptFilter("doc['score'].value  >= 40"))
	            
	            //.withFilter(FilterBuilders.scriptFilter("org.elasticsearch.search.scriptfilter.ScriptFilterSearchTests.incrementScriptCounter() >= 2"))
	            .build();
	            //.withFilter(FilterBuilders.notFilter(FilterBuilders.inFilter("id", Arrays.asList(new String[]{"1","2"}))))
	        		//.withFilter(FilterBuilders.andFilter(FilterBuilders.termFilter("title", "four"), FilterBuilders.termFilter("publishedYears", YEAR_2000)))
	        		//.withFilter(FilterBuilders.regexpFilter("title*", "four 45 ghh"))
	        		
	        		//.withFilter(FilterBuilders.r)
	        		//.withFilter(FilterBuilders.rangeFilter("date").from(df2.parse(fromStr).getTime()))
	        		
	            //.withFacet(new TermFacetRequestBuilder(facetName).applyQueryFilter().fields("title").descCount().build()).build();//.untouched
	        		
	            //.withFacet(new StatisticalFacetRequestBuilder(facetName).fields("title","score").build()).build();
	        // when
	        
	        
//	        List<Article> articleList = elasticsearchTemplate.queryForList(searchQuery, Article.class);
//	        
//	        for(Article article : articleList){
//	        	System.out.println(article.getId() + " " + article.getTitle());
//	        }
	        
	        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
	        // then
	        TermResult facet = (TermResult) result.getFacet(facetName);
	        List<Article> articleList = result.getContent();
	        
	        //StatisticalResult facet2 = (StatisticalResult) result.getFacet(facetName);
	        
	        //System.out.println(facet2.getCount() + " "+ facet2.getTotal());
        	/*for(Term term : facet2.getTerms()){
	        	
	        	System.out.println(term.getTerm()+" | " + term.getCount());
	        	for(Article art : articleList){
	        		if(art.getAuthors().contains(term.getTerm())){
	        			System.out.println("	"+art.getId() + " " + art.getTitle());
	        		}
	        	}
	        }*/
	        
	        /*for(Term term : facet.getTerms()){
	        	
	        	System.out.println(term.getTerm()+" | " + term.getCount());
	        	for(Article art : articleList){
	        		if(art.getAuthors().contains(term.getTerm())){
	        			System.out.println("	"+art.getId() + " " + art.getTitle() + " " + art.getScore());
	        		}
	        	}
	        }*/
	        
	        System.out.println("----------------");
	        for(Article art : articleList){
            System.out.println("  "+art.getId() + " " + art.getTitle() + " " + art.getAuthors());
          }
	        
	        elasticsearchTemplate.refresh(Article.class, true);
	        long total = elasticsearchTemplate.count(searchQuery, Article.class);
	        System.out.println("Total:  " + total + " " + result.getNumberOfElements() + " " + result.getTotalElements());
	        
	        
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void shouldReturnFacetedAuthorsForGivenFilteredQuery(ElasticsearchTemplate elasticsearchTemplate) {

        // given
        String facetName = "fauthors";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFilter(FilterBuilders.andFilter(FilterBuilders.termFilter("title", "four")))
                .withFacet(new TermFacetRequestBuilder(facetName).applyQueryFilter().fields("authors.untouched").build()).build();
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }
    }
	
	public static void shouldExcludeTermsFromFacetedAuthorsForGivenQuery(ElasticsearchTemplate elasticsearchTemplate) {
        // given
        String facetName = "fauthors";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                //.withFilter(FilterBuilders.notFilter(FilterBuilders.termFilter("title", "four")))
                .withFacet(new TermFacetRequestBuilder(facetName).applyQueryFilter().fields("authors.untouched").excludeTerms(RIZWAN_IDREES).build()).build();// ARTUR_KONCZAK RIZWAN_IDREES JONATHAN_YAN MOHSIN_HUSEN
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }

    }
	
	public static void shouldReturnFacetedAuthorsForGivenQueryOrderedByTerm(ElasticsearchTemplate elasticsearchTemplate) {

        // given
        String facetName = "fauthors";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFacet(new TermFacetRequestBuilder(facetName).fields("authors.untouched").ascTerm().build()).build();
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }

    }
	
	public static void shouldReturnFacetedAuthorsForGivenQueryOrderedByCountAsc(ElasticsearchTemplate elasticsearchTemplate) {

        // given
        String facetName = "fauthors";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFacet(new TermFacetRequestBuilder(facetName).fields("authors.untouched").ascCount().build()).build();
        // when
        List<Article> articleList = elasticsearchTemplate.queryForList(searchQuery, Article.class);
        
        for(Article article : articleList){
        	System.out.println(article.getId() + " " + article.getTitle());
        }
        
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }
    }
	
	public static void shouldReturnFacetedYearsForGivenQuery(ElasticsearchTemplate elasticsearchTemplate) {

        // given
        String facetName = "fyears";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFacet(new TermFacetRequestBuilder(facetName).fields("publishedYears").descCount().build()).build();
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }
    }
	
	public static void shouldReturnSingleFacetOverYearsAndAuthorsForGivenQuery(ElasticsearchTemplate elasticsearchTemplate) {

        // given
        String facetName = "fyears";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFacet(new TermFacetRequestBuilder(facetName).fields("publishedYears", "authors.untouched").ascTerm().build()).build();
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }

    }
	
	public static void shouldReturnFacetedYearsAndFacetedAuthorsForGivenQuery(ElasticsearchTemplate elasticsearchTemplate) {

        // given
        String numberFacetName = "fAuthors";
        String stringFacetName = "fyears";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFacet(new TermFacetRequestBuilder(numberFacetName).fields("publishedYears").ascTerm().build())
                .withFacet(new TermFacetRequestBuilder(stringFacetName).fields("authors.untouched").ascTerm().build())
                .build();
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult numberFacet = (TermResult) result.getFacet(numberFacetName);
        for(Term term : numberFacet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }
        
        System.out.println("-");
        		
        TermResult stringFacet = (TermResult) result.getFacet(stringFacetName);
        for(Term term : stringFacet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }
    }
	
	public static void shouldFilterResultByRegexForGivenQuery(ElasticsearchTemplate elasticsearchTemplate) {
        // given
        String facetName = "regex_authors";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFilter(FilterBuilders.andFilter(FilterBuilders.regexpFilter("title", ".*ree.*")))
                //.withFilter(FilterBuilders.regexpFilter("authors", ".*"))
                .withFacet(new TermFacetRequestBuilder(facetName).applyQueryFilter().fields("authors.untouched").build()).build();//.regex("Art.*")
        
//        IndexQueryParserService queryParser = queryParser();
//        Query parsedQuery = queryParser.parse(regexpQuery("name.first", "s.*y")).query();
        
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        TermResult facet = (TermResult) result.getFacet(facetName);
        for(Term term : facet.getTerms()){
        	System.out.println(term.getTerm()+" | " + term.getCount());
        }

    }
	
	public static void shouldReturnKeyValueRangeFacetForGivenQuery(ElasticsearchTemplate elasticsearchTemplate) {
        // given
        String facetName = "rangeScoreOverYears";
        SearchQuery searchQuery = new NativeSearchQueryBuilder().withQuery(matchAllQuery())
                .withFacet(
                        new RangeFacetRequestBuilder(facetName).fields("publishedYears", "score")
                                .to(YEAR_2000).range(YEAR_2000, YEAR_2002).from(YEAR_2002).build()
                ).build();
        // when
        FacetedPage<Article> result = elasticsearchTemplate.queryForPage(searchQuery, Article.class);
        // then
        RangeResult facet = (RangeResult) result.getFacet(facetName);
        for(Range range : facet.getRanges()){
        	System.out.println(range.getFrom() +" | " + range.getTo() +" | " + range.getCount() + " | " + range.getTotal());
        }
    }
}
