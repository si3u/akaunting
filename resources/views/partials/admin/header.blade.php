<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
        @if (setting('general.admin_theme', 'skin-green-light') == 'skin-green-light')
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><img src="{{ asset('public/img/akaunting-logo-white.png') }}" class="logo-image-mini" width="25" alt="TGS Logo"></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><img src="{{ asset('public/img/akaunting-logo-white.png') }}" class="logo-image-lg" width="25" alt="TGS Logo"> <b>TGS</b></span>
        @else
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><img src="{{ asset('public/img/akaunting-logo-green.png') }}" class="logo-image-mini" width="25" alt="TGS Logo"></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><img src="{{ asset('public/img/akaunting-logo-green.png') }}" class="logo-image-lg" width="25" alt="TGS Logo"> <b>TGS</b></span>
        @endif
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                @permission('read-notifications')
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        @if ($notifications)
                        <span class="label label-warning">{{ $notifications }}</span>
                        @endif
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">{{ trans_choice('header.notifications.counter', $notifications, ['count' => $notifications]) }}</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                @if (count($bills))
                                <li>
                                    <a href="{{ url('auth/users/' . $user->id . '/read-bills') }}">
                                        <i class="fa fa-shopping-cart text-red"></i> {{ trans_choice('header.notifications.upcoming_bills', count($bills), ['count' => count($bills)]) }}
                                    </a>
                                </li>
                                @endif
                                @if (count($invoices))
                                <li>
                                    <a href="{{ url('auth/users/' . $user->id . '/read-invoices') }}">
                                        <i class="fa fa-money text-green"></i> {{ trans_choice('header.notifications.overdue_invoices', count($invoices), ['count' => count($invoices)]) }}
                                    </a>
                                </li>
                                @endif
                                @if (count($items))
                                <li>
                                    <a href="{{ url('auth/users/' . $user->id . '/read-items') }}">
                                        <i class="fa fa-cubes text-red"></i> {{ trans_choice('header.notifications.items_stock', count($items), ['count' => count($items)]) }}
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </li>
                        <li class="footer"><a href="#">{{ trans('header.notifications.view_all') }}</a></li>
                    </ul>
                </li>
                @endpermission
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        @if ($user->picture)
                            @if (setting('general.use_gravatar', '0') == '1')
                                <img src="{{ $user->picture }}" class="user-image" alt="User Image">
                            @else
                                <img src="{{ Storage::url($user->picture) }}" class="user-image" alt="User Image">
                            @endif
                        @else
                            <i class="fa fa-user-o"></i>
                        @endif
                        @if (!empty($user->name))
                            <span class="hidden-xs">{{ $user->name }}</span>
                        @endif
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            @if ($user->picture)
                                @if (setting('general.use_gravatar', '0') == '1')
                                    <img src="{{ $user->picture }}" class="img-circle" alt="User Image">
                                @else
                                    <img src="{{ Storage::url($user->picture) }}" class="img-circle" alt="User Image">
                                @endif
                            @else
                                <i class="fa fa-4 fa-user-o" style="color: #fff; font-size: 7em;"></i>
                            @endif
                            <p>
                                @if (!empty($user->name))
                                {{ $user->name }}
                                @endif
                                <small>{{ trans('header.last_login', ['time' => $user->last_logged_in_at]) }}</small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                                @permission('read-auth-users')
                                <div class="col-xs-4 text-center">
                                    <a href="{{ url('auth/users') }}">{{ trans_choice('general.users', 2) }}</a>
                                </div>
                                @endpermission
                                @permission('read-auth-roles')
                                <div class="col-xs-4 text-center">
                                    <a href="{{ url('auth/roles') }}">{{ trans_choice('general.roles', 2) }}</a>
                                </div>
                                @endpermission
                                @permission('read-auth-permissions')
                                <div class="col-xs-4 text-center">
                                    <a href="{{ url('auth/permissions') }}">{{ trans_choice('general.permissions', 2) }}</a>
                                </div>
                                @endpermission
                            </div>
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            @permission('read-auth-profile')
                            <div class="pull-left">
                                <a href="{{ url('auth/users/' . $user->id . '/edit') }}" class="btn btn-default btn-flat">{{ trans('auth.profile') }}</a>
                            </div>
                            @endpermission
                            <div class="pull-right">
                                <a href="{{ url('auth/logout') }}" class="btn btn-default btn-flat">{{ trans('auth.logout') }}</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
