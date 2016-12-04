<%--Include SidebarMenu recursively --%>
<ul class="nav nav-pills nav-stacked">
	<% loop $Children %>
		<li class="nav-item $LinkingMode">
		    <a href="$Link" class="nav-link $LinkingMode" title="$Title">
		        $MenuTitle
		    </a>
		    <% if $Children %>
			    <ul>
			        <% include SidebarMenu %>
			    </ul>
		    <% end_if %>
		</li>
	<% end_loop %>
</ul>
