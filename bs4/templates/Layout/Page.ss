<div <% if $Menu(2) %>class="row aside"<% end_if %>>
	<% if $Menu(2) %>
		<div class="col-sm-3 col-md-3 col-lg-3 sidebar hidden-sm-down">
			<% include SideBar %>
		</div>
	<% end_if %>
	<% if $Menu(2) %>
		<div class="col-sm-8 col-md-8 col-lg-8">
	<% end_if %>

	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>
	</article>
	$Form

	<% if $Menu(2) %>
		</div>
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
	<% end_if %>
</div>