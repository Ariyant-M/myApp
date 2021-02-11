

<!--- <cfscript>
	writeDump(var='#cacheGetAllIds()#');
	writeDump(cacheGet('cacheProducts'));
</cfscript>
<cfcache name="lis" action="get" id="cacheProducts">
<cfoutput query="lis">
	<h2> #FLD_PRODUCTNAME# </h2>
	<P>FLD_PRODUCTDETAILS</P>
</cfoutput> --->
<cfscript>
	products = cacheGet('cacheProducts');
	if(isNull(products)){
		productComponent = createObject('component', 'components.getProductDetails').getAllProduct();
		cachePut('cacheProducts', productComponent);
	}
</cfscript>
<cfdump var="#products#">