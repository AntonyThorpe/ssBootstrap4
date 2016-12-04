<%-- https://github.com/XploreNet/bootstripe/blob/master/src/templates/BreadcrumbsTemplate.ss --%>
<% if $Pages %>
	<ol class="breadcrumb">
		<% loop $Pages %>
			<% if $Last %>
				<li class="breadcrumb-item active">$MenuTitle</li>
			<% else %>
				<li class="breadcrumb-item">
					<a href="$Link">$MenuTitle</a>
				</li>
			<% end_if %>
		<% end_loop %>
	</ol>
<% end_if %>
