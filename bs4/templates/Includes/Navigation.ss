<nav class="navbar navbar-light navbar-static-top bg-faded">
    <div class="container">
        <button class="navbar-toggler hidden-sm-up collapsed" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar2" aria-expanded="false" aria-controls="exCollapsingNavbar2" aria-label="Toggle navigation"></button>
        <div class="navbar-toggleable-xs collapse" id="exCollapsingNavbar2" aria-expanded="false" style="">
            <a class="navbar-brand" href="$BaseHref">
                $SiteConfig.Title
            </a>
            <ul class="nav navbar-nav">
                <% loop $Menu(1) %>
                    <li class="nav-item $LinkingMode">
                        <a class="nav-link" href="$Link" title="$Title.XML">$MenuTitle</a>
                    </li>
                <% end_loop %>
                <% if $SearchForm %>
                    <li>
                        $SearchForm
                    </li>
                <% end_if %>
            </ul>
        </div>
    </div>
</nav>
