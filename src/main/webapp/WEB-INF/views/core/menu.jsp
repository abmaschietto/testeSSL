<%@ page language="java" import="javax.servlet.jsp.PageContext" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	
	<c:set var="primeiroNome" value="${fn:split(usuarioLogado.nome, ' ')}" />
 <div>
 	<nav class="navbar navbar-expand-sm " style="background-color: orange;">
         <button class="navbar-toggler" type="button" data-toggle="collapse" aria-label="Toggle navigation">
	          <span class="sr-only">Toggle navigation</span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
   		 </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}">
			<img src="${pageContext.request.contextPath}/resources/core/img/logo-tdv.png" height="30px" alt="Cadastro TDV"/>
		  </a>
		  <c:if test="${not empty usuarioLogado}"> &nbsp;&nbsp;
	        <div class="collapse navbar-collapse">
			    	<ul class="navbar-nav">
			        	<li class="active">
							<a style="color: white;" href="${pageContext.request.contextPath}/" >
								<span class="fa fa-tag" aria-hidden="true"></span>
								Menu1								
							</a>
			            </li>
			            <li>
							<a style="color: white;" href="${pageContext.request.contextPath}/" >
								<span class="fa fa-tag" aria-hidden="true"></span>
								Menu2
							</a>
			            </li> 
			  		</ul>
			  </div>		
		  		<div class = "pull-right" data-ng-show="usuLoginCtrl.isLogged == true">		  
		          <ul class="navbar-nav navbar-right" style="font-family: monospace;">
	          		<li class="dropleft">
		              <a  class="dropdown-toggle" data-toggle="dropdown">
		              		<img src="${pageContext.request.contextPath}/resources/core/img/default-avatar.png" height="18px" class="img-circle" alt=""> 
	<!-- 						<i class="fa fa-user fa-lg"></i>  -->
							<span class="username hidden-xs">${ primeiroNome[0] }</span> 
					  </a>
		              <ul class="dropdown-menu" role="menu"> 
						<li class="dropdown-header">
							Login: <span class="badge"><i class="glyphicon glyphicon-user"></i> ${ usuarioLogado.login }</span>
						</li>
						<li class="dropdown-header">
							CNPJ.: <span class="badge"><i class="glyphicon glyphicon-credit-card"></i> ${ usuarioLogado.cnpjLogado }</span>
						</li>
						<li class="dropdown-header">
							Email: <span class="badge"><i class="glyphicon glyphicon-envelope"></i> ${ usuarioLogado.email }</span>
						</li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">
							<i class="glyphicon glyphicon-phone-alt"></i> Telefones..:
						</li>
						<li class="dropdown-header">
							<span class="badge"><i class="glyphicon glyphicon-earphone"></i> ${ usuarioLogado.telefoneRamal }</span>
						</li>
						<li class="dropdown-header">
							<span class="badge"><i class="glyphicon glyphicon-earphone"></i> ${ usuarioLogado.telefoneCelular }</span>
						</li>
		                <li class="divider"></li>
						<li class="">
							<a href="http://extranet.dellavolpe.com.br:6917/usuario/editsimple/${ usuarioLogado.codigo }" onclick="showDialog(this.href); return false;">
								<i class="glyphicon glyphicon-user"></i> &nbsp; Alterar Perfil...
							</a>
						</li>						
		                <li class="divider"></li> 		                
						<li class="dropdown-header">
							<a href="#" onclick="logout();">
								<i class="glyphicon glyphicon-log-out"></i> &nbsp; Sair
							</a>
						</li>
		              </ul>
		            </li>
		          </ul> 
		         </div> 
		  </c:if>             
      <!--/.nav-collapse -->
	</nav> 
</div>   
    <script type="text/javascript">
    	
	    function showDialog(url) {
	     	var urlLogin = 'http://extranet.dellavolpe.com.br:6917/usuario/usuario/login/set/${  usuarioLogado.codigo }/${ usuarioLogado.cnpjLogado }/000';
	   		url = urlLogin + '?next='+ url;
      		modalSmallShowSimple("Alterar Perfil",'<iframe width="100%" marginHeight=0 marginWidth=0 scrolling=no style="min-height:595px;" frameborder="0" src="'+url+'"></iframe>');
	    }             
    	
	    var modalSmallShowSimple = function(title, body) {
	    	$('#myModalSmallLabel').html(title);
	    	$('#id-modalSmall-body').html(body); 
	    	$('#modalSmall-btn-close').html("Fechar"); 
	    	$('#modalSmall-btn-save').hide();							
	    	$('#myModalSmall').modal('show'); 
	    }; 
    
    </script>    
    