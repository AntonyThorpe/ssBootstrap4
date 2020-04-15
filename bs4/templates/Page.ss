<!DOCTYPE html>
<html lang="$ContentLocale">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title><% if MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> | $SiteConfig.Title<% if SiteConfig.Tagline %> - $SiteConfig.Tagline<% end_if %></title>
        $MetaTags(false)
        <% base_tag %>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="application-name" content="<% if MetaTitle %>$MetaTitle<% else %>$Title<% end_if %>">

        <!-- see realfavicongenerator.net -->
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
        <link rel="manifest" href="/site.webmanifest">
        <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
    </head>

    <body class="$ClassName<% if not $Menu(2) %> no-sidebar<% end_if %>" id="$URLSegment">

        <% include Header %>

        <main class="main" role="main">

            <div class="container-fluid <% if $Menu(2) || ClassName = BlogHolder || ClassName = BlogEntry %><% end_if %>" >
                <% include BreadCrumbs %>
                $Layout
            </div>
        </main>
        <% include Footer %>

        <!-- Google Analytics: change UA-XXXXX-Y to be your site's ID. -->
        <!-- <script>
            window.ga = function () { ga.q.push(arguments) }; ga.q = []; ga.l = +new Date;
            ga('create', 'UA-XXXXX-Y', 'auto'); ga('send', 'pageview')
        </script>
        <script src="https://www.google-analytics.com/analytics.js" async defer></script> -->
    
    </body>
</html>
