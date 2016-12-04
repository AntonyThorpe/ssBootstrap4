<%--Include SidebarMenu recursively --%>
<% if $Children %>
	<% loop $Children %>
		<li class="nav-item $LinkingMode">
		    <a href="$Link" class="nav-link $LinkingMode" title="$Title">
		        $MenuTitle
		    </a>
		    <% if $Children %>
			    <ul class="nav nav-pills nav-stacked">
			        <% include SidebarMenu %>
			    </ul>
		    <% end_if %>
		</li>
	<% end_loop %>

<% end_if %> 
