<%--Include SidebarMenu recursively --%>
<% if $Children %>
	<% loop $Children %>
		<li class="nav-item $LinkingMode">
		    <a href="$Link" class="nav-link $LinkingMode" title="$Title">
		        $MenuTitle
		    </a>
		    <% if $Children %>
			    <ul class="nav flex-column">
			        <% include SidebarMenu %>
			    </ul>
		    <% end_if %>
		</li>
	<% end_loop %>
<% end_if %>
