$(document).ready(function () {
	$('.ajaxPagination li a').click(function(e) {
		e.preventDefault();
		paginationClick($(this));
	});	
});

function paginationClick(link) {
	var parent = $(link).closest('div[class*="paginationData"]');	
	var paginationHandler = $(parent).attr('data-paginationHandler');		
	switch(paginationHandler) {
		case 'ajaxRulePaginator':
		rulePagination(link);
		break;
		case 'ajaxSearchPaginator':
		searchPagination(link);
		break;
		case 'ajaxPlantEquipmentPhotosPaginator':
		case 'ajaxPlantEquipmentServicesPaginator':
		plantEquipmentPagination(link);
		break;
	}	
}

function searchPagination(link) {
	var parent = $(link).closest('div[class*="paginationData"]');	
	var container = $(parent).attr('data-container');
	var criteria = $(parent).attr('data-criteria');
	var perPage = $(parent).attr('data-perPage');
	var currentPage= $(link).attr('href').match(/currentPage=([0-9]+)/)[1];
	var paginationHandler = $(parent).attr('data-paginationHandler');		

	var url = "/apps/" + paginationHandler + ".cfm?criteria=" + criteria + "&currentPage=" + currentPage + "&perPage=" + perPage;	

	ajaxCall(url, container);
}

function rulePagination(link) {
	var parent = $(link).closest('div[class*="paginationData"]');
	var objectId = $(parent).attr('data-objectId');		
	var container = $(parent).attr('data-container');
	var objectTypename = $(parent).attr('data-objectTypename');	
	var paginationHandler = $(parent).attr('data-paginationHandler');	
	var currentPage= $(link).attr('href').match(/currentPage=([0-9]+)/)[1];	
	
	var url = "/apps/" + paginationHandler + ".cfm?objectId=" + objectId + "&currentPage=" + currentPage + "&objectTypename=" + objectTypename;	

	ajaxCall(url, container);
}

function ajaxCall(url, container) {
	jQuery.ajax({
	  type: "GET",
	  url: url,
	  dataType: "json",
	  success: function(response){			  
	  	$(container).html(response.SHTML);

	  	if (typeof(response.HASH) !== 'undefined') {
	  		location.hash = response.HASH;
	  	}

	  	if (typeof(response.CALLBACK) !== 'undefined') {
	  		ajaxCallback(response.CALLBACK);
	  	}

	  	$('.ajaxPagination li a').click(function(e) {
			e.preventDefault();
			paginationClick($(this));
		});	
	  },
	  error: function(response) {	
	  }
	 
	});	
}

function searchByHash() {
	var hash =window.location.hash;
	
    if (hash.length > 0) {
      var criteria = hash.match(/criteria=([A-Za-z0-9]+)/) != null ? hash.match(/criteria=([A-Za-z0-9]+)/)[1] : '';
      var currentPage = hash.match(/currentPage=([0-9]+)/) != null ? hash.match(/currentPage=([0-9]+)/)[1] : '';
      var perPage =hash.match(/perPage=([0-9]+)/) != null ? hash.match(/perPage=([0-9]+)/)[1] : '';    	

      if (criteria != '' && currentPage !='' && perPage != '') {
        var url = "/apps/ajaxSearchPaginator.cfm?criteria=" + criteria + "&currentPage=" + currentPage +"&perPage=" + perPage; 
        ajaxCall(url, ".searchResultsWrapper");
      }
    }
}
