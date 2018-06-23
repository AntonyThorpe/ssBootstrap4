<%--Include SidebarMenu recursively --%>
<ul class="nav flex-column">
    <% loop $Children %>
		<li class="nav-item">
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
