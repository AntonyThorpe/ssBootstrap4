<div id="BlogContent" class="blogcontent container-fluid<% if SideBar %> col-sm-9 col-md-9 col-lg-9<% end_if %>">
    <% include BreadCrumbs %>
    <% if SelectedTag %>
    <div class="selectedTag">
        <em><% _t('VIEWINGTAGGED', 'Viewing entries tagged with') %> '$SelectedTag'</em>
    </div>
    <% else_if SelectedDate %>
    <div class="selectedTag">
        <em><% _t('VIEWINGPOSTEDIN', 'Viewing entries posted in') %> $SelectedNiceDate</em>
    </div>
    <% end_if %>
    <% if BlogEntries %>
    <% loop BlogEntries %>
    <% include BlogSummary %>
    <% end_loop %>
    <% else %>
    <h2><% _t('NOENTRIES', 'There are no blog entries') %></h2>
    <% end_if %>
    <% include BlogPagination %>
</div>
<% if SideBar %>
    <div class="col-sm-3 col-md-3 col-lg-3">
        <% include BlogSideBar %>
    </div>
<% end_if %>