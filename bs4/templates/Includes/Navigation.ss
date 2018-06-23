<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <a class="navbar-brand" href="$BaseHref">$SiteConfig.Title</a>
    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="navbarCollapse" style="">
        <ul class="navbar-nav mr-auto">
            <% loop $Menu(1) %>
                <li class="nav-item $LinkingMode">
                    <a class="nav-link" href="$Link" title="$Title">$MenuTitle</a>
                </li>
            <% end_loop %>
        </ul>
        <% if $SearchForm %>
            $SearchForm
        <% end_if %>
    </div>
</nav>
