{{-- <a href="{{ route('wishlists.index') }}" class="d-flex align-items-center text-reset pr-2">
    <div class="wishlist">
        <i class="la la-heart-o la-2x opacity-80"></i>
        <div class="wishlist_content">
            <div class="fs-12">
                <span class="fw-600 text-primary">Wishlist</span>
            </div>
            <div class="fs-10">
                @if(Auth::check())
                    <span class="fw-400 text-primary">{{ count(Auth::user()->wishlists)}} items</span>
                @else
                    <span class="fw-400 text-primary">0 items</span>
                @endif
            </div>
        </div>
    </div>
</a> --}}

    <div class="compare">
        <div class="wishlist_content">
            <div class="fs-12">
                <div class="fs-10">
                    <span class="fw-400 text-primary">
                    Hello, 
                    @auth
                        {{ Auth::user()->name }}
                    @else
                        Login
                    @endauth
                    </span>
                </div>
                <div class="fs-12"><span class="fw-600 text-primary">Your Account</span></div>
            </div>

            <div class="yes-drop">
                <ul>
                    <li id="drop-top">
                        @auth
                            <a href="#" class="d-flex align-items-center text-reset pr-2">
                                <div class="compare mb-2">
                                    <i class="la la-user la-2x"></i>
                                    <div class="compare_content">
                                        <div class="fs-10">
                                            <a href="{{ route('dashboard') }}" class="btn btn-primary btn-xs"><span class="fw-400">My Dashboard</span></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        @else
                            <a href="#" class="d-flex align-items-center text-reset pr-2">
                                <div class="compare mb-2">
                                    <i class="la la-user la-1x"></i>
                                    <div class="compare_content">
                                        <div class="fs-10">
                                            <a href="{{ route('user.login') }}" class="btn btn-primary btn-xs"><span class="fw-400">Login</span></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="compare">
                                    <div class="compare_content">
                                        <div class="fs-10">
                                            New Customer? <a href="{{ route('user.registration') }}" class="btn btn-secondary btn-xs ml-2"><span class="fw-400">Signup</span></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        @endauth
                    </li>
                    <li>
                        <a href="{{ route('compare') }}" class="fw-600 text-primary">Compare</a>
                    </li>
                    <li>
                        <a href="{{ route('wishlists.index') }}" class="fw-600 text-primary">My Wishlist</a>
                    </li>
                    <li>
                        <span class="fw-600 text-primary">Track Your Order</span>
                        <form action="{{ route('orders.track') }}" method="GET" enctype="multipart/form-data">
                            <input type="text" class="form-control mb-1" placeholder="{{ translate('Order Code')}}" name="order_code" required />
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-block" type="submit">Track</button>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>

