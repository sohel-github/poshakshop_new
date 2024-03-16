<div id="furn-head">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="furn-head-top">
                    <div id="lang-curren">
                        <ul class="list-inline d-flex justify-content-lg-start mb-0">
                            @if (get_setting('show_language_switcher') == 'on')
                                <li class="list-inline-item dropdown mr-3" id="lang-change">
                                    @php
                                        if (Session::has('locale')) {
                                            $locale = Session::get('locale', Config::get('app.locale'));
                                        } else {
                                            $locale = 'en';
                                        }
                                    @endphp
                                    <a href="javascript:void(0)" class="dropdown-toggle text-reset py-2" data-toggle="dropdown"
                                        data-display="static">
                                        <img src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            data-src="{{ static_asset('assets/img/flags/' . $locale . '.png') }}"
                                            class="mr-2 lazyload"
                                            alt="{{ \App\Language::where('code', $locale)->first()->name }}" height="11">
                                        <span
                                            class="opacity-60">{{ \App\Language::where('code', $locale)->first()->name }}</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-left">
                                        @foreach (\App\Language::all() as $key => $language)
                                            <li>
                                                <a href="javascript:void(0)" data-flag="{{ $language->code }}"
                                                    class="dropdown-item @if ($locale == $language) active @endif">
                                                    <img src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        data-src="{{ static_asset('assets/img/flags/' . $language->code . '.png') }}"
                                                        class="mr-1 lazyload" alt="{{ $language->name }}" height="11">
                                                    <span class="language">{{ $language->name }}</span>
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </li>
                            @endif

                            @if (get_setting('show_currency_switcher') == 'on')
                                <li class="list-inline-item dropdown" id="currency-change">
                                    @php
                                        if (Session::has('currency_code')) {
                                            $currency_code = Session::get('currency_code');
                                        } else {
                                            $currency_code = \App\Currency::findOrFail(get_setting('system_default_currency'))->code;
                                        }
                                    @endphp
                                    <a href="javascript:void(0)" class="dropdown-toggle text-reset py-2 opacity-60"
                                        data-toggle="dropdown" data-display="static">
                                        {{ \App\Currency::where('code', $currency_code)->first()->name }}
                                        {{ \App\Currency::where('code', $currency_code)->first()->symbol }}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-left dropdown-menu-lg-left">
                                        @foreach (\App\Currency::where('status', 1)->get() as $key => $currency)
                                            <li>
                                                <a class="dropdown-item @if ($currency_code == $currency->code) active @endif" href="javascript:void(0)"
                                                    data-currency="{{ $currency->code }}">{{ $currency->name }}
                                                    ({{ $currency->symbol }})</a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </li>
                            @endif
                        </ul>
                    </div>
                    <div id="new_cart_wish_compaire">
                        <ul class="list-inline mb-0 h-100 d-flex justify-content-end align-items-center">
                            @if (get_setting('vendor_system_activation') == 1)
                            <li class="list-inline-item mr-3 border-right border-left-0 pr-3 pl-0">
                                <a href="{{ url('shops/create') }}" class="text-reset  d-inline-block opacity-60">Sell with us</a>
                            </li>
                            @endif
                            <li class="list-inline-item mr-3 border-left-0 pl-0">
                                <a href="{{ url('track-your-order') }}" class="text-reset  d-inline-block opacity-60">Track Order</a>
                            </li>
                            @auth
                                @if (isAdmin())
                                    <li class="list-inline-item mr-3 border-left-0 pl-0">
                                        <a href="{{ route('admin.dashboard') }}" class="text-reset d-inline-block opacity-60">My
                                            Panel</a>
                                    </li>
                                @else

                                    <li class="list-inline-item mr-3 border-left-0 pl-0 dropdown">
                                        <a class="dropdown-toggle no-arrow text-reset" data-toggle="dropdown"
                                            href="javascript:void(0);" role="button" aria-haspopup="false" aria-expanded="false">
                                            <span class="">
                                                <span class="position-relative d-inline-block">
                                                    <i class="las la-bell fs-18"></i>
                                                    @if (count(Auth::user()->unreadNotifications) > 0)
                                                        <span
                                                            class="badge badge-sm badge-dot badge-circle badge-primary position-absolute absolute-top-right"></span>
                                                    @endif
                                                </span>
                                            </span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg py-0">
                                            <div class="p-3 bg-light border-bottom">
                                                <h6 class="mb-0">{{ translate('Notifications') }}</h6>
                                            </div>
                                            <div class="px-3 c-scrollbar-light overflow-auto " style="max-height:300px;">
                                                <ul class="list-group list-group-flush">
                                                    @forelse(Auth::user()->unreadNotifications as $notification)
                                                        <li class="list-group-item">
                                                            @if ($notification->type == 'App\Notifications\OrderNotification')
                                                                @if (Auth::user()->user_type == 'customer')
                                                                    <a href="javascript:void(0)"
                                                                        onclick="show_purchase_history_details({{ $notification->data['order_id'] }})"
                                                                        class="text-reset">
                                                                        <span class="ml-2">
                                                                            {{ translate('Order code: ') }}
                                                                            {{ $notification->data['order_code'] }}
                                                                            {{ translate('has been ' . ucfirst(str_replace('_', ' ', $notification->data['status']))) }}
                                                                        </span>
                                                                    </a>
                                                                @elseif (Auth::user()->user_type == 'seller')
                                                                    @if (Auth::user()->id == $notification->data['user_id'])
                                                                        <a href="javascript:void(0)"
                                                                            onclick="show_purchase_history_details({{ $notification->data['order_id'] }})"
                                                                            class="text-reset">
                                                                            <span class="ml-2">
                                                                                {{ translate('Order code: ') }}
                                                                                {{ $notification->data['order_code'] }}
                                                                                {{ translate('has been ' . ucfirst(str_replace('_', ' ', $notification->data['status']))) }}
                                                                            </span>
                                                                        </a>
                                                                    @else
                                                                        <a href="javascript:void(0)"
                                                                            onclick="show_order_details({{ $notification->data['order_id'] }})"
                                                                            class="text-reset">
                                                                            <span class="ml-2">
                                                                                {{ translate('Order code: ') }}
                                                                                {{ $notification->data['order_code'] }}
                                                                                {{ translate('has been ' . ucfirst(str_replace('_', ' ', $notification->data['status']))) }}
                                                                            </span>
                                                                        </a>
                                                                    @endif
                                                                @endif
                                                            @endif
                                                        </li>
                                                    @empty
                                                        <li class="list-group-item">
                                                            <div class="py-4 text-center fs-16">
                                                                {{ translate('No notification found') }}
                                                            </div>
                                                        </li>
                                                    @endforelse
                                                </ul>
                                            </div>
                                            <div class="text-center border-top">
                                                <a href="{{ route('all-notifications') }}" class="text-reset d-block py-2">
                                                    {{ translate('View All Notifications') }}
                                                </a>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="list-inline-item mr-3 border-left-0 pl-0">
                                        <a href="{{ route('dashboard') }}"
                                            class="text-reset d-inline-block opacity-60">{{ translate('My Panel') }}</a>
                                    </li>
                                @endif
                                <li class="list-inline-item">
                                    <a href="{{ route('logout') }}"
                                        class="text-reset d-inline-block opacity-60">{{ translate('Logout') }}</a>
                                </li>
                            @else
                                <li class="list-inline-item mr-3 border-left-0 pl-0">
                                    <a href="{{ route('user.login') }}"
                                        class="text-reset d-inline-block opacity-60">{{ translate('Signin') }}</a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="{{ route('user.registration') }}"
                                        class="text-reset d-inline-block opacity-60">{{ translate('Signup') }}</a>
                                </li>
                            @endauth
                        </ul>
                    </div>
                </div>
                <div id="furn-head-middle">
                    <div id="furn-logo">
                       
                        <a class="nav-brand" href="{{ route('home') }}">
                            @php
                                $header_logo = get_setting('header_logo');
                            @endphp
                            @if ($header_logo != null)
                                <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}"
                                    class="mw-100 h-30px h-md-40px" height="40">
                            @else
                                <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}"
                                    class="mw-100 h-30px h-md-40px" height="40">
                            @endif
                        </a>
                    </div>
                    <div id="furn-search">
                        <form action="{{ route('search') }}" method="GET">
                            <div id="furn-search-inner">
                                <input type="text" id="search" name="q" placeholder="{{ translate('I am shopping for...') }}" autocomplete="off" />
                                <button type="submit"><i class="nav-search-icon"></i></button>
                            </div>
                        </form>
                    </div>
                    <div id="acc-link">
                        <div class="d-lg-block ml-3 mr-0">
                            <div class="" id="compare">
                                @include('frontend.partials.compare')
                            </div>
                        </div>

                        <div class="d-lg-block ml-3 mr-0">
                            <div class="" id="wishlist">
                                @include('frontend.partials.wishlist')
                            </div>
                        </div>

                        <div class="d-lg-block  align-self-stretch ml-3 mr-0" data-hover="dropdown">
                            <div class="nav-cart-box dropdown h-100" id="cart_items">
                                @include('frontend.partials.cart')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="header_area">
        <div class="main_header_area animated">
            <div class="container">
                <nav id="navigation1" class="navigation">
                    <div class="nav-header">
                        <a class="nav-brand" href="{{ route('home') }}" id="nav-furn-logo">
                            @php
                                $header_logo = get_setting('header_logo');
                            @endphp
                            @if ($header_logo != null)
                                <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}"
                                    class="mw-100 h-30px h-md-40px" height="40">
                            @else
                                <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}"
                                    class="mw-100 h-30px h-md-40px" height="40">
                            @endif
                        </a>
                        <div class="nav-toggle"></div>
                    </div>
                    <div class="nav-search">
                        <div class="nav-search-button"><i class="nav-search-icon"></i></div>
                        <form action="{{ route('search') }}" method="GET">
                            <div class="nav-search-inner">
                            <input type="text" id="search" name="q" placeholder="{{ translate('I am shopping for...') }}" autocomplete="off" />
                            </div>
                        </form>
                    </div>
                    <div class="nav-menus-wrapper">
                        <ul class="nav-menu align-to-left">
                            @foreach (\App\Category::where('level', 0)->orderBy('order_level', 'desc')->get()->take(11) as $key => $category)
                                @if(count(\App\Utility\CategoryUtility::get_immediate_children_ids($category->id))>0)
                                    <li>
                                        <a href="{{ route('products.category', $category->slug) }}">{{ $category->getTranslation('name') }} </a>
                                        <ul class="nav-dropdown">
                                            @foreach (\App\Utility\CategoryUtility::get_immediate_children_ids($category->id) as $key => $first_level_id)
                                                @if(count(\App\Utility\CategoryUtility::get_immediate_children_ids($first_level_id))>0)
                                                    <li>
                                                        <a href="{{ route('products.category', \App\Category::find($first_level_id)->slug) }}">{{ \App\Category::find($first_level_id)->getTranslation('name') }}</a>
                                                        <ul class="nav-dropdown">
                                                            @foreach (\App\Utility\CategoryUtility::get_immediate_children_ids($first_level_id) as $key => $second_level_id)
                                                                @if(count(\App\Utility\CategoryUtility::get_immediate_children_ids($second_level_id))>0)
                                                                    <li><a href="{{ route('products.category', \App\Category::find($second_level_id)->slug) }}">{{ \App\Category::find($second_level_id)->getTranslation('name') }}</a>
                                                                        <ul class="nav-dropdown">
                                                                            @foreach (\App\Utility\CategoryUtility::get_immediate_children_ids($second_level_id) as $key => $third_level_id)
                                                                                @if(count(\App\Utility\CategoryUtility::get_immediate_children_ids($third_level_id))>0)
                                                                                    <li><a href="{{ route('products.category', \App\Category::find($third_level_id)->slug) }}" target="_blank">{{ \App\Category::find($third_level_id)->getTranslation('name') }}</a>
                                                                                        <ul class="nav-dropdown">
                                                                                            @foreach (\App\Utility\CategoryUtility::get_immediate_children_ids($third_level_id) as $key => $forth_level_id)
                                                                                                <li><a href="{{ route('products.category', \App\Category::find($forth_level_id)->slug) }}" target="_blank">{{ \App\Category::find($forth_level_id)->getTranslation('name') }}</a></li>
                                                                                            @endforeach
                                                                                        </ul>
                                                                                    </li>
                                                                                @else
                                                                                    <li><a href="{{ route('products.category', \App\Category::find($third_level_id)->slug) }}" target="_blank">{{ \App\Category::find($third_level_id)->getTranslation('name') }}</a></li>
                                                                                @endif
                                                                            @endforeach
                                                                        </ul>
                                                                    </li>
                                                                @else
                                                                    <li><a href="{{ route('products.category', \App\Category::find($second_level_id)->slug) }}">{{ \App\Category::find($second_level_id)->getTranslation('name') }}</a></li>
                                                                @endif
                                                            @endforeach
                                                        </ul>
                                                    </li>
                                                @else
                                                    <li><a href="{{ route('products.category', \App\Category::find($first_level_id)->slug) }}">{{ \App\Category::find($first_level_id)->getTranslation('name') }}</a></li>
                                                @endif
                                            @endforeach
                                        </ul>
                                    </li>
                                @else
                                    <li><a href="{{ route('products.category', $category->slug) }}">{{ $category->getTranslation('name') }} </a></li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>



