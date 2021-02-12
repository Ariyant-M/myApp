

<!--- <cfscript>
	writeDump(var='#cacheGetAllIds()#');
	writeDump(cacheGet('cacheProducts'));
</cfscript>
<cfcache name="lis" action="get" id="cacheProducts">
<cfoutput query="lis">
	<h2> #FLD_PRODUCTNAME# </h2>
	<P>FLD_PRODUCTDETAILS</P>
</cfoutput> --->
<!--- <cfscript>
	products = cacheGet('cacheProducts');
	if(isNull(products)){
		productComponent = createObject('component', 'components.productsComponent').getAllProduct();
		cachePut('cacheProducts', productComponent);
	}
	a = structNew();
	for(i in products){
		a[#i.FLD_PRODUCTID#]={FLD_PRODUCTNAME = '#i.FLD_PRODUCTNAME#', FLD_PRODUCTDETAILS = '#FLD_PRODUCTDETAILS#'};
	}
	writeDump(a);
</cfscript>
 --->
 <cfset obj =createObject('component', 'components.productsComponent').queryToStruct() >
 <cfdump var="#obj.2#">
 <cfset a = structNew()>
 <cfset l =2>
 <cfscript>
 	if(structKeyExists(obj, '#l#')){
 		a = objl.;
 	}
 	writeDump(a);
 </cfscript>
